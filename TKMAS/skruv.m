function skruvdata = skruv(i)

%Funktionsfil som returnerar skruvparametrar för M6-M30 av preferens 1
%enligt tabell 2.1 i LB
%dw enligt Maskinelement Formelsamling sid332

%Indata i skall vara mellan 1 och 8 för korrekt utdata.

%Jonas Wahlgren

if i==1
    d1=0.004917;
    d2=0.005350;
    dw=0.0089;
    m=6;
    dh=0.0066;
    P=0.001;
    
elseif i==2
    d1=0.006647;
    d2=0.007188;
    dw=0.01147;
    m=8;
    dh=0.009;
    P=0.00125;
    
elseif i==3
    d1=0.008376;
    d2=0.009026;
    dw=0.0146;
    m=10;
    dh=0.011;
    P=0.0015;
    
elseif i==4
    d1=0.010106;
    d2=0.010863;
    dw=0.0166;
    m=12;
    dh=0.0135;
    P=0.00175;
    
elseif i==5
    d1=0.013835;
    d2=0.014701;
    dw=0.0225;
    m=16;
    dh=0.0175;
    P=0.002;
    
elseif i==6
    d1=0.017294;
    d2=0.018376;
    dw=0.0277;
    m=20;
    dh=0.022;
    P=0.0025;
    
elseif i==7
    d1=0.020752;
    d2=0.022051;
    dw=0.03325;
    m=24;
    dh=0.026;
    P=0.003;
    
elseif i==8
    d1=0.026211;
    d2=0.027727;
    dw=0.04275;
    m=30;
    dh=0.033;
    P=0.0035;
    
else
    d1=0;
    d2=0;
    dw=0;
    m=0;
    dh=0;
    P=0;
end

skruvdata=[d1 d2 dw m dh P];