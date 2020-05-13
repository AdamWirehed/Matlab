%% Uppgift1
%
% Anonym tentamenskod: FACIT
%
% Datornummer: 
% 
% Tentamensdatum: 2016-10-25
%
% Beskrivning av Uppgift1:
% Nedanstående program ....
% 
%
%
clear variables;close all;

%% a)
%Se funktionsfil "functionsolver"

%% b) 
f=@(x)(x.^3/10+3*x+25*sin(x));
fData=functionsolver(f);

%% c)
gaf=subplot(3,1,1);hold on;
[x,y] = fplot(fData.funktion,[-2*pi 2*pi]);
plot(x,y,'lineWidth',1.2);axis tight;
ylabel('f(x)');

gadf=subplot(3,1,2);
[x,y] = fplot(fData.derivata,[-2*pi 2*pi]);
plot(x,y,'lineWidth',1.2);axis tight;
ylabel('df/dx');

gaIf=subplot(3,1,3);
[x,y]  = fplot(fData.integral,[-2*pi 2*pi]);
plot(x,y,'lineWidth',1.2);axis tight;
ylabel('F(x)');xlabel('x');

%% d)
startpoints=[-6 -4 0 3 6];
for a=1:length(startpoints)
    fData.nollpunkter(a)=fzero(fData.funktion,startpoints(a));
    fData.stationspunkter(a)=fzero(fData.derivata,startpoints(a));
end

fData.stationspunkter=unique(fData.stationspunkter);
sp=fData.stationspunkter;
plot(gaf,sp,f(sp),'k+','LineWidth',1.2,'MarkerSize',7);

fData.nollpunkter=unique(fData.nollpunkter);
np=fData.nollpunkter;
plot(gaf,np,0,'ko','LineWidth',1.2,'MarkerSize',7,'MarkerFaceColor','r');

%% e)
I=fData.integral(2*pi)-fData.integral(-2*pi);
disp(num2str(I,'%3.1f'))
%(Funktionen är antisymmetrisk. Integralen är alltså noll.)