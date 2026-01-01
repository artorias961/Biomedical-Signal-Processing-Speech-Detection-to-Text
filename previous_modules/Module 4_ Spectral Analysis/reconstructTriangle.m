clear all, close all;
fs = 100;                           % Sample frequencies
N1 = [0 150 750];                   % Padding added to the original 50 point signal
x =[(0:25) (24:-1:0)];              % Generate basic test signal, 50 pts long
k = 1;
x1 = [x zeros(1,N1(k))];         % Zero pad signal
    N = length(x1);                  % Data length
    t = (1:N)/fs;
    f = (0:N-1)*fs/N;                 % Frequency vector

    X1mag = abs(fft(x1));
X1phase = angle(fft(x1));
whos X1*
Nfft = 1024;
X1mag = abs(fft(x1, Nfft));
X1phase = angle(fft(x1, Nfft));
f = [0:(Nfft-1)]*fs/Nfft;

L = length(x1);
y = zeros(1, L);

for i = 2:Nfft,
    y = y + X1mag(i)*cos(2*pi*f(i)*t + X1phase(i));
end

