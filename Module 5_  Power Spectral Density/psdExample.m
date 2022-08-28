fs = 200;
fsig = 8;
L = round(2*fs);
t = [0:L-1]/fs;
y = sin(2*pi*fsig*t);

win = ones(round(L/10), 1);
Nfft = 2^11;

[Pxx,f] = pwelch(y, win, 0, Nfft, fs);

subplot(2,1,1);
plot(f, Pxx)

Lwin = round(L/10);
win = window(@hamming, Lwin);
Noverlap = round(Lwin*0.5);
[Pxx,f] = pwelch(y, win, Noverlap, Nfft, fs);

subplot(2,1,2);
plot(f, Pxx)
