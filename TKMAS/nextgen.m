function nextGeneration=nextgen(oldGeneration,rule)
nextGeneration=oldGeneration;
ruleVector=de2bi(rule,8,'left-msb');

for n=2:(length(nextGeneration)-1)
    myGroup=oldGeneration(n-1:n+1);
    myIndex=bi2de(myGroup,'left-msb')+1;
    nextGeneration(n)=ruleVector(myIndex);
end
