function y=myfun(x)
y=x.^2+sin(x)-32+18.*x;
%F�r att f� tag p� den skapar vi sedan ett funktionhandtag
%I command window
f=@myfun;
%Skulle kunna ha skrivit: f=@(x)(x.^2+sin(x)-32+18.*x)
%Detta kallas f�r anonym funktion
f(0),f(1),f(2.34)
%� vad smidigt!
%Syntax f�r olika variabeltyper
%Vektor: a(2) (Position i lista)
%Textstr�ng: mintext(2) (Position i lista)
%funktionsgandtag: f(2) (Precis som i funktionsfil)
