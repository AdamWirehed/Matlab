%% a)
F1=1;
F2=1;
F=0;
JT=[];
T=4000000;
while F1<T&&F2<T
    F=F2+F1;
    F1=F2;
    F2=F;
    if mod(F,2)==0
        JT=[JT F];
    end
end
S=sum(JT);

%% b)
msgbox(sprintf('Summan av alla jämna fibonaccital under %d är %d. \n',T,S),'Uppgift3'); 