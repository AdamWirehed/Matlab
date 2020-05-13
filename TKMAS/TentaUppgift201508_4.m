%% a)
%function felstavat och bytte plats på a=a+1; till efter fakultet
%multiplikationen

%% b)
%se rekursivfakultet

%% c)
tic
F1=fakultet2(1e3);
F1tid=toc;

tic
RF=rekursivfakultet(1e3);
RFtid=toc;
fprintf('Tiden för den "vanliga" fakultetfunktionen är %0.5fs,\n och tiden för den rekursivafakultetfunktionen är %0.5fs.\n Att den rekursiva tar längre tid beror på att funktionen måste anropa sig själv\n varje gång den ska räkna ut ett nytt tal för att ta reda på vilket värde det föregående\n talet hade. \n',F1tid,RFtid);
