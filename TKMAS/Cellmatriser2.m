funktionsData={@(x)sin(x),@(x)sin(2*x),@(x)sin(3*x);
                   'b-',    'r--',      'k:'};
hold on;
for a=1:3
    fplot(funktionsData{1,a},[0 2*pi], funktionsData{2,a});
end