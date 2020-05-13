function s=LinLV5Spegling(x,A,B,C,D)
norm=sqrt(A.^2+B.^2+C.^2);
a=A/norm; b=B/norm; c=C/norm; d=D/norm;
normal=[a;b;c];
i=size(x);
for n=1:i(1,2)
    s(:,n)=x(:,n)+2*(d-dot(x(:,n),normal))*normal;
end