clc; clear; close all;
L = 1024;
wrect = window(@rectwin, L);
fs = 1000;
t = [0:L-1]/fs;
plot(t, wrect)
whamm = window(@hamming, L);
hold on;
plot(t, whamm)
wbart = window(@bartlett, L);
plot(t, wbart)
f = [0:L-1]/L*fs;
Wf = fft(wrect, L);
figure;
plot(f, abs(Wf));

Wfham = fft(whamm, L);
hold on;
plot(f, abs(Wfham));
