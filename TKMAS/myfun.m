function y=myfun(x)
y=x.^2+sin(x)-32+18.*x;
%För att få tag på den skapar vi sedan ett funktionhandtag
%I command window
f=@myfun;
%Skulle kunna ha skrivit: f=@(x)(x.^2+sin(x)-32+18.*x)
%Detta kallas för anonym funktion
f(0),f(1),f(2.34)
%Å vad smidigt!
%Syntax för olika variabeltyper
%Vektor: a(2) (Position i lista)
%Textsträng: mintext(2) (Position i lista)
%funktionsgandtag: f(2) (Precis som i funktionsfil)
