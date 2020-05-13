fid=fopen('Allsvenskan2007.txt');
Kategorier=fgetl(fid);
Streck=fgetl(fid);
a=1;
c=fgetl(fid);
while c~=-1
    tabell(a,:)=c;
    Malskillnad(a)=str2double(tabell(a,end-6:end-4));
    c=fgetl(fid);
    a=a+1;
end
fclose(fid);