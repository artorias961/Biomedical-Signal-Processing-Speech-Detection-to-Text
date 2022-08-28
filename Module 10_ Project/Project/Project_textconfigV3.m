close all
clear all
nfft = 2^16;
Lwin = 256;
win = window(@hamming,Lwin);
Noverlap = round(Lwin * 0.8);
phonemes_array = [];
phonemesFreqStart = [];
phonemesFreqEnd   = [];
%% -------------------------------------------------------------------
graph = 0;
Letter = "b";
[data, fs] = audioread('TrainingData\b bug sound.m4a');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end

T_index_start = find(T >= 0.95);
T_index_end   = find(T >= 1.028);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));

phonemes_array = [phonemes_array temp];
start = 120;
ends  = 3500;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
b_stft = Stemp./(T_index_end(1) - T_index_start(1));
b_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
b_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];
%% -------------------------------------------------------------------
graph = 0;
Letter = "d";
[data, fs] = audioread('TrainingData\d dad sound.m4a');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 1.508);
T_index_end   = find(T >= 1.6);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
start = 120;
ends  = 4500;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
d_stft   = Stemp./(T_index_end(1) - T_index_start(1));
d_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
d_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];
%% --------------------------------------------------------
graph = 0;
Letter = "f";
[data, fs] = audioread('TrainingData\f fat sound.m4a');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 1.269);
T_index_end   = find(T >= 1.557);
Stemp = S(:,T_index_start:T_index_end);
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
start = 120;
ends  = 14000;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end

Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
f_stft = Stemp./(T_index_end(1) - T_index_start(1));
f_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
f_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];
%% -------------------------------------------------------------------
graph = 0;
Letter = "g";
[data, fs] = audioread('TrainingData\g ghost sound.m4a');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 1.555);
T_index_end   = find(T >= 1.659);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
start = 120;
ends  = 4000;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
g_stft = Stemp./(T_index_end(1) - T_index_start(1));
g_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
g_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];
%% -------------------------------------------------------------------
graph = 0;
Letter = "h";
[data, fs] = audioread('TrainingData\h hop sound.m4a');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 1.419);
T_index_end   = find(T >= 1.557);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
start = 400;
ends  = 7700;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
h_stft = Stemp./(T_index_end(1) - T_index_start(1));
h_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
h_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];
%% -------------------------------------------------------------------------
graph = 0;
Letter = "dj";
[data, fs] = audioread('TrainingData\j jam sound.m4a');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 1.73);
T_index_end   = find(T >= 1.936);
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
start = 120;
ends  = 10000;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
dj_stft = Stemp./(T_index_end(1) - T_index_start(1));
dj_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
dj_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];
%% -------------------------------------------------------------------------
graph = 0;
Letter = "k";
[data, fs] = audioread('TrainingData\k rack cat k sound.m4a');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 1.139);
T_index_end   = find(T >= 1.301);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
start = 120;
ends  = 10000;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
k_stft = Stemp./(T_index_end(1) - T_index_start(1));
k_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
k_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];
%% -------------------------------------------------------------------------
graph = 0;
Letter = "l";
[data, fs] = audioread('TrainingData\l live sound.m4a');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 1.24);
T_index_end   = find(T >= 1.38);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
start = 100;
ends  = 4000;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
l_stft = Stemp./(T_index_end(1) - T_index_start(1));
l_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
l_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];
%% -------------------------------------------------------------------------
graph = 0;
Letter = "m";
[data, fs] = audioread('TrainingData\m man sound.m4a');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 1.2);
T_index_end   = find(T >= 1.45);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
start = 100;
ends  = 4500;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
m_stft = Stemp./(T_index_end(1) - T_index_start(1));
m_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
m_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];
%% -------------------------------------------------------------------------
graph = 0;
Letter = "n";
[data, fs] = audioread('TrainingData\nnn sound.m4a');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 1.445);
T_index_end   = find(T >= 1.7);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
start = 100;
ends  = 5000;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
n_stft = Stemp./(T_index_end(1) - T_index_start(1));
n_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
n_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];
%% -------------------------------------------------------------------------
graph = 0;
Letter = "p";
[data, fs] = audioread('TrainingData\p pin pin sound.m4a');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 1.02);
T_index_end   = find(T >= 1.11);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
start = 100;
ends  = 11000;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
p_stft = Stemp./(T_index_end(1) - T_index_start(1));
p_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
p_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];
%% -------------------------------------------------------------------
graph = 0;
Letter = "r";
[data, fs] = audioread('TrainingData\r run r run sound.m4a');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 4.26);
T_index_end   = find(T >= 4.48);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
start = 100;
ends  = 3000;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
r_stft = Stemp./(T_index_end(1) - T_index_start(1));
r_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
r_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];
%% -------------------------------------------------------------------
graph = 0;
Letter = "s";
[data, fs] = audioread('TrainingData\s sun sound.m4a');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 1.171);
T_index_end   = find(T >= 1.512);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
start = 3000;
ends  = 14000;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
s_stft = Stemp./(T_index_end(1) - T_index_start(1));
s_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
s_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];
%% -------------------------------------------------------------------
graph = 0;
Letter = "t";
[data, fs] = audioread('TrainingData\t testing testing t sound.m4a');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 1.107);
T_index_end   = find(T >= 1.155);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
start = 0;
ends  = 14000;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
t_stft = Stemp./(T_index_end(1) - T_index_start(1));
t_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
t_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];
%% -------------------------------------------------------------------
graph = 0;
Letter = "v";
[data, fs] = audioread('TrainingData\v vine sound.m4a');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 1.005);
T_index_end   = find(T >= 1.341);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
start = 0;
ends  = 5000;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
v_stft = Stemp./(T_index_end(1) - T_index_start(1));
v_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
v_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];
%% -------------------------------------------------------------------
graph = 0;
Letter = "w";
[data, fs] = audioread('TrainingData\w wit sound.m4a');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 1.109);
T_index_end   = find(T >= 1.227);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
start = 0;
ends  = 4000;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
w_stft = Stemp./(T_index_end(1) - T_index_start(1));
w_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
w_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];
%% -------------------------------------------------------------------
graph = 0;
Letter = "z";
[data, fs] = audioread('TrainingData\z buzz sound.m4a');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 2.76);
T_index_end   = find(T >= 3.04);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
start = 0;
ends  = 12000;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
z_stft = Stemp./(T_index_end(1) - T_index_start(1));
z_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
z_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];
%% -------------------------------------------------------------------
graph = 0;
Letter = "si";
[data, fs] = audioread('TrainingData\zz treasure sound.m4a');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 1.28);
T_index_end   = find(T >= 1.65);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
start = 120;
ends  = 6500;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
si_stft = Stemp./(T_index_end(1) - T_index_start(1));
si_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
si_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];
%% -------------------------------------------------------------------
graph = 0;
Letter = "ch";
[data, fs] = audioread('TrainingData\ch chip watch sound.m4a');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= .99);
T_index_end   = find(T >= 1.1);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
start = 2000;
ends  = 12800;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
ch_stft = Stemp./(T_index_end(1) - T_index_start(1));
ch_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
ch_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];
%% -------------------------------------------------------------------
graph = 0;
Letter = "sh";
[data, fs] = audioread('TrainingData\sh sham ocean sound.m4a');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= .7);
T_index_end   = find(T >= 1.07);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
start = 2000;
ends  = 8000;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
sh_stft = Stemp./(T_index_end(1) - T_index_start(1));
sh_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
sh_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];
%% -------------------------------------------------------------------
graph = 0;
Letter = "th";
[data, fs] = audioread('TrainingData\th leather sound.m4a');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= .85);
T_index_end   = find(T >= 0.96);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
phonemes_array = [phonemes_array temp];
start = 180;
ends  = 8000;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
th_stft = Stemp./(T_index_end(1) - T_index_start(1));
th_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];phonemesFreqStart =[phonemesFreqStart F_start];
th_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];phonemesFreqEnd   =[phonemesFreqEnd F_end];
%% -------------------------------------------------------------------
graph = 0;
Letter = "ng";
[data, fs] = audioread('TrainingData\ring ng ring sound.m4a');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 4.5);
T_index_end   = find(T >= 4.9);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
start = 180;
ends  = 5000;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
ng_stft = Stemp./(T_index_end(1) - T_index_start(1));
ng_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
ng_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];
%% -------------------------------------------------------------------
graph = 0;
Letter = "y";
[data, fs] = audioread('TrainingData\y you sound.m4a');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= .59);
T_index_end   = find(T >= 0.92);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
start = 0;
ends  = 5000;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
y_stft = Stemp./(T_index_end(1) - T_index_start(1));
y_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
y_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];
%% -------------------------------------------------------------------
graph = 0; %turns on and off the graph
Letter = "ae"; %what letter to use as a 
               %variable in the actual code
[data, fs] = audioread('TrainingData\ae_cat.mp3');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 2.528);
T_index_end   = find(T >= 2.667);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
start = 0;
ends  = 4500;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
ae_stft = Stemp./(T_index_end(1) - T_index_start(1));
ae_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
ae_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];
%% -------------------------------------------------------------------
graph = 0; %turns on and off the graph
Letter = "eI"; %what letter to use as a 
  %variable in the actual code
[data, fs] = audioread('TrainingData\eI Day.mp3');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 3.168);
T_index_end   = find(T >= 3.296);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
start = 0;
ends  = 3500;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
eI_stft = Stemp./(T_index_end(1) - T_index_start(1));
eI_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
eI_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];
%% -------------------------------------------------------------------
graph = 0; %turns on and off the graph
Letter = "e"; %what letter to use as a 
  %variable in the actual code
[data, fs] = audioread('TrainingData\e men.mp3');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 2.926);
T_index_end   = find(T >= 3.056 );
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
start = 0;
ends  = 4500;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
e_stft = Stemp./(T_index_end(1) - T_index_start(1));
e_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
e_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];

%% -------------------------------------------------------------------
graph = 0;
Letter = "Ie"; % what letter to use as a 
   % variable in the actual code
[data, fs] = audioread('TrainingData\I_as_in_it.mp3');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 2.024);
T_index_end   = find(T >= 2.11);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
start = 100;
ends  = 7500;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
Ie_stft = Stemp./(T_index_end(1) - T_index_start(1));
Ie_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
Ie_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];

%% -------------------------------------------------------------------
graph = 0;
Letter = "ee"; % what letter to use as a 
   % variable in the actual code
[data, fs] = audioread('TrainingData\I_as_in_read.mp3');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 3.36);
T_index_end   = find(T >= 3.8);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
start = 100;
ends  = 4500;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
ee_stft = Stemp./(T_index_end(1) - T_index_start(1));
ee_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
ee_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];

%% -------------------------------------------------------------------
graph = 0; %turns on and off the graph
Letter = "aI"; % what letter to use as a 
   % variable in the actual code
[data, fs] = audioread('TrainingData\aI_my.mp3');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 2.598);
T_index_end   = find(T >= 2.846);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
start = 100;
ends  = 4000;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
aI_stft = Stemp./(T_index_end(1) - T_index_start(1));
aI_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
aI_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];
%% -------------------------------------------------------------------
graph = 0; %turns on and off the graph
Letter = "au"; % what letter to use as a 
   % variable in the actual code
[data, fs] = audioread('TrainingData\upsidedownA.mp3');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 2.1);
T_index_end   = find(T >= 2.5);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
start = 120;
ends  = 4000;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
au_stft = Stemp./(T_index_end(1) - T_index_start(1));
au_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
au_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];
%% -------------------------------------------------------------------
graph = 0; %turns on and off the graph
Letter = "oa"; % what letter to use as a 
   % variable in the actual code
[data, fs] = audioread('TrainingData\EupsidedownImpedance_go.mp3');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 2.261);
T_index_end   = find(T >= 2.4801);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
start = 150;
ends  = 2000;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
oa_stft = Stemp./(T_index_end(1) - T_index_start(1));
oa_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
oa_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];
%% -------------------------------------------------------------------
graph = 0; %turns on and off the graph
Letter = "oo"; % what letter to use as a 
   % variable in the actual code
[data, fs] = audioread('TrainingData\oo book sound.m4a');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 3.36);
T_index_end   = find(T >= 3.48);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
start = 100;
ends  = 4000;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
oo_stft = Stemp./(T_index_end(1) - T_index_start(1));
oo_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
oo_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];
%% -------------------------------------------------------------------
graph = 0; %turns on and off the graph
Letter = "u"; % what letter to use as a 
   % variable in the actual code
[data, fs] = audioread('TrainingData\A_but.mp3');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 2.58);
T_index_end   = find(T >= 2.72);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
start = 100;
ends  = 5000;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
u_stft   = Stemp./(T_index_end(1) - T_index_start(1));
u_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
u_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];
%% -------------------------------------------------------------------
graph = 0; %turns on and off the graph
Letter = "ue"; % what letter to use as a 
   % variable in the actual code
[data, fs] = audioread('TrainingData\uColon too.mp3');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 1.3397);
T_index_end   = find(T >= 1.767);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
start = 100;
ends  = 3500;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
ue_stft = Stemp./(T_index_end(1) - T_index_start(1));
ue_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
ue_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];
%% -------------------------------------------------------------------
graph = 0; %turns on and off the graph
Letter = "oi"; % what letter to use as a 
   % variable in the actual code
[data, fs] = audioread('TrainingData\backwardsCI_boy.mp3');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 2.692);
T_index_end   = find(T >= 3.012);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
start = 0;
ends  = 2918;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
oi_stft = Stemp./(T_index_end(1) - T_index_start(1));
oi_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
oi_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];
%% -------------------------------------------------------------------
graph = 0; %turns on and off the graph
Letter = "ow"; % what letter to use as a 
   % variable in the actual code
[data, fs] = audioread('TrainingData\aUpdidedownImpedsnce_how.mp3');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 2.502);
T_index_end   = find(T >= 2.876);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
start = 0;
ends  = 7572;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
ow_stft = Stemp./(T_index_end(1) - T_index_start(1));
ow_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
ow_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];
%% -------------------------------------------------------------------
graph = 0; %turns on and off the graph
Letter = "er"; % what letter to use as a 
   % variable in the actual code
[data, fs] = audioread('TrainingData\upsideDown_e_America.mp3');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 3.105);
T_index_end   = find(T >= 3.2165);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
start = 0;
ends  = 6650;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
er_stft = Stemp./(T_index_end(1) - T_index_start(1));
er_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
er_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];
%% -------------------------------------------------------------------
graph = 0; %turns on and off the graph
Letter = "air"; % what letter to use as a 
   % variable in the actual code
[data, fs] = audioread('TrainingData\eUpsidedownE_wear.mp3');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 2.439);
T_index_end   = find(T >= 2.581);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
start = 0;
ends  = 4124;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
air_stft = Stemp./(T_index_end(1) - T_index_start(1));
air_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
air_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];
%% -------------------------------------------------------------------
graph = 0; %turns on and off the graph
Letter = "ar"; % what letter to use as a 
   % variable in the actual code
[data, fs] = audioread('TrainingData\a_part.mp3');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 2.974);
T_index_end   = find(T >= 3.065);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
start = 0;
ends  = 7219;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
ar_stft = Stemp./(T_index_end(1) - T_index_start(1));
ar_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
ar_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];
%% -------------------------------------------------------------------
graph = 0; %turns on and off the graph
Letter = "ir"; % what letter to use as a 
   % variable in the actual code
[data, fs] = audioread('TrainingData\EpsilonColon_word.mp3');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 2.304);
T_index_end   = find(T >= 2.588);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
start = 0;
ends  = 2600;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
ir_stft = Stemp./(T_index_end(1) - T_index_start(1));
ir_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
ir_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];
%% -------------------------------------------------------------------
graph = 0; %turns on and off the graph
Letter = "or"; % what letter to use as a 
   % variable in the actual code
[data, fs] = audioread('TrainingData\backwardsC_sort.mp3');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 3.2655);
T_index_end   = find(T >= 3.36605);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
start = 0;
ends  = 4200;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
or_stft = Stemp./(T_index_end(1) - T_index_start(1));
or_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
or_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];
%% -------------------------------------------------------------------
graph = 0; %turns on and off the graph
Letter = "ere"; % what letter to use as a 
   % variable in the actual code
[data, fs] = audioread('TrainingData\IipsidedownE Here.mp3');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 1.648);
T_index_end   = find(T >= 1.995);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
start = 0;
ends  = 9800;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
ere_stft = Stemp./(T_index_end(1) - T_index_start(1));
ere_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
ere_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];
%% -------------------------------------------------------------------
graph = 0; %turns on and off the graph
Letter = "our"; % what letter to use as a 
   % variable in the actual code
[data, fs] = audioread('TrainingData\upsidedownImpedanceE_tour.mp3');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 2.6026);
T_index_end   = find(T >= 2.7193);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp = sum(abs(temp),2); temp = temp/Smax; temp = temp./(T_index_end(1) - T_index_start(1));
phonemes_array = [phonemes_array temp];
start = 0;
ends  = 4500;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
our_stft = Stemp./(T_index_end(1) - T_index_start(1));
our_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
our_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];
%% -------------------------------------------------------------------
graph = 0; %turns on and off the graph
Letter = "silence"; % what letter to use as a 
   % variable in the actual code
[data, fs] = audioread('TrainingData\deadnoise_AH.m4a');
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 1.8);
T_index_end   = find(T >= 2);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp1 = sum(abs(temp),2);
start = 4000;
ends  = 19000;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
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
fc = 400; Wn = fc/(fs/2);
[b, a] = butter(4,Wn,'high');
data = filtfilt(b,a,data);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
T_index_start = find(T >= 0.8);
T_index_end   = find(T >= 1.5);
Stemp = S(:,T_index_start(1):T_index_end(1)); Smax = max(abs(Stemp),[],'all');
temp = S(:,T_index_start(1):T_index_end(1));
temp = abs(temp);
temp2 = sum(abs(temp),2);
start = 4000;
ends  = 19000;
Freq = find(F>=start & F<=ends);
F_start = Freq(1); 
F_end = Freq(end); 
Stemp = abs(Stemp(F_start:F_end,:));

Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start(1):T_index_end(1)),F(F_start:F_end) ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
Stemp = abs(Stemp);
Stemp = sum(abs(Stemp),2);
silenceCH_stft = Stemp./(T_index_end(1) - T_index_start(1));
total = [silenceCH_stft silenceAH_stft];
total = sum(abs(total),2);
silence_stft   = total;
silence_Fstart = F_start; phonemesFreqStart = [phonemesFreqStart F_start];
silence_Fend   = F_end; phonemesFreqEnd   = [phonemesFreqEnd F_end];

temptot = [temp1 temp2];
temp = sum(abs(temptot),2);
temp = temp/2;
phonemes_array = [phonemes_array temp];

clear temp temp1 temp2 temptot
clear F fs data total
clear nfft Noverlap 
clear Lwin win silenceCH_stft silenceAH_stft
clear S T Smax Stemp
clear T_index_start T_index_end
clear F_start  F_end
clear start ends
clear Letter graph
clear a b fc