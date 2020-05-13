function Fakultet=rekursivfakultet(FakultetAv)
% REKURSIVFAKULTET: Beräknar fakultet av givet tal med rekursiv metod.
%   Funktionen fakultet beräknar fakultet av ett
%   tal baserat på en grundläggande implementering
%   med rekursiva funktionsanrop.
%
%   Input: FakultetAv - tal för vilket fakultet ska beräknas
%
%   Output:Fakultet   - Fakultet av FakultetAv
%
%   Call: Fakultet=fakultet(FakultetAv)

if FakultetAv==1
    Fakultet=1;
else
    Fakultet=FakultetAv*rekursivfakultet(FakultetAv-1);
end
