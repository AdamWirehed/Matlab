clear all

n=10000; %storlek pa problmet
A=rand(n); %Matris med blndade varden mellan 0 och 1
b=rand(n,1); %vektor -"-
tic
x=inv(A)*b;
tid1=toc;

clear x

tic
x=A\b;
tid2=toc;

fprintf('Med inv tar det %fs. Med \\ tar det %fs.\n',tid1,tid2)
%fprintf formatterad utskrifts-funktion
%fs.=stoppa in ett flytttal (värdet på den första variabeln dvs. tid1)
%\\ Två backslash blir ett backslash i utskrift
%\n. = Radbrytning, Annars kommer kommand (>>) direkt efter
