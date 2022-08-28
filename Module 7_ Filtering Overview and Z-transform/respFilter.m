%% load in and plot respiratory signal
load Resp.mat
t = [1:length(resp)]/fs;
plot(t, resp)

%% Look at spectrum of resp
%fft -- you do that!

%% Create the FIR filter impulse response
% LPF with 1Hz cutoff frequency
fc =  1; % in Hz
wc = fc/fs*2*pi;
Lwin = 65; % order of the filter
n = [1:floor(Lwin/2)];
h = sin(wc*n)./(pi*n);
hneg = h(end:-1:1);
nneg = -n(end:-1:1);
hlpf = [hneg 1/(2*pi) h];
nlpf = [nneg 0 n];
plot(nlpf, hlpf)


%% Alternate way using fir1
Wn = fc/(fs/2); 
N = Lwin-1;
B = fir1(N,Wn);

y1 = filtfilt(B, 1, resp);

%%
Nfft = 2^10;
Hf = fft(hlpf, Nfft);
f = [0:(Nfft - 1)]*fs/Nfft;
plot(f, abs(Hf));

%%
y = conv(resp, hlpf, 'same');
subplot(2,1,1);
plot(t, resp)

subplot(2,1,2);
plot(t, y)

Nfft = 2^12;
[H,W] = freqz(hlpf, 1, Nfft);
f = W*(fs/2/pi);
plot(f, abs(H));

