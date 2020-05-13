function Fakultet=fakultet2(FakultetAv)
% FAKULTET: Ber�knar fakultet av givet tal.
%   Funktionen fakultet ber�knar fakultet av ett
%   tal baserat p� en grundl�ggande implementering
%   med while.
%
%   Input: FakultetAv - tal f�r vilket fakultet ska ber�knas
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