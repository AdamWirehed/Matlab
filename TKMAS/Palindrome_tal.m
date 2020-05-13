%Largest palindrome product

%Vad behöver jag göra för någonting?
    %Testa alla produkter av två treställiga tal.
    %Testa om svaret blir samma baklänges
    %Spara det största

%Initiera variabler
factor1=101;
factor2=101;
largestProduct=factor1*factor2 %10201

%Gå igenom alla heltal 100-999
for a=100:999
    for b=100:999
        product=a*b;
    end
    
end

%Spara det största palindrome-tal

