linjeTyp={'b-','r--','k:'};
hold on;
for a=1:3
    fplot(@(x)sin(a.*x),[0 2*pi],linjeTyp{a});
end