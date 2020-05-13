%% a)

[~,~,Ny]=xlsread('CWTS-lijst.xls');
Ny(1,:)={'Fullständig titel','Förkortning','ISSN','JFIS','CPP per tidsskrift enligt JCSm','Status'};
%xlswrite('CWTS-lista.xls',Ny);

%% b)
Ny(2:end,:)=flipud(sortrows(Ny(2:end,:),5));
xlswrite('CWTS-lista.xls',Ny);

%% c)

for n=2:length(Ny)
    F=strfind(lower(Ny{n,1}),'mechanics');
    if F~=0
        break
    end
end
fprintf('Publicera %s \n',Ny{n,1});


