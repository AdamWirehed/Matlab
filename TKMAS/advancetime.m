function NySpelPlan=advancetime(SpelPlan)
NySpelPlan=zeros(size(SpelPlan));

for x=2:(length(SpelPlan)-1)
    for y=2:(length(SpelPlan)-1)
        Check=[SpelPlan(x-1,y-1:y+1);SpelPlan(x,y-1:y+1);SpelPlan(x+1,y-1:y+1)];
        if SpelPlan(x,y)==1
            Grannar=sum(Check(:,1)+Check(:,2)+Check(:,3))-1;
            if Grannar~=2&&Grannar~=3
                NySpelPlan(x,y)=0;
            else
                NySpelPlan(x,y)=1;
            end
        elseif SpelPlan(x,y)==0
            Grannar=sum(Check(:,1)+Check(:,2)+Check(:,3));
            if Grannar==3
                NySpelPlan(x,y)=1;
            else
                NySpelPlan(x,y)=0;
            end
        end
    end
end
