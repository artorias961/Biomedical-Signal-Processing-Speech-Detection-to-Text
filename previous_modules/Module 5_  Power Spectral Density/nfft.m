close all; clear all;
N = 512;       % number of points in square wave pulse
Ntots = [512 1024 2048];
fs = 1000;      % sampling frequency
N_pos = round(N/2); % what proportion of the period will be positive (i.e., the duty cycle x N)

for i = 1:3,
    Ntot = Ntots(i);
    Nfft = Ntot; %1024;    % number of points in fft
%%% Generate square-wave function
x = [ones(N_pos, 1); -ones(N - N_pos, 1); zeros(Ntot - N, 1)];
t = (1:Ntot)/fs;   % time vector

Xf = fft( x, Nfft);    % Nfft-point fft
X = fft(x)/(N/2);  % Normalized FFT

f = [0:(Nfft-1)]/Nfft*fs;   % Frequency vector
subplot(3,2, 2*i-1);
plot(t, x, 'LineWidth', 1); grid on;
ylabel(strcat('N=',num2str(Ntot)));
axis([0 2048/fs -1.1 1.1]);
subplot(3,2,2*i);
plot(f, abs(Xf));
hold on;
plot(f, abs(Xf), 'g.');
axis([0 30 -10 400]);
pause;
end
xlabel('frequency [Hz]');
subplot(3,2,2);
title('|X(f)|');
subplot(3,2,1);
title('x(t)');
subplot(3,2,5);
xlabel('time [s]');

