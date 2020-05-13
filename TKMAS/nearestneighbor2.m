function nearestneighbor2(Matrix,a)
    q=a;
    TourList=[];
    r=[1:length(Matrix)];
    r(a)=[];
    
    for t=1:length(Matrix)
        Matrix(~Matrix)=Inf;     
        MinRad=min(Matrix(q,r));
        for i=1:length(Matrix)
            if Matrix(q,i)==MinRad  %&& ismember([i],TourList)==0 %Tar fram positionen av det mista värdet i rad q och kollar om det redan har "besökts"
                    TourList=[TourList i];  %Plockar ut kolonn-platsen det minsta värdet låg på
                    r = r(r~=i); %FEL!!!
                    r
                    q=i;                    %Loopen letar nu efter det minsta värdet i rad i (Nummret på förra kolonnen som det minsta värdet låg i)
                break
            end
        end
    end
    TourList                   %Visar i vilken ordning resan har skett
            
