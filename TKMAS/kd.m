function tal=kd(d)
if d>=0.06
    tal=0.8;
else
    if d<=0.01
        tal=1;
    else
        if d<=0.02
            tal=1-0.05/0.01*(d-0.01);
        else
            tal=0.95-0.15/0.04*(d-0.02);
        end
    end
end