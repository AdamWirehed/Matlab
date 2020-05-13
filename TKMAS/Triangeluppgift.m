%Trianglar

%Input-del
z=2.3;
b=3.4;
C=34;

%Beräkningsdel
c=sqrt(z.^2+b.^2-2.*z.*b.*cosd(C))
O=z+b+c
A=(z.*b.*sind(C))/2

%Output-del
z
b
C
c
O
A
