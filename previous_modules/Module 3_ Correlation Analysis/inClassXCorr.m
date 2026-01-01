f = 5;
fs = 1000;
t = [0:1000]/fs;
clear;
close all

f = 5;
fs = 1000;
L = round(1*fs);
t = [0:L-1]/fs;

A = sin(2*pi*f*t);
phi = -0.2/f
B = sin(2*pi*f*(t+phi));

subplot(2,1,1);
plot(t, A);
hold on;
plot(t, B)
[rAB, lags] = xcorr(A, B);
[rmax, imax] = max(rAB);
lags(imax)/fs

subplot(2,1,2);
plot(t, A)
hold on;
plot(t(1:end+lags(imax)), B(-lags(imax)+1:end))