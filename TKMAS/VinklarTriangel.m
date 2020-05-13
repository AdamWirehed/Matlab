%Vinklartrianglar

%Input-del
a=3;
b=4;
c=5;

%Beräkningsdel
A=acos((a.^2-b.^2-c.^2)/(-2.*b*c));
B=acos((b.^2-a.^2-c.^2)/(-2.*a*c));
C=acos((c.^2-b.^2-a.^2)/(-2.*b*a));

%Output-del
a
b
c
A
B
C

