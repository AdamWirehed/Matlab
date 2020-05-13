function y=plockaut(x)
    y=[];
    for i=1:length(x)
        if mod(x(i),3)~=0&&mod(x(i),4)~=0&&mod(x(i),5)~=0
            y=[y x(i)];
        end
    end