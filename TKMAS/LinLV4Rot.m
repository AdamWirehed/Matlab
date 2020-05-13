function R=LinLV4Rot(v,vinkel)
M=[cos(vinkel) -sin(vinkel) 0; sin(vinkel) cos(vinkel) 0; 0 0 1];
u=[v(2);-v(1);0]; w=[v(1)*v(3);v(2)*v(3);-(v(1).^2+v(2).^2)];
    f1=u/norm(u); f2=w/norm(w); f3=v/norm(v);
    P=[f1 f2 f3];
R=P*M*inv(P);
