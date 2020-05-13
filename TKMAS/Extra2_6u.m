F=fopen('Extra2_6.txt', 'r');
Rad1=fgetl(F);
fclose(F);
t=[];

for y=1:length(Rad1)
    r=Rad1(1,y)
    if r=='a'
       t=[t 'b'];
    else
        t=[t r];
    end
end

t






