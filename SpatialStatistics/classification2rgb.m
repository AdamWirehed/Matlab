function I = classification2rgb(z, RGB)
%CLASSIFICATION2RGB Summary of this function goes here
%   Detailed explanation goes here

s = size(z)
rows = s(1); cols = s(2); K = s(3);
I = zeros([rows cols 3]);


for r = 1:rows
    for c = 1:cols
        sumK = 0;
        for k = 1:K
            sumK = sumK + z(r,c,k)*RGB(k, :);
            
        end
        
        I(r,c,:) = sumK;
    end
end

end

