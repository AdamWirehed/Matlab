%Largest palindrome product

%Vad beh�ver jag g�ra f�r n�gonting?
    %Testa alla produkter av tv� trest�lliga tal.
    %Testa om svaret blir samma bakl�nges
    %Spara det st�rsta

%Initiera variabler
factor1=101;
factor2=101;
largestProduct=factor1*factor2 %10201

%G� igenom alla heltal 100-999
for a=100:999
    for b=100:999
        product=a*b;
    end
    
end

%Spara det st�rsta palindrome-tal

