%2:agradsl�sare
%Input-del: a.*x.^2+b.*x+c=0;
a=2;
b=4; 
c=-7;

%Ber�kningsdel (1) Skriv om p� x^2+px+q=0 -form
%(2) Anv�nd pq-formeln p=b/a; q=c/a; %Antar att a~=0
q=c/a;

p=b/a;

x(1)=-p/2+sqrt(p^2./4-q);
	
x(2)=-p/2-sqrt(p^2./4-q);

%Output-del
x

