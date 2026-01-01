load semmlowEx3pt3.mat
plot(t, x)
Nfft = 2^9;
[Xf] = fft(x, Nfft);
Xfmag = abs(Xf);
Xfphase = angle(Xf);
subplot(2,1,1);
Omega = [0:Nfft-1]/Nfft*(2*pi);
plot(Omega, Xfmag)
fs = 1/mean(diff(t))
f = [0:(Nfft -1)]/Nfft*fs;
plot(f, Xfmag)
[m, imax] = max(Xfmag)
f(imax)
