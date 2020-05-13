%T2013.3

fid=fopen('Allsvenskan2007.txt','r'); %r = read
Rubriker=fgetl(fid); %Skapar en textvariabel med rubriker, fgetL läser den första olästa raden i filen
Streck=fgetl(fid); %Läser andra raden ("Första olästa")

c=fgetl(fid);
a=1;
while c~=-1 %När det inte finns några rader kvar svarar fgetl "-1"
    tabellIText(a,:)=c;
    malSkillnad(a)=str2double(tabellIText(a,end-6:end-4)); %Hitta relevant data
    c=fgetl(fid);
    a=a+1
end
fclose(fid); %Har du fopen måste du ha fclose!
[~,I]=sort(malSkillnad,'descend') %flagga som avgör stigande eller fallande
% ~ innebär att utvariabel inte eftersökes
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