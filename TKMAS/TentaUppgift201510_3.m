A=[1/2 0 0 5/8;
    1/5 -1 0 3/10;
    -3/10 1/10 -1 0;
    26 120 250 35];
b=[30; -4; -2; 4000];

x=A\b

fprintf('Familjen kan i snitt köpa %0.2f legoaskar i månaden \n',x(3));
    