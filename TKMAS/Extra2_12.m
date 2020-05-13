function Extra2_12(MatrixA,MatrixB)
    
    
    if length(MatrixA)==length(MatrixB)
        C=zeros(size(MatrixA));
        for n=1:length(MatrixA)
            for i=1:length(MatrixA)
                C(n,i)=MatrixA(n,i).*MatrixB(n,i);
            end
        end
        C
    else
        error('Matrix dimensions must agree');
    end
    
    