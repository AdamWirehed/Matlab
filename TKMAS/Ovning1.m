%x=linspace(0,10), y=sin(x), plot(x,y) %med kommatecken processerar MatLab varje kommando f�r sig

%x=linspace(0,10); y=sin(x); plot(x,y) %med semikolon processerar MatLab alla kommandon tillsammans

s=0;
for i=1:10
    s=s+i;
end

disp('Summa �r')
disp(s)