function myReply=isonpage(fileName,searchWord)

text=fileread(fileName);
k=strfind(text,searchWord);
myReply=~isempty(k);