function nearestneighbor2(Matrix,a)
    q=a;
    TourList=[];
    r=[1:length(Matrix)];
    r(a)=[];
    
    for t=1:length(Matrix)
        Matrix(~Matrix)=Inf;     
        MinRad=min(Matrix(q,r));
        for i=1:length(Matrix)
            if Matrix(q,i)==MinRad  %&& ismember([i],TourList)==0 %Tar fram positionen av det mista v�rdet i rad q och kollar om det redan har "bes�kts"
                    TourList=[TourList i];  %Plockar ut kolonn-platsen det minsta v�rdet l�g p�
                    r = r(r~=i); %FEL!!!
                    r
                    q=i;                    %Loopen letar nu efter det minsta v�rdet i rad i (Nummret p� f�rra kolonnen som det minsta v�rdet l�g i)
                break
            end
        end
    end
    TourList                   %Visar i vilken ordning resan har skett
            
