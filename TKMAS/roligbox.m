G=questdlg('Vill du ha glass?', 'Glass', 'Ja', 'Nej', 'Kanske', 'Nej');
switch G
    case 'Nej'
        msgbox('Du �r en tr�kig person');
    case 'Ja'
        msgbox('Nej, du f�r ingen');
    case 'Kanske'
        msgbox('Best�m dig!');
end 