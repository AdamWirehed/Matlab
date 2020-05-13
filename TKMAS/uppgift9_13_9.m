format short

a=pi/6;
B=pi/3;
W3=100;

A=[0 sin(a) 0 1 0 0
    1 cos(a) 0 0 0 1
    0 0 sin(B) 0 1 0
    -1 0 -cos(B) 0 0 0
    0 -sin(a) -sin(B) 0 0 0
    0 -cos(a) cos(B) 0 0 0];
b=[0; 0; 0; 0; W3; 0];

I=A\b;
I