function [m,V]=massaVolym(sort,x1,x2,x3,rho)
% MASSAVOLYM: Funktion som ber�knar massa och volym av en geometrisk form.
%
% MASSAVOLYM ber�knar massa och volym av klossar. F�ljande typer st�djs:
%   'prisma'*           x1=bas,     x2=h�jd,    x3=l�ngd
%   'r�tblock'          x1=bas,     x2=h�jd,    x3=l�ngd
%   'pyramid'           x1=bas,     x2=h�jd,    x3=l�ngd
%   'cylinder'          x1=radie,   x2=h�jd,    x3=[ ]
%   'sf�r'              x1=radie,   x2=[ ]      x3=[ ]
%   'kon'               x1=radie,   x2=h�jd,    x3=[ ]
%
%   * 'prisma' kan beskriva flera olika former; h�r anv�nds det i
%   betydelsen "r�tblock som skurits av p� diagonalen".
%
% INPUT:    sort    -   textstr�ng som f�rklarar vilken sort det handlar om
%           x1,x2,x3-   variabler f�r volymsber�kning, se ovan
%           rho     -   densitet (defaultv�rde=1);
%
% OUTPUT:   m       -   massa
%           V       -   Volym
%
% CALL:   [m,V]=massaVolym(sort,x1,x2,x3,rho);

% Anonym tentamenskod: 
%
% Datornummer: 

if nargin<5
    rho=1;
end
sort=lower(sort);
switch sort
    case 'prisma'
        try 
            V=x1*x2*x3/2;
        catch
            error('Inputvariabler felaktiga');
        end
    case 'r�tblock'
        try 
            V=x1*x2*x3;
        catch
            error('Inputvariabler felaktiga');
        end
    case 'pyramid'
        try 
            V=x1*x2*x3/3;
        catch
            error('Inputvariabler felaktiga');
        end
    case 'cylinder'
        try 
            V=pi*x1^2*x2;
        catch
            error('Inputvariabler felaktiga');
        end
    case 'sf�r'
        try 
            V=pi*x1^3;
        catch
            error('Inputvariabler felaktiga');
        end
    case 'kon'
        try 
            V=pi*x1^2*x2/3;
        catch
            error('Inputvariabler felaktiga');
        end
    otherwise
        error('Ok�nd typ');
end

m=rho*V;

if nargout==1
    varargout{1}=m;
elseif nargout==2
    varargout{1}=m;
    varargout{2}=V;
else nargout~=1||nargout~=2
    error('Felaktigt antal utvariabler!')
end
end