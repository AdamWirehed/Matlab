%% a)
%se MinPiRaknare.m

%% b)
tol=zeros(1,14);P=tol;              % F�rdefiniera tol och P

for a=1:14
    tol(a)=10.^-a;       % 1E-1 t o m 1E-14
    P(a)=MinPiRaknare(tol(a));      % R�kna ut Pi-approximationen
end
loglog(tol,abs(P-pi),'-sq');        %Loglog-plot
xlabel('tol');                      
ylabel('|P-\pi|')

%% c)
