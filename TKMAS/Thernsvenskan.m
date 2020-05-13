%T2013.3

fid=fopen('Allsvenskan2007.txt','r'); %r = read
Rubriker=fgetl(fid); %Skapar en textvariabel med rubriker, fgetL l�ser den f�rsta ol�sta raden i filen
Streck=fgetl(fid); %L�ser andra raden ("F�rsta ol�sta")

c=fgetl(fid);
a=1;
while c~=-1 %N�r det inte finns n�gra rader kvar svarar fgetl "-1"
    tabellIText(a,:)=c;
    malSkillnad(a)=str2double(tabellIText(a,end-6:end-4)); %Hitta relevant data
    c=fgetl(fid);
    a=a+1
end
fclose(fid); %Har du fopen m�ste du ha fclose!
[~,I]=sort(malSkillnad,'descend') %flagga som avg�r stigande eller fallande
% ~ inneb�r att utvariabel inte efters�kes
% [A,I]=sort(x); x=[3;1;2]
% x(I)=A I=[2;3;1] A=[1;2;3]

%Skriva till ny fil
fid2=fopen('Thernsvenskan2007.txt', 'w');
fprintf(fid2,[Rubriker '\n']);
fprintf(fid2,[Streck '\n']);
for a=1:length(malSkillnad)
    fprintf(fid2,[tabellIText(I(a),:),'\n']);
end
fclose(fid2);