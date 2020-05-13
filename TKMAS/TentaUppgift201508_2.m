%% a)
Data=fileread('webbfil.html');

%% b)
%se getstr

%% c)
lodjurI=strfind(Data,'Lodjur');
for i=1:length(lodjurI)/2
    Lank{i}=getstr(Data,lodjurI(2*i-1),'"','"');
end