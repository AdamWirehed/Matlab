function O=LinLV4Vinkel(X,Y)
K=questdlg('Grader eller radianer?','Viktig fråga','Radianer','Grader','Radianer');
switch K
    case 'Radianer'
        O=acos(dot(X,Y)/(norm(X)*norm(Y)));
    case 'Grader'
        O=acosd(dot(X,Y)/(norm(X)*norm(Y)));
end
end
