%========================================================
% Uppgift 2b: G_funk.m
%
% Datornummer=Anonym tentamenskod:
% 
% Tentamensdatum: 2013-08-23
%
%========================================================

function G=G_funk(t)

fun_hand=@(s) exp(-(s-0.2).^2);

G=quad(fun_hand,0,-t);