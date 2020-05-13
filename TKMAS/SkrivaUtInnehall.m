filetree=dir
%length(filetree)
%filetree(3).name

%DON'T RUN THIS
for n=1:length(filetree)
    if ~filetree(n).isdir
        s=fileread(filetree(n).name);
        fprintf('**fil.nummer %03i (%s): \n \n %s \n',...
            n,filetree(n).name,s);
    end
end
