clear all
clear variabels
clear workspace
clc

fid=fopen('NamnLista.txt');
NamnLista=cell(1,20);
for n=1:20
    Namn=fgetl(fid);
    NamnLista{n}=Namn;
end
NamnLista{end+1}='Daniel Pettersson';

fclose(fid);

for n=1:3
    Rand{n}=randi([1 length(NamnLista)],1);
    P{n}=NamnLista(Rand{n});
    NamnLista(Rand{n})=[];
    if strcmpi(P{n},'Daniel Pettersson')
        disp('Vi anser att Daniel är för bra för att vara delaktig i skolans styre, så vi tar bort honom');
        P{n}=[];
    end
end
fprintf('De tre eleverna är: %s %s och %s \n', cell2mat(P{1}), cell2mat(P{2}), cell2mat(P{3}))


    
