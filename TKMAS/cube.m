function cube(v,dv)
close all
Kx=[0 1 1 0 0 0 1 1 0 0 1 1 1 1 1 1 0 0 0];
Ky=[0 0 1 1 0 0 0 1 1 0 0 0 0 1 1 1 1 1 1];
Kz=[0 0 0 0 0 1 1 1 1 1 1 0 1 1 0 1 1 0 1];
K=[Kx;Ky;Kz];

Q=questdlg('Vill du ha en snabb kub?','Sanic','Nej jag är tråkig','Ja, snabb som satan','Nej jag är tråkig');
switch Q
    case 'Nej jag är tråkig'
    plot3(Kx,Ky,Kz);
    while 1==1
        R=LinLV4Rot(v,dv);
        K=R*K;
        NKx=K(1,:); NKy=K(2,:); NKz=K(3,:);
        plot3(NKx,NKy,NKz);
        pause(1/10000000000);
    end
    
    case 'Ja, snabb som satan'
         plot3(Kx,Ky,Kz);
    while 1==1
        R=LinLV4Rot(v,dv);
        K=R*K;
        NKx=K(1,:); NKy=K(2,:); NKz=K(3,:);
        dv=dv+0.01;
        plot3(NKx,NKy,NKz);
        pause(1/1000);
    end
end

    
    
    
    
    