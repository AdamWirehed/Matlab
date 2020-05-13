a=1;
while a
    str=inputdlg('Skriv någon fråga','En fråga',[2 60],...
        {sprintf(['Söderköping ligger söder om köping \n'...
        'Men ligger Norrköping norr om Köping?'])});
    h=msgbox(str);
    pause(3);
    knapptryckning=questdlg('Vill du fortsätta?','En annan fråga',...
        'Ja','Nej','Ja');
    if strcmpi(knapptryckning,'Ja')
        delete(h);
    else
        a=0;
    end
end
        