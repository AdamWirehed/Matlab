person(1).name='Anders T. Johansson';
person(1).age=33;
person(1).title='Doktor'; 
%Strukturens namn = person, fältnamn = efter.
person(2).name='Prins Carl Philip Bernadotte';
person(2).age=37;
person(2).title='Hans Kungliga Höghet';

age=[person.age]; %hakparanteser får ut lista av siffor, får alla person.age
meanAge=mean(age);
fprintf(['%s %s och %s %s är i genomsnitt '...
    '%3.1f år gamla.\n'], person(2).title, person(2).name,...
    person(1).title, person(1).name, meanAge);
