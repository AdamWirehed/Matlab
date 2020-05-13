function Fakultet=fakultet2(FakultetAv)
% FAKULTET: Beräknar fakultet av givet tal.
%   Funktionen fakultet beräknar fakultet av ett
%   tal baserat på en grundläggande implementering
%   med while.
%
%   Input: FakultetAv - tal för vilket fakultet ska beräknas
%
%   Output:Fakultet   - Fakultet av FakultetAv
%
%   Call: Fakultet=fakultet(FakultetAv)

n=1;
Fakultet=1;
while n<=FakultetAv
    Fakultet=Fakultet*n;
    n=n+1;
end