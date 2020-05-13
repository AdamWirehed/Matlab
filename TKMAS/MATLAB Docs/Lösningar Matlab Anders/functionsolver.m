function sol=functionsolver(fun) %FEL #1: function saknas.
% FUNCTIONSOLVER: Utv�rderar funktioner.
%
%   FUNCTIONSOLVER Ger, givet en funktion fun, information om
%   dess derivata, dess nollst�llen, station�ra punkter och
%   integral i ett givet intervall och skickar ut informationen
%   i ett struct-objekt.
%
%   INPUT:  fun - funktionshandtag till aktuell funktion
%           interval - interval (f�r plot)
%
%   OUTPUT: sol - l�snings-struct.
%
%   CALL: sol=functionsolver(fun,interval)

%% Initiera l�sningsstrukt
sol.funktion=fun;

%% Utf�r ber�kningar m h a symbolisk toolbox
syms x;
f=fun(x);
df=diff(f);
F=int(f);

%% Skicka ut den �nskade datan.
sol.derivata=@(x)eval(subs(df,x));
sol.integral=@(x)eval(subs(F,x));
sol.nollpunkter=sort(eval(solve(f))); %FEL #2: ( Saknas.
sol.stationspunkter=sort(eval(solve(df)));


