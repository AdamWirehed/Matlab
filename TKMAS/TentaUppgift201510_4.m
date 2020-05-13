%% a)
Fs=8192;
Lat=twinkletwinkle(Fs);
sound(Lat,Fs);

%% b)
audiowrite('twinkletwinkle.wav',Lat,Fs,'Title','Twinkel the bass','Artist','Matlabanders');

%% c)
