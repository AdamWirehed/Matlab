dimX = 50;
dimY = 19;



com = [
        1   2;
        2   6;
        3   33
        5   7;
        7   42;
        8   12; 
       34   32;
       11   35;
       13   31;
       15   25; 
       16   11; 
       19   5; 
       22   4; 
       21   21; 
       24   40; 
       25   20; 
       18   19;  
       27   9; 
       29   14; 
       30   1;
       32   36;
       35   48;
       36   29;
       39   24;
       40   41;
       42   18;
       43   50;
       44   44;
       45   46;
       48   15;
       50   49;
       38   38
        ];
    
k = length(com);
       
[uv,~,idx] = unique(com(:,2));
n = accumarray(idx(:),1);
[uv, n];

com(:,2) = com(:,2) + dimX * (dimY - 1);