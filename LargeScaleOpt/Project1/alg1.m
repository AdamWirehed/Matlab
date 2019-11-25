close all;

%%

notDone = 0;

while notDone == 0
    t = 0;
    n = dimX*dimY*2; % Amount of nodes
    theta0 = 2;
    u = 1/n*ones(n, 1);

    iter = 1000;

    h = zeros(1, iter);
    xBar = zeros(n, k);
    a = 0;
    aBar = 0;


    for t = 1:iter

        gam = zeros(n, 1);

        nl = gsp(dimX, dimY, u, k, com);
        [newnl, okcom] = subproblem(dimX, dimY, nl, u, k, com);

        h(t) = sum(u) + length(okcom) - sum(u(newnl));

        sNewNl = [newnl; 0];

        sum_gam = 0;
        for i = 1:n
    %         adj = adjnodes(i, dimX, dimY);      % Adjecent nodes to node i
    %         ix = find(i == newnl);              % Indices of node i in path
    %         sum_gam = sum(sum(sNewNl(ix+1) == adj));    % Checks if xij is a.
            gam(i) = 1 - sum(newnl == i);
        end

        aOld = a;
        a = theta0*(h(t) - 0)/(sum(gam.^2));

        myt = zeros(1, n);  % Weights

        for i = 1:n
            sub = u(i) - a*gam(i);
            myt(i) = a*gam(i);

            if sub > 0          % Updating u
                u(i) = sub;

            else
                u(i) = 0;
            end
        end

        if mod(t, 10) == 0
            theta0 = theta0*0.95;
        end

        aBar = aBar + aOld;

        if aBar ~= 0
            xBar = ((aBar - aOld)/aBar).*xBar;

            ix = 0;

            for i = 1:length(okcom)
                si = ix(1) + 1;
                sn = com(okcom(i), 1);  % Gets the starting node for contact pair i
                ix = find(ismember(newnl(si:end), sn)) + (si - 1);

                tmpnl_k = newnl(si:ix(1)); % newnl vector for connecting pair i
                tmpX = zeros(n, 1);
                tmpX(tmpnl_k) = 1;

                xBar(:, i) = xBar(:, i) + (aOld/aBar).*tmpX;
            end
        end  
        % Make problem solution feasible with help of xBar
    end

    lastnl = [];
    new_w = sum(xBar, 2);
    new_w(1:7) = 100;

    for k = 1:length(com)
        nWay = gsp(dimX, dimY, new_w, 1, com(k, :));
        lastnl = [lastnl; nWay];
        if k ~= length(com);
            new_w(nWay) = 100;
        end

    end

    % Calculate cost per route; remove route with
    % cost > 1 (required routes stored in nl and pairs in com)
    last = 0;
    okcom = [];
    newnl = [];
    for i = 1 : k;
        first = last+1;
        slask = find(lastnl(last+1:length(lastnl)) == com(i,1)); last = slask(1)+first-1;
        if (sum(u(lastnl(first:last))) < 1)
            okcom = [okcom i]; newnl = [newnl; lastnl(first:last)];
        end
    end

    % Just creating a new okcom that is the right format for "visagrid"

    [v, w] = unique( newnl, 'stable' );
    dix = setdiff( 1:numel(newnl), w );

    if ~isempty(dix)
        fprintf("Not primal feasible for %d contact pairs! \n", length(okcom));
        fprintf("Node %d is used more than once \n", dix);

    else
        fprintf("Primal feasible for %d contact pairs! \n", length(okcom));
        notDone = 1;
    end
end

newOkCom = com(okcom, :);

figure;
visagrid(dimX, dimY, newnl, newOkCom, u, 25);

figure;
plot(1:iter, h, '.');



