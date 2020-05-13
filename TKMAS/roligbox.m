G=questdlg('Vill du ha glass?', 'Glass', 'Ja', 'Nej', 'Kanske', 'Nej');
switch G
    case 'Nej'
        msgbox('Du är en tråkig person');
    case 'Ja'
        msgbox('Nej, du får ingen');
    case 'Kanske'
        msgbox('Bestäm dig!');
end 