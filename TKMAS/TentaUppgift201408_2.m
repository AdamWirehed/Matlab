%% a)
%se stensax.m

%% b)
MittSvar=input('Vad v�ljer du? Sten,sax eller p�se? \n');
if strcmpi(MittSvar,'Sten')
    MittN=1;
elseif strcmpi(MittSvar,'Sax')
    MittN=2;
else
    MittN=3;
end
[R,Dator]=stensax;
Vinn={'P�se','Sten','Sax'};
Disp{1}='Sten'; Disp{2}='Sax'; Disp{3}='P�se';
clc

for n=1:3
    D=fprintf('%s! \n',Disp{n});
    if n==3
        fprintf('Du valde %s! \n',MittSvar);
        fprintf('Datorn v�ljer: %s! \n',Dator);
        if strcmpi(MittSvar,Vinn(R))
            fprintf('\nGrattis! Du vann! \n');
        elseif strcmpi(Dator,Vinn(MittN))
            fprintf('\nDu f�rlora.. \n');
        else
            fprintf('\nOavgjort! \n');
        end
    else
    pause(1.25);
    clc
    end
end