clear variables

data=fileread('goth1930mam.html');
LinkList=regexp(data,'..formatsträng..','names');
validLinkList=...;

searchWord=input('Sök efter: ','s');

foundOnPage=[];
for n=1:length(validLinkList)
    if isonpage(validLinkList(n).link,searchword)==1
        foundOnPage=[foundOnPage n];
    end
end

fprintf('Resultat: n');
for n=foundOnPage
    fprintf('%s \n',validLinkList);
end
