clear all
clc

%% a)
fid=fopen('Deathcount.txt');
c=fgetl(fid);
N=1;
while c~=-1
    Assassin(N).Rank=str2double(c); %ett c sätts här istället för fgetl(fid) eftersom c redan har plockat ut ett årtal
    Assassin(N).Deathcount=str2double(fgetl(fid));
    Assassin(N).Name=fgetl(fid);
    Assassin(N).Year=str2double(fgetl(fid));
    c=fgetl(fid);
    N=N+1;
end
fclose(fid);

%% b)
q=1;
for i=1:length(Assassin)
    if Assassin(i).Year >= 2000
        Assassin2000(q).Rank=q;
        Assassin2000(q).Deathcount=Assassin(i).Deathcount;
        Assassin2000(q).Name=Assassin(i).Name;
        Assassin2000(q).Year=Assassin(i).Year;
        q=q+1;
    end
end
N=1;
for r=1:length(Assassin2000)
    if r > 1&&Assassin2000(r).Deathcount~=Assassin2000(r-1).Deathcount
        N=r;
    end
    fprintf('%d\t%d\t%s (%d) \n',N,Assassin2000(r).Deathcount,Assassin2000(r).Name,Assassin2000(r).Year);
end
