%Strukturera p� papper
%Multiplicera A(r,k)*A(r+1,k)*A(r+2),k*A(r+3,k)
%Eller A(r,k)*A(r+1,k+1)*A(r+2,k+2)*A(r+3,k+3)
%Eller A(r,k)*A(r,k+1)*A(r+2)*A(r,k+3)

%F� in matrisen i Matlab CTRL+C -> textdokument -> load
%Loopa igenom varje rad f�r att hitta h�gsta "radprodukt"
%Loopa igenom varje kolonn f�r att hitta h�gsta "kolonnprodukten"
%Loopa igenom f�r att kolla diagonalerna
%function LRP=checkrowprod(M)
%LRP=0;
%for a=1:size(M,1)
    %for b=size(M,2)-3
        %indices=(b:b+3)
        %rP=prod(M(a,indices));
            %if rP>rP
                %LRP=rP;
                %end
             %end
         %end
%M=load(textfil)
%LRP=checkrowprod(M)
%LCP=checkrowprod(M') (transponat n�r man kollar kolonner)
%largestProd=max([LRP LCP]); (tog inte med dia)