function andragradsf(p,q)

%Beräkningsdel
x1=-p/2-sqrt((p/2)^2-q);
x2=-p/2+sqrt((p/2)^2-q);

%Output-del
fprintf(['Rotterna till ekvationen är x1=' num2str(x1) ' och x2=' num2str(x2)])
