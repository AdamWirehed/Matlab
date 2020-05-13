A=[3 1 -1;2 1 -3;4 2 -2];
b=[1;-2;1];
x=A\b;
msgbox(sprintf('x=%1.2f \ny=%1.2f \nz=%1.2f \n',x(1),x(2),x(3)));