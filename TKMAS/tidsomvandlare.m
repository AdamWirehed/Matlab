function vdtms=tidsomvandlare(s)
tic
S0=s;
VecM=604800;
DagM=86400;
TimM=3600;
MinM=60;
vec=0;
dag=0;
tim=0;
min=0;

while s >= VecM
    s=s-VecM;
    vec=vec+1;
end

while s >= DagM
    s=s-DagM;
    dag=dag+1;
end

while s > TimM
    s=s-TimM;
    dag=dag+1;
end

while s >= MinM
    s=s-MinM;
    min=min+1;
end

fprintf('%d sekunder motsvarar %d veckor %d dagar %d timmar %d minuter och %i sekunder \n',S0,vec,dag,tim,min,s);
toc