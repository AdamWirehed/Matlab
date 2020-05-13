%Area och Omkrets triangel

function y=AOTriangel(A,b,c)
    a=sqrt(b.^2+c.^2-2.*b.*c.*cosd(A));
    Om=a+b+c;
    Ar=(b.*c.*sind(A))/2;
    y=[Om,Ar];
    disp(['Omkretsen är ' num2str(Om) ' Arean är ' num2str(Ar)])
    
