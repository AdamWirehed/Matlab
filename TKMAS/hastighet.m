%s=milifurlong
%t=mikrofortnight
mikrofortnight=1.2096; %sekunder
millifurlong=0.201168; %m

load('Lopresultat.txt');
Resultat=zeros(size(Lopresultat));
Resultat=Lopresultat;
Tid=Resultat(:,3)*millifurlong;
Stracka=Resultat(:,2)*mikrofortnight;

for n=1:length(Tid)
    Fart{n}=(Stracka(n)/Tid(n));
end

person(1).namn='Alv nr 1';
person(1).stracka=Stracka(1);
person(1).tid=Tid(1);
person(1).fart=Fart(1);

person(2).namn='Alv nr 2';
person(2).stracka=Stracka(2);
person(2).tid=Tid(2);
person(2).fart=Fart(2);

person(3).namn='Alv nr 3';
person(3).stracka=Stracka(3);
person(3).tid=Tid(3);
person(3).fart=Fart(3);

person(4).namn='Alv nr 4';
person(4).stracka=Stracka(4);
person(4).tid=Tid(4);
person(4).fart=Fart(4);

person(5).namn='Alv nr 5';
person(5).stracka=Stracka(5);
person(5).tid=Tid(5);
person(5).fart=Fart(5);

person(6).namn='Alv nr 6';
person(6).stracka=Stracka(6);
person(6).tid=Tid(6);
person(6).fart=Fart(6);

person(7).namn='Alv nr 7';
person(7).stracka=Stracka(7);
person(7).tid=Tid(7);
person(7).fart=Fart(7);

person(8).namn='Alv nr 8';
person(8).stracka=Stracka(8);
person(8).tid=Tid(8);
person(8).fart=Fart(8);

person(9).namn='Alv nr 9';
person(9).stracka=Stracka(9);
person(9).tid=Tid(9);
person(9).fart=Fart(9);

person(10).namn='Alv nr 10';
person(10).stracka=Stracka(10);
person(10).tid=Tid(10);
person(10).fart=Fart(10);

CellFart=[person.fart];
MatrixFart=cell2mat(CellFart);
Sfart=sort(MatrixFart,'descend');

Hast1=Sfart(1);
Hast2=Sfart(2);
Hast3=Sfart(3);

Namn1

%fprintf('På tredje plats kom  med hastigheten 1.111 m/s
%På andra plats kom alv nr 456 med hastigheten 2.222 m/s
%På första plats kom alv nr 789 med hastigheten 3.333 m/s


