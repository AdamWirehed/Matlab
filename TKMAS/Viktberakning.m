%Viktberäkning

den=400; %kg/m^2
%Definiera klossarna - försöker vektoriellt
L=[10 10 10];
b=[10 10 10];
h=[20 20 10];
form=[1 2 1];

%Omräkning cm -> m
L=L*1e-2;b=b*1e-2;h=h*1e-2;
m=zeros(size(b)); %Skapar en nollvektor med samma storlek som b
for a=1:length(m)
    if form(a)==2  %Om vi har ett prisma
        m(a)=((L(a)*b(a)*h(a))/2)*den;
    elseif form(a)==1 %Om vi har rätblock
        m(a)=L(a)*b(a)*h(a)*den;
    end
end
        
