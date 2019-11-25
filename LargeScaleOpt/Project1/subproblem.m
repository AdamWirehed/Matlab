function [newnl, okcom] = subproblem(dimX, dimY, nl, u, k, com)
    
newnl = [];
okcom = [];

last = 0;
    for i = 1 : k;
        first = last+1;
        slask = find(nl(last+1:length(nl)) == com(i,1)); last = slask(1)+first-1;
        if (sum(u(nl(first:last))) < 1)
                okcom = [okcom i]; newnl = [newnl; nl(first:last)];
        end
    end

end

