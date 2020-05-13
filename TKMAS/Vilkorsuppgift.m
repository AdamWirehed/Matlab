%Vilkorsuppgift

%Input-del
x1=1;
x2=1;
y1=1;
y2=-2;

%Beräkningsdel
    V=atand((y2-y1)/(x2-x1));
    d=sqrt((y2-y1)^2+(x2-x1)^2);
if 0<=V
    
%Output-del
    x1
    x2
    y1
    y2
    V
    d
    
else
    x1
    x2
    y1
    y2
    V+360
    d

end

    