function [a] = adjnodes(i,X,Y)
    U = 1:X*Y;
    U = reshape(U,X,Y);
    U = U';
    L = X*Y+1:2*X*Y;
    L = reshape(L,Y,X);
    L = L';
    a = [];
    
    if i <= X*Y && i > 0
        if mod(i,X) == 0
            a = [i-1, L(i)];
        else if mod(i,X) == 1
            a = [i+1, L(i)];
            else
                a = [i-1, i+1, L(i)];
            end
        end
    end
    
    if i > X*Y && i <= 2*X*Y
        if mod(i - X*Y,Y) == 0
            a = [i-1,U(i-X*Y)];
        else if mod(i - X*Y,Y) == 1
            a = [i+1,U(i-X*Y)];
            else
                a = [i-1, i+1, U(i-X*Y)];
            end
        end
    end
end
            
        
        

        