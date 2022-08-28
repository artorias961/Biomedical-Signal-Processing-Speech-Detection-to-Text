close all
clear all
nfft = 2^16;
Lwin = 450;
win = window(@hamming,Lwin);
Noverlap = round(Lwin * 0.8);

%% -------------------------------------------------------------------
graph = 1;
Letter = "silence"; % what letter to use as a 
   % variable in the actual code
[data, fs] = audioread('White Noise.m4a');
data = data(:,1);
% fc = 200;
% [b, a] = ellip(4, 1, fc, fc/(fs/2), 'high' );
% data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 4.17);
T_index_end   = find(T >= 5.4);
Stemp = S(:,T_index_start(1):T_index_end(1));
start = 0;
ends  = 7500;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));
Smax = max(abs(Stemp),[],'all');
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
noise_stft = Stemp./(T_index_end(1) - T_index_start(1));
noise_Fstart = F_start;
noise_Fend   = F_end;