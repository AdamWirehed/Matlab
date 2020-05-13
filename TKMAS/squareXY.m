
%I funktionsfil squareXY.m
function z=squareXY(x,y)
z=zeros(length(x),length(y)); %Skapar en nollvektor med samma storlek som x och y
for i=1:length(x)
       for j=1:length(y)
           z(i,j)=x(i)^2 + y(j)^2;
       end
end