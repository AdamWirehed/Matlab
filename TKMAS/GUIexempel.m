a=1;
while a
    str=inputdlg('Skriv n�gon fr�ga','En fr�ga',[2 60],...
        {sprintf(['S�derk�ping ligger s�der om k�ping \n'...
        'Men ligger Norrk�ping norr om K�ping?'])});
    h=msgbox(str);
    pause(3);
    knapptryckning=questdlg('Vill du forts�tta?','En annan fr�ga',...
        'Ja','Nej','Ja');
    if strcmpi(knapptryckning,'Ja')
        delete(h);
    else
        a=0;
    end
end
        