person(1).name='Anders T. Johansson';
person(1).age=33;
person(1).title='Doktor'; 
%Strukturens namn = person, f�ltnamn = efter.
person(2).name='Prins Carl Philip Bernadotte';
person(2).age=37;
person(2).title='Hans Kungliga H�ghet';

age=[person.age]; %hakparanteser f�r ut lista av siffor, f�r alla person.age
meanAge=mean(age);
fprintf(['%s %s och %s %s �r i genomsnitt '...
    '%3.1f �r gamla.\n'], person(2).title, person(2).name,...
    person(1).title, person(1).name, meanAge);
