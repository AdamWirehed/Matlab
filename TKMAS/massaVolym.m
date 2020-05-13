function [m,V]=massaVolym(sort,x1,x2,x3,rho)
% MASSAVOLYM: Funktion som beräknar massa och volym av en geometrisk form.
%
% MASSAVOLYM beräknar massa och volym av klossar. Följande typer stödjs:
%   'prisma'*           x1=bas,     x2=höjd,    x3=längd
%   'rätblock'          x1=bas,     x2=höjd,    x3=längd
%   'pyramid'           x1=bas,     x2=höjd,    x3=längd
%   'cylinder'          x1=radie,   x2=höjd,    x3=[ ]
%   'sfär'              x1=radie,   x2=[ ]      x3=[ ]
%   'kon'               x1=radie,   x2=höjd,    x3=[ ]
%
%   * 'prisma' kan beskriva flera olika former; här används det i
%   betydelsen "rätblock som skurits av på diagonalen".
%
% INPUT:    sort    -   textsträng som förklarar vilken sort det handlar om
%           x1,x2,x3-   variabler för volymsberäkning, se ovan
%           rho     -   densitet (defaultvärde=1);
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
    case 'rätblock'
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
    case 'sfär'
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
        error('Okänd typ');
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