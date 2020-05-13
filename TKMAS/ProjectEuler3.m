%ProjectEuler3

%Input-del
N=600851475143;
R=[];
u=2;
x=2
%Beräkningsdel
while u<sqrt(N)
    if mod(N,u)==0;
       if mod(u,x)~=0
            x=x+1
       end
       R=[R,u]
    end
    u=u+1;
end

%Output-del
R
    