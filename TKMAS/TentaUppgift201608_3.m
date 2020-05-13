%% a)
Olympic=importdata('medaljdata.txt');
OlympicCell=num2cell(Olympic.data);
OlympicNation=struct('Nation',Olympic.textdata(2:length(Olympic.textdata))',...
    'Population',OlympicCell(:,1),'Gold',OlympicCell(:,2),'Silver',OlympicCell(:,3),...
    'Bronze',OlympicCell(:,4));


%% b)
for i=1:length(OlympicNation)
    Inv{i}=OlympicNation(i).Population;
    SumM{i}=OlympicNation(i).Gold+OlympicNation(i).Silver+OlympicNation(i).Bronze;
    medalsperperson{i}=SumM{i}/Inv{i};
    OlympicNation(i).medalsperperson=medalsperperson{i};
end

%% c)
OlympicNation(end+1).Nation='KalmarU';
OlympicNation(end).Population=sum(Olympic.data(:,1));
OlympicNation(end).Gold=sum(Olympic.data(:,2));
OlympicNation(end).Silver=sum(Olympic.data(:,3));
OlympicNation(end).Bronze=sum(Olympic.data(:,4));
OlympicNation(end).medalsperperson=sum(sum(Olympic.data(:,2))+sum(Olympic.data(:,3))+sum(Olympic.data(:,4)))/sum(Olympic.data(:,1));

%% d)
[~,n]=sort([OlympicNation.medalsperperson],'descend');

for i=1:length(OlympicNation)
    fprintf('%s\t%d  \t %02i \t %02i \t %02i \t %0.6f \n',OlympicNation(n(i)).Nation,OlympicNation(n(i)).Population,...
        OlympicNation(n(i)).Gold,OlympicNation(n(i)).Silver,OlympicNation(n(i)).Bronze,...
        OlympicNation(n(i)).medalsperperson);
end
