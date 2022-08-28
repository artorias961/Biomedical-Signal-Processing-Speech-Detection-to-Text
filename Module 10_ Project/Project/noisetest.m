close all
clear all
nfft = 2^16;
Lwin = 256;
win = window(@hamming,Lwin);
Noverlap = round(Lwin * 0.5);

%% load the test signal sentence
%[TestSignal, Testfs] = audioread('testing123.m4a');
[TestSignal, Testfs] = audioread('TrainingData\k rack cat k sound.m4a');
fc = 400;
[b, a] = ellip(4, 1, fc, fc/(Testfs/2), 'high' );
%TestSignal = filtfilt(b,a,TestSignal);
[S, F, T] = spectrogram(TestSignal, win, Noverlap, nfft, Testfs);
%normalizing data'
Smax = max(abs(S),[],'all');
%S = S/Smax;

imagesc(T ,F ,abs(S));

load noise.mat

%% training model
[row,col] = size(S);
%modify to improve or reduce performance
window = 150;
Mod = 0.90;
percent = 0.9;
%----------------------------------------
overlap = percent * window;
phonemes = false(45,1);
trigger = 0;
string = [];



for i = 1:window-overlap:col-window-1
    R_corr = zeros(45,1);
    % storing window of time we are comparing to phonemes
    Stemp = abs(S(:,i:i+window-1));
    % normalizing the window we selected.
    Stempmax = max(Stemp,[],'all');
    if Stempmax <= 0.5
        %eliminate noise
        Stemp = Stemp * 0;
    end
    Stemp = Stemp/Stempmax;
    % summing the values into by frequency
    Stemp = sum(Stemp,2);
    Stemp = Stemp./window;
    temp = Stemp(noise_Fstart:noise_Fend);
    R = corrcoef(temp,noise_stft);
    R_corr = R(2);
    
    if R_corr >= Mod
        trigger = trigger+1;  
    end
end
trigger