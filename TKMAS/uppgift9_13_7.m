clear all

format long
x=1:10;
for i=1:10
    for j=1:10
        V(i,j)=x(i).^(10-j);
    end
end
cond(V);
S=det(V)*det(V^-1);
S