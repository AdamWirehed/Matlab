%Loopuppgift

%Input-del
N=999
asum=0;
bsum=0;
csum=0;

%Berkäningsdel
for b=5:5:N,
    b
    bsum=bsum+b;
end

for a=3:3:N,
    a
    asum=asum+a
end

for c=15:15:N
    c
    csum=csum+c
end

%Output-del
F=asum+bsum-csum
F

