function y=twinkletwinkle(Fs)
% TWINKLETWINKLE: Bass playing famous childrens song
%
%   Returns a vector of sines based on a sampling Frequency.
%
% y=twinkletwinkle(Fs)

toneLength=0.2;
t=0:1/Fs:toneLength;

%% Tones
c=sin(2*pi*65.41*t);
d=sin(2*pi*73.42*t);
e=sin(2*pi*82.41*t);
f=sin(2*pi*87.31*t);
g=sin(2*pi*98.00*t);
a=sin(2*pi*110.00*t);
paus=0*t;

%% Melody:
y=[c c g g a a g paus f f e e d d c paus g g f f e e d paus ...
    g g f f e e d paus c c g g a a g paus f f e e d d c paus];

