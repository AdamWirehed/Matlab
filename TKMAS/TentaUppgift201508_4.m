%% a)
%function felstavat och bytte plats p� a=a+1; till efter fakultet
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
fprintf('Tiden f�r den "vanliga" fakultetfunktionen �r %0.5fs,\n och tiden f�r den rekursivafakultetfunktionen �r %0.5fs.\n Att den rekursiva tar l�ngre tid beror p� att funktionen m�ste anropa sig sj�lv\n varje g�ng den ska r�kna ut ett nytt tal f�r att ta reda p� vilket v�rde det f�reg�ende\n talet hade. \n',F1tid,RFtid);
