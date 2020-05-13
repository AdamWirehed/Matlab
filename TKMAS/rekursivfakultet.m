function Fakultet=rekursivfakultet(FakultetAv)
% REKURSIVFAKULTET: Ber�knar fakultet av givet tal med rekursiv metod.
%   Funktionen fakultet ber�knar fakultet av ett
%   tal baserat p� en grundl�ggande implementering
%   med rekursiva funktionsanrop.
%
%   Input: FakultetAv - tal f�r vilket fakultet ska ber�knas
%
%   Output:Fakultet   - Fakultet av FakultetAv
%
%   Call: Fakultet=fakultet(FakultetAv)

if FakultetAv==1
    Fakultet=1;
else
    Fakultet=FakultetAv*rekursivfakultet(FakultetAv-1);
end
