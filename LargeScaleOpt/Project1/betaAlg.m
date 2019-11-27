close all;
clear all;

%%

run p10.m;
notDone = 0;

while(notDone == 0)
t = 0;
n = dimX*dimY*2; % Amount of nodes
theta0 = 2;
u = 1/n*ones(n, 1);

iter = 1000;

h = zeros(1, iter);
xBar = zeros(n, k);
a = 0;
aBar = 0;
LDB = 0;
cMax = 0;
epsi = 0.001;

    for t = 1:iter

        if iter <= 50
            xBar = zeros(n, k);
        end

        gam = zeros(n, 1);

        nl = gsp(dimX, dimY, u, k, com);
        [newnl, okcom] = subproblem(dimX, dimY, nl, u, k, com);

        h(t) = sum(u) + length(okcom) - sum(u(newnl));

        sNewNl = [newnl; 0];

        sum_gam = 0;
        for i = 1:n
            gam(i) = 1 - sum(newnl == i);
        end

        aOld = a;
        a = theta0*(h(t) - LDB)/(sum(gam.^2));

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

                % Since okcom is the index of the contact pair
                xBar(:, okcom(i)) = xBar(:, okcom(i)) + (aOld/aBar).*tmpX;
            end
        end

        lastnl = [];
        new_w = sum(xBar, 2);  

        % Creating the new weight matrix based on xBar 
        ergod_w = xBar;
        ergod_w = ergod_w + epsi;
        ergod_w = 1./ergod_w;
        ergod_w(ergod_w >= 100) = 100;

        for k = 1:length(com)
            nWay = gsp(dimX, dimY, ergod_w(:, k), 1, com(k, :));
            %nWay = gsp(dimX, dimY, new_w, 1, com(k, :));
            lastnl = [lastnl; nWay];
            if k ~= length(com);
                ergod_w(nWay, k:end) = 10000;
                %new_w(nWay) = 10;
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
            %fprintf("Not primal feasible for %d contact pairs! \n", length(okcom));
            %fprintf("Node %d is used more than once \n", dix);

        else
            if cMax < length(okcom)
                fprintf("Primal feasible for %d contact pairs! \n", length(okcom));
                LDB = length(okcom);    % Improving lower bound
                uFeas = u;
                nlFeas = newnl;
                cpFeas = okcom;
                cMax = length(okcom);
                
                if(cMax >= 16)
                    notDone = 1;
                end
            end
        end
    end
end


newOkCom = com(cpFeas, :);

figure;
visagrid(dimX, dimY, nlFeas, newOkCom, uFeas, 25);

figure;
plot(1:iter, h, '.');



