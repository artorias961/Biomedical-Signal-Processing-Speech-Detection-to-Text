close all
clear all
nfft = 2^16;
Lwin = 256;
win = window(@hamming,Lwin);
Noverlap = round(Lwin * 0.5);

%-------------------
%--start of code----
%-------------------
%% -------------------------------------------------------------------
graph = 0; %turns on and off the graph
Letter = "silence"; % what letter to use as a 
   % variable in the actual code
[data, fs] = audioread('TrainingData\deadnoise_AH.m4a');
fc = 200;
[b, a] = ellip(4, 1, fc, fc/(fs/2), 'high' );
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 1.8);
T_index_end   = find(T >= 2);
Stemp = S(:,T_index_start(1):T_index_end(1));
Smax = max(abs(Stemp),[],'all');
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
silenceAH_stft = Stemp./(T_index_end(1) - T_index_start(1));

%% -------------------------------------------------------------------
graph = 0; %turns on and off the graph
Letter = "silence"; % what letter to use as a 
   % variable in the actual code
[data, fs] = audioread('TrainingData\DeadNoise_CH.mp3');
fc = 200;
[b, a] = ellip(4, 1, fc, fc/(fs/2), 'high' );
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 0.8);
T_index_end   = find(T >= 1.5);
Stemp = S(:,T_index_start(1):T_index_end(1));
Smax = max(abs(Stemp),[],'all');
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
silenceCH_stft = Stemp./(T_index_end(1) - T_index_start(1));
total = [silenceCH_stft silenceAH_stft];
total = sum(abs(total),2);
silence_stft = total;