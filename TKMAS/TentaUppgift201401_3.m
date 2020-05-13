%% a)
NSvang=importdata('EigenFreq.txt');

%% b)
for n=1:length(NSvang)
    Med{n}=sum(NSvang(:,n))/length(NSvang(:,n));
    Std{n}=std(NSvang(:,n));
end

%% c)
[maxV,maxK]=max(NSvang(1,:));
[minV,minK]=min(NSvang(1,:));
fprintf('Blad %02i har högst naturlig svängningsfrekvens på %3.1f Hz. Blad %02i har lägst, på %3.1f Hz. Skillnaden dem emellan ar alltså %3.2f Hz. \n',maxK,maxV,minK,minV,maxV-minV);
