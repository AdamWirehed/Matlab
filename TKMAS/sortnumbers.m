function y=sortnumbers(x)
for n=1:length(x)
    for i=1:(length(x)-1)
        if x(i)>x(i+1)
            c=x(i);
            x(i)=x(i+1);
            x(i+1)=c;
        end
    end
end
y=x;