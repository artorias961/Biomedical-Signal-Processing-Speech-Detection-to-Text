close all
clear all
nfft = 2^16;
Lwin = 256;
win = window(@hamming,Lwin);
Noverlap = round(Lwin * 0.5);


%% -------------------------------------------------------------------
graph = 0;
Letter = "b";
[data, fs] = audioread('TrainingData\b bug sound.m4a');
%fs =fs/2;
%data = data(1:2:end);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
%Smax = max(abs(S),[],'all');
%S = S/Smax;
disp("%-------------------------------------------------------");
disp("% /"+Letter+"/ sound in ");
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
% formant ranges you detect, find the avg signal length
% step one find the time range of signal you detected;
T_index_start = find(T >= 0.94);
T_index_end   = find(T >= 1.03);
Stemp = S(:,T_index_start:T_index_end);
Smax = max(abs(Stemp),[],'all');
disp(Letter+"_max = "+Smax+";");
%Smax = 36;
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
% parameters
signal = 2;
% First Formant range ________ find avg density
%------------------------------------
if (signal>=1)
    start = 38;
    ends  = 700;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F1  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F1_start = Freq(1);");
    disp(Letter + "_F1_end = Freq(end);");
    disp("["+Letter+"_F1_range, x] = size(S(" ...
        +Letter+"_F1_start:"+Letter+"_F1_end, :));");
    disp(Letter+"_D1= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=2)
    start = 1000;
    ends  = 1200;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F2  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F2_start = Freq(1);");
    disp(Letter + "_F2_end = Freq(end);");
    disp("["+Letter+"_F2_range, x] = size(S(" ...
        +Letter+"_F2_start:"+Letter+"_F2_end, :));");
    disp(Letter+"_D2= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=3)
    start = 0;
    ends  = 780;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F3  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F3_start = Freq(1);");
    disp(Letter + "_F3_end = Freq(end);");
    disp("["+Letter+"_F3_range, x] = size(S(" ...
        +Letter+"_F3_start:"+Letter+"_F3_end, :));");
    disp(Letter+"_D3= " + num2str(AvgDen)+";");;
end
%------------------------------------
if (signal>=4)
    start = 0;
    ends  = 780;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F4  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F4_start = Freq(1);");
    disp(Letter + "_F4_end = Freq(end);");
    disp("["+Letter+"_F4_range, x] = size(S(" ...
        +Letter+"_F4_start:"+Letter+"_F4_end, :));");
    disp(Letter+"_D4= " + num2str(AvgDen)+";");
end
%------------------------------------


%% -------------------------------------------------------------------
graph = 0;
Letter = "d";
[data, fs] = audioread('TrainingData\d dad sound.m4a');
%fs =fs/2;
%data = data(1:2:end);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
%Smax = max(abs(S),[],'all');
%S = S/Smax;
disp("%-------------------------------------------------------");
disp("% /"+Letter+"/ sound in ");
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
% formant ranges you detect, find the avg signal length
% step one find the time range of signal you detected;
T_index_start = find(T >= 1.49);
T_index_end   = find(T >= 1.605);
Stemp = S(:,T_index_start:T_index_end);
Smax = max(abs(Stemp),[],'all');
disp(Letter+"_max = "+Smax+";");
%Smax = 36;
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
% parameters
signal = 3;
% First Formant range ________ find avg density
%------------------------------------
if (signal>=1)
    start = 100;
    ends  = 500;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F1  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F1_start = Freq(1);");
    disp(Letter + "_F1_end = Freq(end);");
    disp("["+Letter+"_F1_range, x] = size(S(" ...
        +Letter+"_F1_start:"+Letter+"_F1_end, :));");
    disp(Letter+"_D1= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=2)
    start = 1380;
    ends  = 1521;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F2  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F2_start = Freq(1);");
    disp(Letter + "_F2_end = Freq(end);");
    disp("["+Letter+"_F2_range, x] = size(S(" ...
        +Letter+"_F2_start:"+Letter+"_F2_end, :));");
    disp(Letter+"_D2= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=3)
    start = 2330;
    ends  = 2550;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F3  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F3_start = Freq(1);");
    disp(Letter + "_F3_end = Freq(end);");
    disp("["+Letter+"_F3_range, x] = size(S(" ...
        +Letter+"_F3_start:"+Letter+"_F3_end, :));");
    disp(Letter+"_D3= " + num2str(AvgDen)+";");;
end
%------------------------------------
if (signal>=4)
    start = 0;
    ends  = 780;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F4  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F4_start = Freq(1);");
    disp(Letter + "_F4_end = Freq(end);");
    disp("["+Letter+"_F4_range, x] = size(S(" ...
        +Letter+"_F4_start:"+Letter+"_F4_end, :));");
    disp(Letter+"_D4= " + num2str(AvgDen)+";");
end
%------------------------------------


%% -------------------------------------------------------------------
graph = 0;
Letter = "f";
[data, fs] = audioread('TrainingData\f fat sound.m4a');
%fs =fs/2;
%data = data(1:2:end);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
%Smax = max(abs(S),[],'all');
%S = S/Smax;
disp("%-------------------------------------------------------");
disp("% /"+Letter+"/ sound in ");
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
% formant ranges you detect, find the avg signal length
% step one find the time range of signal you detected;
T_index_start = find(T >= 1.269);
T_index_end   = find(T >= 1.557);
Stemp = S(:,T_index_start:T_index_end);
Smax = max(abs(Stemp),[],'all');
disp(Letter+"_max = "+Smax+";");
%Smax = 36;
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
% parameters
signal = 2;
% First Formant range ________ find avg density
%------------------------------------
if (signal>=1)
    start = 0;
    ends  = 300;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F1  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F1_start = Freq(1);");
    disp(Letter + "_F1_end = Freq(end);");
    disp("["+Letter+"_F1_range, x] = size(S(" ...
        +Letter+"_F1_start:"+Letter+"_F1_end, :));");
    disp(Letter+"_D1= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=2)
    start = 6800;
    ends  = 12500;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F2  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F2_start = Freq(1);");
    disp(Letter + "_F2_end = Freq(end);");
    disp("["+Letter+"_F2_range, x] = size(S(" ...
        +Letter+"_F2_start:"+Letter+"_F2_end, :));");
    disp(Letter+"_D2= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=3)
    start = 2330;
    ends  = 2550;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F3  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F3_start = Freq(1);");
    disp(Letter + "_F3_end = Freq(end);");
    disp("["+Letter+"_F3_range, x] = size(S(" ...
        +Letter+"_F3_start:"+Letter+"_F3_end, :));");
    disp(Letter+"_D3= " + num2str(AvgDen)+";");;
end
%------------------------------------
if (signal>=4)
    start = 0;
    ends  = 780;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F4  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F4_start = Freq(1);");
    disp(Letter + "_F4_end = Freq(end);");
    disp("["+Letter+"_F4_range, x] = size(S(" ...
        +Letter+"_F4_start:"+Letter+"_F4_end, :));");
    disp(Letter+"_D4= " + num2str(AvgDen)+";");
end
%------------------------------------


%% -------------------------------------------------------------------
graph = 0;
Letter = "g";
[data, fs] = audioread('TrainingData\g ghost sound.m4a');
%fs =fs/2;
%data = data(1:2:end);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
%Smax = max(abs(S),[],'all');
%S = S/Smax;
disp("%-------------------------------------------------------");
disp("% /"+Letter+"/ sound in ");
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
% formant ranges you detect, find the avg signal length
% step one find the time range of signal you detected;
T_index_start = find(T >= 1.54);
T_index_end   = find(T >= 1.659);
Stemp = S(:,T_index_start:T_index_end);
Smax = max(abs(Stemp),[],'all');
disp(Letter+"_max = "+Smax+";");
%Smax = 36;
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
% parameters
signal = 2;
% First Formant range ________ find avg density
%------------------------------------
if (signal>=1)
    start = 0;
    ends  = 780;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F1  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F1_start = Freq(1);");
    disp(Letter + "_F1_end = Freq(end);");
    disp("["+Letter+"_F1_range, x] = size(S(" ...
        +Letter+"_F1_start:"+Letter+"_F1_end, :));");
    disp(Letter+"_D1= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=2)
    start = 1100;
    ends  = 1600;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F2  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F2_start = Freq(1);");
    disp(Letter + "_F2_end = Freq(end);");
    disp("["+Letter+"_F2_range, x] = size(S(" ...
        +Letter+"_F2_start:"+Letter+"_F2_end, :));");
    disp(Letter+"_D2= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=3)
    start = 2330;
    ends  = 2550;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F3  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F3_start = Freq(1);");
    disp(Letter + "_F3_end = Freq(end);");
    disp("["+Letter+"_F3_range, x] = size(S(" ...
        +Letter+"_F3_start:"+Letter+"_F3_end, :));");
    disp(Letter+"_D3= " + num2str(AvgDen)+";");;
end
%------------------------------------
if (signal>=4)
    start = 0;
    ends  = 780;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F4  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F4_start = Freq(1);");
    disp(Letter + "_F4_end = Freq(end);");
    disp("["+Letter+"_F4_range, x] = size(S(" ...
        +Letter+"_F4_start:"+Letter+"_F4_end, :));");
    disp(Letter+"_D4= " + num2str(AvgDen)+";");
end
%------------------------------------


%% -------------------------------------------------------------------
graph = 0;
Letter = "h";
[data, fs] = audioread('TrainingData\h hop sound.m4a');
%fs =fs/2;
%data = data(1:2:end);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
%Smax = max(abs(S),[],'all');
%S = S/Smax;
disp("%-------------------------------------------------------");
disp("% /"+Letter+"/ sound in ");
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
% formant ranges you detect, find the avg signal length
% step one find the time range of signal you detected;
T_index_start = find(T >= 1.419);
T_index_end   = find(T >= 1.557);
Stemp = S(:,T_index_start:T_index_end);
Smax = max(abs(Stemp),[],'all');
disp(Letter+"_max = "+Smax+";");
%Smax = 36;
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
% parameters
signal = 2;
% First Formant range ________ find avg density
%------------------------------------
if (signal>=1)
    start = 1100;
    ends  = 1600;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F1  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F1_start = Freq(1);");
    disp(Letter + "_F1_end = Freq(end);");
    disp("["+Letter+"_F1_range, x] = size(S(" ...
        +Letter+"_F1_start:"+Letter+"_F1_end, :));");
    disp(Letter+"_D1= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=2)
    start = 2600;
    ends  = 3000;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F2  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F2_start = Freq(1);");
    disp(Letter + "_F2_end = Freq(end);");
    disp("["+Letter+"_F2_range, x] = size(S(" ...
        +Letter+"_F2_start:"+Letter+"_F2_end, :));");
    disp(Letter+"_D2= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=3)
    start = 2330;
    ends  = 2550;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F3  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F3_start = Freq(1);");
    disp(Letter + "_F3_end = Freq(end);");
    disp("["+Letter+"_F3_range, x] = size(S(" ...
        +Letter+"_F3_start:"+Letter+"_F3_end, :));");
    disp(Letter+"_D3= " + num2str(AvgDen)+";");;
end
%------------------------------------
if (signal>=4)
    start = 0;
    ends  = 780;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F4  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F4_start = Freq(1);");
    disp(Letter + "_F4_end = Freq(end);");
    disp("["+Letter+"_F4_range, x] = size(S(" ...
        +Letter+"_F4_start:"+Letter+"_F4_end, :));");
    disp(Letter+"_D4= " + num2str(AvgDen)+";");
end
%------------------------------------

%% -------------------------------------------------------------------------
graph = 0;
Letter = "dj";
[data, fs] = audioread('TrainingData\j jam sound.m4a');
%fs =fs/2;
%data = data(1:2:end);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
%Smax = max(abs(S),[],'all');
%S = S/Smax;
disp("%-------------------------------------------------------");
disp("% /dʒ/ sound in ");
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
% formant ranges you detect, find the avg signal length
% step one find the time range of signal you detected;
T_index_start = find(T >= 1.349);
T_index_end   = find(T >= 1.581);
Stemp = S(:,T_index_start:T_index_end);
Smax = max(abs(Stemp),[],'all');
disp(Letter+"_max = "+Smax+";");
%Smax = 36;
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
% parameters
signal = 3;
% First Formant range ________ find avg density
%------------------------------------
if (signal>=1)
    start = 0;
    ends  = 540;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F1  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F1_start = Freq(1);");
    disp(Letter + "_F1_end = Freq(end);");
    disp("["+Letter+"_F1_range, x] = size(S(" ...
        +Letter+"_F1_start:"+Letter+"_F1_end, :));");
    disp(Letter+"_D1= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=2)
    start = 1400;
    ends  = 1750;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F2  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F2_start = Freq(1);");
    disp(Letter + "_F2_end = Freq(end);");
    disp("["+Letter+"_F2_range, x] = size(S(" ...
        +Letter+"_F2_start:"+Letter+"_F2_end, :));");
    disp(Letter+"_D2= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=3)
    start = 2300;
    ends  = 6000;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F3  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F3_start = Freq(1);");
    disp(Letter + "_F3_end = Freq(end);");
    disp("["+Letter+"_F3_range, x] = size(S(" ...
        +Letter+"_F3_start:"+Letter+"_F3_end, :));");
    disp(Letter+"_D3= " + num2str(AvgDen)+";");;
end
%------------------------------------
if (signal>=4)
    start = 0;
    ends  = 780;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F4  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F4_start = Freq(1);");
    disp(Letter + "_F4_end = Freq(end);");
    disp("["+Letter+"_F4_range, x] = size(S(" ...
        +Letter+"_F4_start:"+Letter+"_F4_end, :));");
    disp(Letter+"_D4= " + num2str(AvgDen)+";");
end
%------------------------------------

%% -------------------------------------------------------------------------
graph = 0;
Letter = "k";
[data, fs] = audioread('TrainingData\k rack cat k sound.m4a');
%fs =fs/2;
%data = data(1:2:end);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
%Smax = max(abs(S),[],'all');
%S = S/Smax;
disp("%-------------------------------------------------------");
disp("% /"+Letter+"/ sound in ");
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
% formant ranges you detect, find the avg signal length
% step one find the time range of signal you detected;
T_index_start = find(T >= 1.139);
T_index_end   = find(T >= 1.301);
Stemp = S(:,T_index_start:T_index_end);
Smax = max(abs(Stemp),[],'all');
disp(Letter+"_max = "+Smax+";");
%Smax = 36;
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
% parameters
signal = 3;
% First Formant range ________ find avg density
%------------------------------------
if (signal>=1)
    start = 800;
    ends  = 2000;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F1  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F1_start = Freq(1);");
    disp(Letter + "_F1_end = Freq(end);");
    disp("["+Letter+"_F1_range, x] = size(S(" ...
        +Letter+"_F1_start:"+Letter+"_F1_end, :));");
    disp(Letter+"_D1= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=2)
    start = 3800;
    ends  = 4500;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F2  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F2_start = Freq(1);");
    disp(Letter + "_F2_end = Freq(end);");
    disp("["+Letter+"_F2_range, x] = size(S(" ...
        +Letter+"_F2_start:"+Letter+"_F2_end, :));");
    disp(Letter+"_D2= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=3)
    start = 7300;
    ends  = 11000;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F3  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F3_start = Freq(1);");
    disp(Letter + "_F3_end = Freq(end);");
    disp("["+Letter+"_F3_range, x] = size(S(" ...
        +Letter+"_F3_start:"+Letter+"_F3_end, :));");
    disp(Letter+"_D3= " + num2str(AvgDen)+";");;
end
%------------------------------------
if (signal>=4)
    start = 0;
    ends  = 780;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F4  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F4_start = Freq(1);");
    disp(Letter + "_F4_end = Freq(end);");
    disp("["+Letter+"_F4_range, x] = size(S(" ...
        +Letter+"_F4_start:"+Letter+"_F4_end, :));");
    disp(Letter+"_D4= " + num2str(AvgDen)+";");
end
%------------------------------------

%% -------------------------------------------------------------------------
graph = 0;
Letter = "l";
[data, fs] = audioread('TrainingData\l live sound.m4a');
%fs =fs/2;
%data = data(1:2:end);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
%Smax = max(abs(S),[],'all');
%S = S/Smax;
disp("%-------------------------------------------------------");
disp("% /"+Letter+"/ sound in ");
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
% formant ranges you detect, find the avg signal length
% step one find the time range of signal you detected;
T_index_start = find(T >= 1.181);
T_index_end   = find(T >= 1.648);
Stemp = S(:,T_index_start:T_index_end);
Smax = max(abs(Stemp),[],'all');
disp(Letter+"_max = "+Smax+";");
%Smax = 36;
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
% parameters
signal = 4;
% First Formant range ________ find avg density
%------------------------------------
if (signal>=1)
    start = 0;
    ends  = 600;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F1  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F1_start = Freq(1);");
    disp(Letter + "_F1_end = Freq(end);");
    disp("["+Letter+"_F1_range, x] = size(S(" ...
        +Letter+"_F1_start:"+Letter+"_F1_end, :));");
    disp(Letter+"_D1= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=2)
    start = 1100;
    ends  = 1650;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F2  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F2_start = Freq(1);");
    disp(Letter + "_F2_end = Freq(end);");
    disp("["+Letter+"_F2_range, x] = size(S(" ...
        +Letter+"_F2_start:"+Letter+"_F2_end, :));");
    disp(Letter+"_D2= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=3)
    start = 2250;
    ends  = 4000;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F3  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F3_start = Freq(1);");
    disp(Letter + "_F3_end = Freq(end);");
    disp("["+Letter+"_F3_range, x] = size(S(" ...
        +Letter+"_F3_start:"+Letter+"_F3_end, :));");
    disp(Letter+"_D3= " + num2str(AvgDen)+";");;
end
%------------------------------------
if (signal>=4)
    start = 13000;
    ends  = 18000;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F4  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F4_start = Freq(1);");
    disp(Letter + "_F4_end = Freq(end);");
    disp("["+Letter+"_F4_range, x] = size(S(" ...
        +Letter+"_F4_start:"+Letter+"_F4_end, :));");
    disp(Letter+"_D4= " + num2str(AvgDen)+";");
end
%------------------------------------


%% -------------------------------------------------------------------------
graph = 0;
Letter = "m";
[data, fs] = audioread('TrainingData\m man sound.m4a');
%fs =fs/2;
%data = data(1:2:end);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
%Smax = max(abs(S),[],'all');
%S = S/Smax;
disp("%-------------------------------------------------------");
disp("% /"+Letter+"/ sound in ");
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
% formant ranges you detect, find the avg signal length
% step one find the time range of signal you detected;
T_index_start = find(T >= 1.144);
T_index_end   = find(T >= 1.557);
Stemp = S(:,T_index_start:T_index_end);
Smax = max(abs(Stemp),[],'all');
disp(Letter+"_max = "+Smax+";");
%Smax = 36;
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
% parameters
signal = 4;
% First Formant range ________ find avg density
%------------------------------------
if (signal>=1)
    start = 0;
    ends  = 550;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F1  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F1_start = Freq(1);");
    disp(Letter + "_F1_end = Freq(end);");
    disp("["+Letter+"_F1_range, x] = size(S(" ...
        +Letter+"_F1_start:"+Letter+"_F1_end, :));");
    disp(Letter+"_D1= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=2)
    start = 680;
    ends  = 1450;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F2  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F2_start = Freq(1);");
    disp(Letter + "_F2_end = Freq(end);");
    disp("["+Letter+"_F2_range, x] = size(S(" ...
        +Letter+"_F2_start:"+Letter+"_F2_end, :));");
    disp(Letter+"_D2= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=3)
    start = 1870;
    ends  = 2700;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F3  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F3_start = Freq(1);");
    disp(Letter + "_F3_end = Freq(end);");
    disp("["+Letter+"_F3_range, x] = size(S(" ...
        +Letter+"_F3_start:"+Letter+"_F3_end, :));");
    disp(Letter+"_D3= " + num2str(AvgDen)+";");;
end
%------------------------------------
if (signal>=4)
    start = 13000;
    ends  = 18000;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F4  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F4_start = Freq(1);");
    disp(Letter + "_F4_end = Freq(end);");
    disp("["+Letter+"_F4_range, x] = size(S(" ...
        +Letter+"_F4_start:"+Letter+"_F4_end, :));");
    disp(Letter+"_D4= " + num2str(AvgDen)+";");
end
%------------------------------------


%% -------------------------------------------------------------------------
graph = 0;
Letter = "n";
[data, fs] = audioread('TrainingData\nnn sound.m4a');
%fs =fs/2;
%data = data(1:2:end);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
%Smax = max(abs(S),[],'all');
%S = S/Smax;
disp("%-------------------------------------------------------");
disp("% /"+Letter+"/ sound in ");
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
% formant ranges you detect, find the avg signal length
% step one find the time range of signal you detected;
T_index_start = find(T >= 1.445);
T_index_end   = find(T >= 2.04);
Stemp = S(:,T_index_start:T_index_end);
Smax = max(abs(Stemp),[],'all');
disp(Letter+"_max = "+Smax+";");
%Smax = 36;
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
% parameters
signal = 4;
% First Formant range ________ find avg density
%------------------------------------
if (signal>=1)
    start = 80;
    ends  = 190;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F1  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F1_start = Freq(1);");
    disp(Letter + "_F1_end = Freq(end);");
    disp("["+Letter+"_F1_range, x] = size(S(" ...
        +Letter+"_F1_start:"+Letter+"_F1_end, :));");
    disp(Letter+"_D1= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=2)
    start = 220;
    ends  = 340;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F2  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F2_start = Freq(1);");
    disp(Letter + "_F2_end = Freq(end);");
    disp("["+Letter+"_F2_range, x] = size(S(" ...
        +Letter+"_F2_start:"+Letter+"_F2_end, :));");
    disp(Letter+"_D2= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=3)
    start = 380;
    ends  = 480;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F3  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F3_start = Freq(1);");
    disp(Letter + "_F3_end = Freq(end);");
    disp("["+Letter+"_F3_range, x] = size(S(" ...
        +Letter+"_F3_start:"+Letter+"_F3_end, :));");
    disp(Letter+"_D3= " + num2str(AvgDen)+";");;
end
%------------------------------------
if (signal>=4)
    start = 500;
    ends  = 590;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F4  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F4_start = Freq(1);");
    disp(Letter + "_F4_end = Freq(end);");
    disp("["+Letter+"_F4_range, x] = size(S(" ...
        +Letter+"_F4_start:"+Letter+"_F4_end, :));");
    disp(Letter+"_D4= " + num2str(AvgDen)+";");
end
%------------------------------------

%% -------------------------------------------------------------------------
graph = 0;
Letter = "p";
[data, fs] = audioread('TrainingData\p pin pin sound.m4a');
%fs =fs/2;
%data = data(1:2:end);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
%Smax = max(abs(S),[],'all');
%S = S/Smax;
disp("%-------------------------------------------------------");
disp("% /"+Letter+"/ sound in ");
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
% formant ranges you detect, find the avg signal length
% step one find the time range of signal you detected;
T_index_start = find(T >= 1.02);
T_index_end   = find(T >= 1.11);
Stemp = S(:,T_index_start:T_index_end);
Smax = max(abs(Stemp),[],'all');
disp(Letter+"_max = "+Smax+";");
%Smax = 36;
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
% parameters
signal = 1;
% First Formant range ________ find avg density
%------------------------------------
if (signal>=1)
    start = 560;
    ends  = 12000;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F1  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F1_start = Freq(1);");
    disp(Letter + "_F1_end = Freq(end);");
    disp("["+Letter+"_F1_range, x] = size(S(" ...
        +Letter+"_F1_start:"+Letter+"_F1_end, :));");
    disp(Letter+"_D1= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=2)
    start = 220;
    ends  = 340;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F2  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F2_start = Freq(1);");
    disp(Letter + "_F2_end = Freq(end);");
    disp("["+Letter+"_F2_range, x] = size(S(" ...
        +Letter+"_F2_start:"+Letter+"_F2_end, :));");
    disp(Letter+"_D2= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=3)
    start = 380;
    ends  = 480;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F3  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F3_start = Freq(1);");
    disp(Letter + "_F3_end = Freq(end);");
    disp("["+Letter+"_F3_range, x] = size(S(" ...
        +Letter+"_F3_start:"+Letter+"_F3_end, :));");
    disp(Letter+"_D3= " + num2str(AvgDen)+";");;
end
%------------------------------------
if (signal>=4)
    start = 500;
    ends  = 590;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F4  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F4_start = Freq(1);");
    disp(Letter + "_F4_end = Freq(end);");
    disp("["+Letter+"_F4_range, x] = size(S(" ...
        +Letter+"_F4_start:"+Letter+"_F4_end, :));");
    disp(Letter+"_D4= " + num2str(AvgDen)+";");
end
%------------------------------------

%% -------------------------------------------------------------------
graph = 0;
Letter = "r";
[data, fs] = audioread('TrainingData\r run r run sound.m4a');
%fs =fs/2;
%data = data(1:2:end);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
%Smax = max(abs(S),[],'all');
%S = S/Smax;
disp("%-------------------------------------------------------");
disp("% /"+Letter+"/ sound in ");
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
% formant ranges you detect, find the avg signal length
% step one find the time range of signal you detected;
T_index_start = find(T >= 4.26);
T_index_end   = find(T >= 4.62);
Stemp = S(:,T_index_start:T_index_end);
Smax = max(abs(Stemp),[],'all');
disp(Letter+"_max = "+Smax+";");
%Smax = 36;
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
% parameters
signal = 2;
% First Formant range ________ find avg density
%------------------------------------
if (signal>=1)
    start = 100;
    ends  = 700;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F1  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F1_start = Freq(1);");
    disp(Letter + "_F1_end = Freq(end);");
    disp("["+Letter+"_F1_range, x] = size(S(" ...
        +Letter+"_F1_start:"+Letter+"_F1_end, :));");
    disp(Letter+"_D1= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=2)
    start = 1100;
    ends  = 1900;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F2  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F2_start = Freq(1);");
    disp(Letter + "_F2_end = Freq(end);");
    disp("["+Letter+"_F2_range, x] = size(S(" ...
        +Letter+"_F2_start:"+Letter+"_F2_end, :));");
    disp(Letter+"_D2= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=3)
    start = 0;
    ends  = 780;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F3  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F3_start = Freq(1);");
    disp(Letter + "_F3_end = Freq(end);");
    disp("["+Letter+"_F3_range, x] = size(S(" ...
        +Letter+"_F3_start:"+Letter+"_F3_end, :));");
    disp(Letter+"_D3= " + num2str(AvgDen)+";");;
end
%------------------------------------
if (signal>=4)
    start = 0;
    ends  = 780;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F4  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F4_start = Freq(1);");
    disp(Letter + "_F4_end = Freq(end);");
    disp("["+Letter+"_F4_range, x] = size(S(" ...
        +Letter+"_F4_start:"+Letter+"_F4_end, :));");
    disp(Letter+"_D4= " + num2str(AvgDen)+";");
end
%------------------------------------

%% -------------------------------------------------------------------
graph = 0;
Letter = "s";
[data, fs] = audioread('TrainingData\s sun sound.m4a');
%fs =fs/2;
%data = data(1:2:end);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
%Smax = max(abs(S),[],'all');
%S = S/Smax;
disp("%-------------------------------------------------------");
disp("% /"+Letter+"/ sound in ");
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
% formant ranges you detect, find the avg signal length
% step one find the time range of signal you detected;
T_index_start = find(T >= 1.171);
T_index_end   = find(T >= 1.512);
Stemp = S(:,T_index_start:T_index_end);
Smax = max(abs(Stemp),[],'all');
disp(Letter+"_max = "+Smax+";");
%Smax = 36;
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
% parameters
signal = 3;
% First Formant range ________ find avg density
%------------------------------------
if (signal>=1)
    start = 3500;
    ends  = 5200;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F1  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F1_start = Freq(1);");
    disp(Letter + "_F1_end = Freq(end);");
    disp("["+Letter+"_F1_range, x] = size(S(" ...
        +Letter+"_F1_start:"+Letter+"_F1_end, :));");
    disp(Letter+"_D1= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=2)
    start = 5600;
    ends  = 9500;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F2  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F2_start = Freq(1);");
    disp(Letter + "_F2_end = Freq(end);");
    disp("["+Letter+"_F2_range, x] = size(S(" ...
        +Letter+"_F2_start:"+Letter+"_F2_end, :));");
    disp(Letter+"_D2= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=3)
    start = 10200;
    ends  = 13160;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F3  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F3_start = Freq(1);");
    disp(Letter + "_F3_end = Freq(end);");
    disp("["+Letter+"_F3_range, x] = size(S(" ...
        +Letter+"_F3_start:"+Letter+"_F3_end, :));");
    disp(Letter+"_D3= " + num2str(AvgDen)+";");;
end
%------------------------------------
if (signal>=4)
    start = 0;
    ends  = 780;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F4  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F4_start = Freq(1);");
    disp(Letter + "_F4_end = Freq(end);");
    disp("["+Letter+"_F4_range, x] = size(S(" ...
        +Letter+"_F4_start:"+Letter+"_F4_end, :));");
    disp(Letter+"_D4= " + num2str(AvgDen)+";");
end
%------------------------------------


%% -------------------------------------------------------------------
graph = 0;
Letter = "t";
[data, fs] = audioread('TrainingData\t testing testing t sound.m4a');
%fs =fs/2;
%data = data(1:2:end);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
%Smax = max(abs(S),[],'all');
%S = S/Smax;
disp("%-------------------------------------------------------");
disp("% /"+Letter+"/ sound in ");
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
% formant ranges you detect, find the avg signal length
% step one find the time range of signal you detected;
T_index_start = find(T >= 1.107);
T_index_end   = find(T >= 1.155);
Stemp = S(:,T_index_start:T_index_end);
Smax = max(abs(Stemp),[],'all');
disp(Letter+"_max = "+Smax+";");
%Smax = 36;
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
% parameters
signal = 2;
% First Formant range ________ find avg density
%------------------------------------
if (signal>=1)
    start = 1500;
    ends  = 5000;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F1  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F1_start = Freq(1);");
    disp(Letter + "_F1_end = Freq(end);");
    disp("["+Letter+"_F1_range, x] = size(S(" ...
        +Letter+"_F1_start:"+Letter+"_F1_end, :));");
    disp(Letter+"_D1= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=2)
    start = 6800;
    ends  = 10300;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F2  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F2_start = Freq(1);");
    disp(Letter + "_F2_end = Freq(end);");
    disp("["+Letter+"_F2_range, x] = size(S(" ...
        +Letter+"_F2_start:"+Letter+"_F2_end, :));");
    disp(Letter+"_D2= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=3)
    start = 10200;
    ends  = 13160;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F3  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F3_start = Freq(1);");
    disp(Letter + "_F3_end = Freq(end);");
    disp("["+Letter+"_F3_range, x] = size(S(" ...
        +Letter+"_F3_start:"+Letter+"_F3_end, :));");
    disp(Letter+"_D3= " + num2str(AvgDen)+";");;
end
%------------------------------------
if (signal>=4)
    start = 0;
    ends  = 780;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F4  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F4_start = Freq(1);");
    disp(Letter + "_F4_end = Freq(end);");
    disp("["+Letter+"_F4_range, x] = size(S(" ...
        +Letter+"_F4_start:"+Letter+"_F4_end, :));");
    disp(Letter+"_D4= " + num2str(AvgDen)+";");
end
%------------------------------------


%% -------------------------------------------------------------------
graph = 0;
Letter = "v";
[data, fs] = audioread('TrainingData\v vine sound.m4a');
%fs =fs/2;
%data = data(1:2:end);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
%Smax = max(abs(S),[],'all');
%S = S/Smax;
disp("%-------------------------------------------------------");
disp("% /"+Letter+"/ sound in ");
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
% formant ranges you detect, find the avg signal length
% step one find the time range of signal you detected;
T_index_start = find(T >= 1.005);
T_index_end   = find(T >= 1.341);
Stemp = S(:,T_index_start:T_index_end);
Smax = max(abs(Stemp),[],'all');
disp(Letter+"_max = "+Smax+";");
%Smax = 36;
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
% parameters
signal = 2;
% First Formant range ________ find avg density
%------------------------------------
if (signal>=1)
    start = 0;
    ends  = 300;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F1  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F1_start = Freq(1);");
    disp(Letter + "_F1_end = Freq(end);");
    disp("["+Letter+"_F1_range, x] = size(S(" ...
        +Letter+"_F1_start:"+Letter+"_F1_end, :));");
    disp(Letter+"_D1= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=2)
    start = 4000;
    ends  = 12000;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F2  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F2_start = Freq(1);");
    disp(Letter + "_F2_end = Freq(end);");
    disp("["+Letter+"_F2_range, x] = size(S(" ...
        +Letter+"_F2_start:"+Letter+"_F2_end, :));");
    disp(Letter+"_D2= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=3)
    start = 10200;
    ends  = 13160;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F3  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F3_start = Freq(1);");
    disp(Letter + "_F3_end = Freq(end);");
    disp("["+Letter+"_F3_range, x] = size(S(" ...
        +Letter+"_F3_start:"+Letter+"_F3_end, :));");
    disp(Letter+"_D3= " + num2str(AvgDen)+";");;
end
%------------------------------------
if (signal>=4)
    start = 0;
    ends  = 780;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F4  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F4_start = Freq(1);");
    disp(Letter + "_F4_end = Freq(end);");
    disp("["+Letter+"_F4_range, x] = size(S(" ...
        +Letter+"_F4_start:"+Letter+"_F4_end, :));");
    disp(Letter+"_D4= " + num2str(AvgDen)+";");
end
%------------------------------------

%% -------------------------------------------------------------------
graph = 0;
Letter = "w";
[data, fs] = audioread('TrainingData\w wit sound.m4a');
%fs =fs/2;
%data = data(1:2:end);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
%Smax = max(abs(S),[],'all');
%S = S/Smax;
disp("%-------------------------------------------------------");
disp("% /"+Letter+"/ sound in ");
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
% formant ranges you detect, find the avg signal length
% step one find the time range of signal you detected;
T_index_start = find(T >= 1.109);
T_index_end   = find(T >= 1.227);
Stemp = S(:,T_index_start:T_index_end);
Smax = max(abs(Stemp),[],'all');
disp(Letter+"_max = "+Smax+";");
%Smax = 36;
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
% parameters
signal = 1;
% First Formant range ________ find avg density
%------------------------------------
if (signal>=1)
    start = 0;
    ends  = 1000;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F1  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F1_start = Freq(1);");
    disp(Letter + "_F1_end = Freq(end);");
    disp("["+Letter+"_F1_range, x] = size(S(" ...
        +Letter+"_F1_start:"+Letter+"_F1_end, :));");
    disp(Letter+"_D1= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=2)
    start = 4000;
    ends  = 12000;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F2  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F2_start = Freq(1);");
    disp(Letter + "_F2_end = Freq(end);");
    disp("["+Letter+"_F2_range, x] = size(S(" ...
        +Letter+"_F2_start:"+Letter+"_F2_end, :));");
    disp(Letter+"_D2= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=3)
    start = 10200;
    ends  = 13160;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F3  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F3_start = Freq(1);");
    disp(Letter + "_F3_end = Freq(end);");
    disp("["+Letter+"_F3_range, x] = size(S(" ...
        +Letter+"_F3_start:"+Letter+"_F3_end, :));");
    disp(Letter+"_D3= " + num2str(AvgDen)+";");;
end
%------------------------------------
if (signal>=4)
    start = 0;
    ends  = 780;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F4  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F4_start = Freq(1);");
    disp(Letter + "_F4_end = Freq(end);");
    disp("["+Letter+"_F4_range, x] = size(S(" ...
        +Letter+"_F4_start:"+Letter+"_F4_end, :));");
    disp(Letter+"_D4= " + num2str(AvgDen)+";");
end
%------------------------------------



%% -------------------------------------------------------------------
graph = 0;
Letter = "z";
[data, fs] = audioread('TrainingData\z buzz sound.m4a');
%fs =fs/2;
%data = data(1:2:end);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
%Smax = max(abs(S),[],'all');
%S = S/Smax;
disp("%-------------------------------------------------------");
disp("% /"+Letter+"/ sound in ");
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
% formant ranges you detect, find the avg signal length
% step one find the time range of signal you detected;
T_index_start = find(T >= 2.76);
T_index_end   = find(T >= 3.04);
Stemp = S(:,T_index_start:T_index_end);
Smax = max(abs(Stemp),[],'all');
disp(Letter+"_max = "+Smax+";");
%Smax = 36;
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
% parameters
signal = 2;
% First Formant range ________ find avg density
%------------------------------------
if (signal>=1)
    start = 0;
    ends  = 600;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F1  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F1_start = Freq(1);");
    disp(Letter + "_F1_end = Freq(end);");
    disp("["+Letter+"_F1_range, x] = size(S(" ...
        +Letter+"_F1_start:"+Letter+"_F1_end, :));");
    disp(Letter+"_D1= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=2)
    start = 5000;
    ends  = 9000;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F2  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F2_start = Freq(1);");
    disp(Letter + "_F2_end = Freq(end);");
    disp("["+Letter+"_F2_range, x] = size(S(" ...
        +Letter+"_F2_start:"+Letter+"_F2_end, :));");
    disp(Letter+"_D2= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=3)
    start = 10200;
    ends  = 13160;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F3  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F3_start = Freq(1);");
    disp(Letter + "_F3_end = Freq(end);");
    disp("["+Letter+"_F3_range, x] = size(S(" ...
        +Letter+"_F3_start:"+Letter+"_F3_end, :));");
    disp(Letter+"_D3= " + num2str(AvgDen)+";");;
end
%------------------------------------
if (signal>=4)
    start = 0;
    ends  = 780;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F4  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F4_start = Freq(1);");
    disp(Letter + "_F4_end = Freq(end);");
    disp("["+Letter+"_F4_range, x] = size(S(" ...
        +Letter+"_F4_start:"+Letter+"_F4_end, :));");
    disp(Letter+"_D4= " + num2str(AvgDen)+";");
end
%------------------------------------



%% -------------------------------------------------------------------
graph = 0;
Letter = "si";
[data, fs] = audioread('TrainingData\zz treasure sound.m4a');
%fs =fs/2;
%data = data(1:2:end);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
%Smax = max(abs(S),[],'all');
%S = S/Smax;
disp("%-------------------------------------------------------");
disp("% /ʒ/ sound in ");
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
% formant ranges you detect, find the avg signal length
% step one find the time range of signal you detected;
T_index_start = find(T >= 1.28);
T_index_end   = find(T >= 1.65);
Stemp = S(:,T_index_start:T_index_end);
Smax = max(abs(Stemp),[],'all');
disp(Letter+"_max = "+Smax+";");
%Smax = 36;
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
% parameters
signal = 3;
% First Formant range ________ find avg density
%------------------------------------
if (signal>=1)
    start = 0;
    ends  = 560;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F1  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F1_start = Freq(1);");
    disp(Letter + "_F1_end = Freq(end);");
    disp("["+Letter+"_F1_range, x] = size(S(" ...
        +Letter+"_F1_start:"+Letter+"_F1_end, :));");
    disp(Letter+"_D1= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=2)
    start = 1500;
    ends  = 5500;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F2  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F2_start = Freq(1);");
    disp(Letter + "_F2_end = Freq(end);");
    disp("["+Letter+"_F2_range, x] = size(S(" ...
        +Letter+"_F2_start:"+Letter+"_F2_end, :));");
    disp(Letter+"_D2= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=3)
    start = 8000;
    ends  = 8600;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F3  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F3_start = Freq(1);");
    disp(Letter + "_F3_end = Freq(end);");
    disp("["+Letter+"_F3_range, x] = size(S(" ...
        +Letter+"_F3_start:"+Letter+"_F3_end, :));");
    disp(Letter+"_D3= " + num2str(AvgDen)+";");;
end
%------------------------------------
if (signal>=4)
    start = 0;
    ends  = 780;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F4  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F4_start = Freq(1);");
    disp(Letter + "_F4_end = Freq(end);");
    disp("["+Letter+"_F4_range, x] = size(S(" ...
        +Letter+"_F4_start:"+Letter+"_F4_end, :));");
    disp(Letter+"_D4= " + num2str(AvgDen)+";");
end
%------------------------------------


%% -------------------------------------------------------------------
graph = 0;
Letter = "ch";
[data, fs] = audioread('TrainingData\ch chip watch sound.m4a');
%fs =fs/2;
%data = data(1:2:end);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
%Smax = max(abs(S),[],'all');
%S = S/Smax;
disp("%-------------------------------------------------------");
disp("% /"+Letter+"/ sound in ");
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
% formant ranges you detect, find the avg signal length
% step one find the time range of signal you detected;
T_index_start = find(T >= .99);
T_index_end   = find(T >= 1.1);
Stemp = S(:,T_index_start:T_index_end);
Smax = max(abs(Stemp),[],'all');
disp(Letter+"_max = "+Smax+";");
%Smax = 36;
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
% parameters
signal = 3;
% First Formant range ________ find avg density
%------------------------------------
if (signal>=1)
    start = 2000;
    ends  = 3700;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F1  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F1_start = Freq(1);");
    disp(Letter + "_F1_end = Freq(end);");
    disp("["+Letter+"_F1_range, x] = size(S(" ...
        +Letter+"_F1_start:"+Letter+"_F1_end, :));");
    disp(Letter+"_D1= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=2)
    start = 4500;
    ends  = 6700;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F2  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F2_start = Freq(1);");
    disp(Letter + "_F2_end = Freq(end);");
    disp("["+Letter+"_F2_range, x] = size(S(" ...
        +Letter+"_F2_start:"+Letter+"_F2_end, :));");
    disp(Letter+"_D2= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=3)
    start = 7800;
    ends  = 9800;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F3  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F3_start = Freq(1);");
    disp(Letter + "_F3_end = Freq(end);");
    disp("["+Letter+"_F3_range, x] = size(S(" ...
        +Letter+"_F3_start:"+Letter+"_F3_end, :));");
    disp(Letter+"_D3= " + num2str(AvgDen)+";");;
end
%------------------------------------
if (signal>=4)
    start = 0;
    ends  = 780;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F4  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F4_start = Freq(1);");
    disp(Letter + "_F4_end = Freq(end);");
    disp("["+Letter+"_F4_range, x] = size(S(" ...
        +Letter+"_F4_start:"+Letter+"_F4_end, :));");
    disp(Letter+"_D4= " + num2str(AvgDen)+";");
end
%------------------------------------



%% -------------------------------------------------------------------
graph = 0;
Letter = "sh";
[data, fs] = audioread('TrainingData\sh sham ocean sound.m4a');
%fs =fs/2;
%data = data(1:2:end);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
%Smax = max(abs(S),[],'all');
%S = S/Smax;
disp("%-------------------------------------------------------");
disp("% /"+Letter+"/ sound in ");
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
% formant ranges you detect, find the avg signal length
% step one find the time range of signal you detected;
T_index_start = find(T >= .7);
T_index_end   = find(T >= 1.07);
Stemp = S(:,T_index_start:T_index_end);
Smax = max(abs(Stemp),[],'all');
disp(Letter+"_max = "+Smax+";");
%Smax = 36;
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
% parameters
signal = 3;
% First Formant range ________ find avg density
%------------------------------------
if (signal>=1)
    start = 2000;
    ends  = 3500;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F1  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F1_start = Freq(1);");
    disp(Letter + "_F1_end = Freq(end);");
    disp("["+Letter+"_F1_range, x] = size(S(" ...
        +Letter+"_F1_start:"+Letter+"_F1_end, :));");
    disp(Letter+"_D1= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=2)
    start = 3700;
    ends  = 6000;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F2  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F2_start = Freq(1);");
    disp(Letter + "_F2_end = Freq(end);");
    disp("["+Letter+"_F2_range, x] = size(S(" ...
        +Letter+"_F2_start:"+Letter+"_F2_end, :));");
    disp(Letter+"_D2= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=3)
    start = 6000;
    ends  = 10000;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F3  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F3_start = Freq(1);");
    disp(Letter + "_F3_end = Freq(end);");
    disp("["+Letter+"_F3_range, x] = size(S(" ...
        +Letter+"_F3_start:"+Letter+"_F3_end, :));");
    disp(Letter+"_D3= " + num2str(AvgDen)+";");;
end
%------------------------------------
if (signal>=4)
    start = 0;
    ends  = 780;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F4  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F4_start = Freq(1);");
    disp(Letter + "_F4_end = Freq(end);");
    disp("["+Letter+"_F4_range, x] = size(S(" ...
        +Letter+"_F4_start:"+Letter+"_F4_end, :));");
    disp(Letter+"_D4= " + num2str(AvgDen)+";");
end
%------------------------------------



%% -------------------------------------------------------------------
graph = 0;
Letter = "th";
[data, fs] = audioread('TrainingData\th leather sound.m4a');
%fs =fs/2;
%data = data(1:2:end);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
%Smax = max(abs(S),[],'all');
%S = S/Smax;
disp("%-------------------------------------------------------");
disp("% /"+Letter+"/ sound in ");
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
% formant ranges you detect, find the avg signal length
% step one find the time range of signal you detected;
T_index_start = find(T >= .85);
T_index_end   = find(T >= 0.96);
Stemp = S(:,T_index_start:T_index_end);
Smax = max(abs(Stemp),[],'all');
disp(Letter+"_max = "+Smax+";");
%Smax = 36;
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
% parameters
signal = 3;
% First Formant range ________ find avg density
%------------------------------------
if (signal>=1)
    start = 0;
    ends  = 850;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F1  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F1_start = Freq(1);");
    disp(Letter + "_F1_end = Freq(end);");
    disp("["+Letter+"_F1_range, x] = size(S(" ...
        +Letter+"_F1_start:"+Letter+"_F1_end, :));");
    disp(Letter+"_D1= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=2)
    start = 1100;
    ends  = 1600;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F2  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F2_start = Freq(1);");
    disp(Letter + "_F2_end = Freq(end);");
    disp("["+Letter+"_F2_range, x] = size(S(" ...
        +Letter+"_F2_start:"+Letter+"_F2_end, :));");
    disp(Letter+"_D2= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=3)
    start = 2300;
    ends  = 2700;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F3  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F3_start = Freq(1);");
    disp(Letter + "_F3_end = Freq(end);");
    disp("["+Letter+"_F3_range, x] = size(S(" ...
        +Letter+"_F3_start:"+Letter+"_F3_end, :));");
    disp(Letter+"_D3= " + num2str(AvgDen)+";");;
end
%------------------------------------
if (signal>=4)
    start = 0;
    ends  = 780;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F4  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F4_start = Freq(1);");
    disp(Letter + "_F4_end = Freq(end);");
    disp("["+Letter+"_F4_range, x] = size(S(" ...
        +Letter+"_F4_start:"+Letter+"_F4_end, :));");
    disp(Letter+"_D4= " + num2str(AvgDen)+";");
end
%------------------------------------

%% -------------------------------------------------------------------
graph = 0;
Letter = "ng";
[data, fs] = audioread('TrainingData\ring ng ring sound.m4a');
%fs =fs/2;
%data = data(1:2:end);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
%Smax = max(abs(S),[],'all');
%S = S/Smax;
disp("%-------------------------------------------------------");
disp("% /"+Letter+"/ sound in ");
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
% formant ranges you detect, find the avg signal length
% step one find the time range of signal you detected;
T_index_start = find(T >= 4.42);
T_index_end   = find(T >= 5.17);
Stemp = S(:,T_index_start:T_index_end);
Smax = max(abs(Stemp),[],'all');
disp(Letter+"_max = "+Smax+";");
%Smax = 36;
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
% parameters
signal = 3;
% First Formant range ________ find avg density
%------------------------------------
if (signal>=1)
    start = 0;  % start of the formant
    ends  = 370;  % end of the formant
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F1  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F1_start = Freq(1);");
    disp(Letter + "_F1_end = Freq(end);");
    disp("["+Letter+"_F1_range, x] = size(S(" ...
        +Letter+"_F1_start:"+Letter+"_F1_end, :));");
    disp(Letter+"_D1= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=2)
    start = 730;  % start of the formant
    ends  = 1730;% end of the formant
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F2  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F2_start = Freq(1);");
    disp(Letter + "_F2_end = Freq(end);");
    disp("["+Letter+"_F2_range, x] = size(S(" ...
        +Letter+"_F2_start:"+Letter+"_F2_end, :));");
    disp(Letter+"_D2= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=3)
    start = 2050;% start of the formant
    ends  = 2500;% end of the formant
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F3  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F3_start = Freq(1);");
    disp(Letter + "_F3_end = Freq(end);");
    disp("["+Letter+"_F3_range, x] = size(S(" ...
        +Letter+"_F3_start:"+Letter+"_F3_end, :));");
    disp(Letter+"_D3= " + num2str(AvgDen)+";");;
end
%------------------------------------
if (signal>=4)
    start = 0;
    ends  = 780;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F4  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F4_start = Freq(1);");
    disp(Letter + "_F4_end = Freq(end);");
    disp("["+Letter+"_F4_range, x] = size(S(" ...
        +Letter+"_F4_start:"+Letter+"_F4_end, :));");
    disp(Letter+"_D4= " + num2str(AvgDen)+";");
end
%------------------------------------



%% -------------------------------------------------------------------
graph = 0;
Letter = "y";
[data, fs] = audioread('TrainingData\y you sound.m4a');
%fs =fs/2;
%data = data(1:2:end);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
%Smax = max(abs(S),[],'all');
%S = S/Smax;
disp("%-------------------------------------------------------");
disp("% /"+Letter+"/ sound in ");
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
% formant ranges you detect, find the avg signal length
% step one find the time range of signal you detected;
T_index_start = find(T >= .59);
T_index_end   = find(T >= 0.92);
Stemp = S(:,T_index_start:T_index_end);
Smax = max(abs(Stemp),[],'all');
disp(Letter+"_max = "+Smax+";");
%Smax = 36;
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
% parameters
signal = 3;
% First Formant range ________ find avg density
%------------------------------------
if (signal>=1)
    start = 0;
    ends  = 600;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F1  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F1_start = Freq(1);");
    disp(Letter + "_F1_end = Freq(end);");
    disp("["+Letter+"_F1_range, x] = size(S(" ...
        +Letter+"_F1_start:"+Letter+"_F1_end, :));");
    disp(Letter+"_D1= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=2)
    start = 1400;
    ends  = 2600;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F2  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F2_start = Freq(1);");
    disp(Letter + "_F2_end = Freq(end);");
    disp("["+Letter+"_F2_range, x] = size(S(" ...
        +Letter+"_F2_start:"+Letter+"_F2_end, :));");
    disp(Letter+"_D2= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=3)
    start = 2800;
    ends  = 3700;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F3  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F3_start = Freq(1);");
    disp(Letter + "_F3_end = Freq(end);");
    disp("["+Letter+"_F3_range, x] = size(S(" ...
        +Letter+"_F3_start:"+Letter+"_F3_end, :));");
    disp(Letter+"_D3= " + num2str(AvgDen)+";");;
end
%------------------------------------
if (signal>=4)
    start = 0;
    ends  = 780;
    Freq = find(F>=start & F<=ends);
    F_start = Freq(1); % density 
    F_end = Freq(end); % density 
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    disp("% F4  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F4_start = Freq(1);");
    disp(Letter + "_F4_end = Freq(end);");
    disp("["+Letter+"_F4_range, x] = size(S(" ...
        +Letter+"_F4_start:"+Letter+"_F4_end, :));");
    disp(Letter+"_D4= " + num2str(AvgDen)+";");
end
%------------------------------------

%-------------------
%--start of code----
%-------------------
%% -------------------------------------------------------------------
graph = 0; %turns on and off the graph
Letter = "ae"; %what letter to use as a 
              %variable in the actual code

[data, fs] = audioread('TrainingData\ae_cat.mp3');
%fs =fs/2;
%data = data(1:2:end);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
%Smax = max(abs(S),[],'all');
%S = S/Smax;

%-------------------------------------------------------
%--this is the start of the print text for actual code--
%-------------------------------------------------------
disp("%-------------------------------------------------------");
%using display we can print the string inside Letter
disp("% /"+Letter+"/ sound in ");
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
% formant ranges you detect, find the avg signal length
% step one find the time range of signal you detected;
%------------------------------------
%---find time snip of the phonemes---
%------------------------------------
T_index_start = find(T >= 2.528);
T_index_end   = find(T >= 2.667);
Stemp = S(:,T_index_start:T_index_end);
Smax = max(abs(Stemp),[],'all');
% Prints the MAX variable for the actual code
% EX: a_max = 12321; as an output
disp(Letter+"_max = "+Smax+";");
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
% parameters
%--------------------------------------
%--select how many formants you see----
%--max is 4 signals                ----
%--------------------------------------
signal = 3;
% First Formant range ________ find avg density
%------------------------------------
if (signal>=1)
    start = 755;  % start of the formant
    ends  = 881;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F1  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F1_start = Freq(1);");
    disp(Letter + "_F1_end = Freq(end);");
    disp("["+Letter+"_F1_range, x] = size(S(" ...
        +Letter+"_F1_start:"+Letter+"_F1_end, :));");
    disp(Letter+"_D1= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=2)
    start = 1464;% start of the formant
    ends  = 1576;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F2  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F2_start = Freq(1);");
    disp(Letter + "_F2_end = Freq(end);");
    disp("["+Letter+"_F2_range, x] = size(S(" ...
        +Letter+"_F2_start:"+Letter+"_F2_end, :));");
    disp(Letter+"_D2= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=3)
    start = 2200;% start of the formant
    ends  = 2700;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F3  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F3_start = Freq(1);");
    disp(Letter + "_F3_end = Freq(end);");
    disp("["+Letter+"_F3_range, x] = size(S(" ...
        +Letter+"_F3_start:"+Letter+"_F3_end, :));");
    disp(Letter+"_D3= " + num2str(AvgDen)+";");;
end
%------------------------------------
if (signal>=4)
    start = 0;  % start of the formant
    ends  = 780;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F4  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F4_start = Freq(1);");
    disp(Letter + "_F4_end = Freq(end);");
    disp("["+Letter+"_F4_range, x] = size(S(" ...
        +Letter+"_F4_start:"+Letter+"_F4_end, :));");
    disp(Letter+"_D4= " + num2str(AvgDen)+";");
end
%------------------------------------

%% -------------------------------------------------------------------
graph = 0; %turns on and off the graph
Letter = "eI"; %what letter to use as a 
              %variable in the actual code

[data, fs] = audioread('TrainingData\eI Day.mp3');
%fs =fs/2;
%data = data(1:2:end);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
%Smax = max(abs(S),[],'all');
%S = S/Smax;

%-------------------------------------------------------
%--this is the start of the print text for actual code--
%-------------------------------------------------------
disp("%-------------------------------------------------------");
%using display we can print the string inside Letter
disp("% /"+Letter+"/ sound in ");
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
% formant ranges you detect, find the avg signal length
% step one find the time range of signal you detected;
%------------------------------------
%---find time snip of the phonemes---
%------------------------------------
T_index_start = find(T >= 3.168);
T_index_end   = find(T >= 3.296);
Stemp = S(:,T_index_start:T_index_end);
Smax = max(abs(Stemp),[],'all');
% Prints the MAX variable for the actual code
% EX: a_max = 12321; as an output
disp(Letter+"_max = "+Smax+";");
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
% parameters
%--------------------------------------
%--select how many formants you see----
%--max is 4 signals                ----
%--------------------------------------
signal = 2;
% First Formant range ________ find avg density
%------------------------------------
if (signal>=1)
    start = 0;  % start of the formant
    ends  = 200;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F1  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F1_start = Freq(1);");
    disp(Letter + "_F1_end = Freq(end);");
    disp("["+Letter+"_F1_range, x] = size(S(" ...
        +Letter+"_F1_start:"+Letter+"_F1_end, :));");
    disp(Letter+"_D1= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=2)
    start = 435;% start of the formant
    ends  = 513;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F2  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F2_start = Freq(1);");
    disp(Letter + "_F2_end = Freq(end);");
    disp("["+Letter+"_F2_range, x] = size(S(" ...
        +Letter+"_F2_start:"+Letter+"_F2_end, :));");
    disp(Letter+"_D2= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=3)
    start = 2200;% start of the formant
    ends  = 2700;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F3  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F3_start = Freq(1);");
    disp(Letter + "_F3_end = Freq(end);");
    disp("["+Letter+"_F3_range, x] = size(S(" ...
        +Letter+"_F3_start:"+Letter+"_F3_end, :));");
    disp(Letter+"_D3= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=4)
    start = 0;  % start of the formant
    ends  = 780;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F4  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F4_start = Freq(1);");
    disp(Letter + "_F4_end = Freq(end);");
    disp("["+Letter+"_F4_range, x] = size(S(" ...
        +Letter+"_F4_start:"+Letter+"_F4_end, :));");
    disp(Letter+"_D4= " + num2str(AvgDen)+";");
end
%------------------------------------


%% -------------------------------------------------------------------
graph = 0; %turns on and off the graph
Letter = "e"; %what letter to use as a 
              %variable in the actual code

[data, fs] = audioread('TrainingData\e men.mp3');
%fs =fs/2;
%data = data(1:2:end);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
%Smax = max(abs(S),[],'all');
%S = S/Smax;

%-------------------------------------------------------
%--this is the start of the print text for actual code--
%-------------------------------------------------------
disp("%-------------------------------------------------------");
%using display we can print the string inside Letter
disp("% /"+Letter+"/ sound in ");
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
% formant ranges you detect, find the avg signal length
% step one find the time range of signal you detected;
%------------------------------------
%---find time snip of the phonemes---
%------------------------------------
T_index_start = find(T >= 2.926);
T_index_end   = find(T >= 3.056 );
Stemp = S(:,T_index_start:T_index_end);
Smax = max(abs(Stemp),[],'all');
% Prints the MAX variable for the actual code
% EX: a_max = 12321; as an output
disp(Letter+"_max = "+Smax+";");
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
% parameters
%--------------------------------------
%--select how many formants you see----
%--max is 4 signals                ----
%--------------------------------------
signal = 3;
% First Formant range ________ find avg density
%------------------------------------
if (signal>=1)
    start = 0;  % start of the formant
    ends  = 310;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F1  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F1_start = Freq(1);");
    disp(Letter + "_F1_end = Freq(end);");
    disp("["+Letter+"_F1_range, x] = size(S(" ...
        +Letter+"_F1_start:"+Letter+"_F1_end, :));");
    disp(Letter+"_D1= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=2)
    start = 445;% start of the formant
    ends  = 764;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F2  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F2_start = Freq(1);");
    disp(Letter + "_F2_end = Freq(end);");
    disp("["+Letter+"_F2_range, x] = size(S(" ...
        +Letter+"_F2_start:"+Letter+"_F2_end, :));");
    disp(Letter+"_D2= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=3)
    start = 1380;% start of the formant
    ends  = 1600;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F3  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F3_start = Freq(1);");
    disp(Letter + "_F3_end = Freq(end);");
    disp("["+Letter+"_F3_range, x] = size(S(" ...
        +Letter+"_F3_start:"+Letter+"_F3_end, :));");
    disp(Letter+"_D3= " + num2str(AvgDen)+";");;
end
%------------------------------------
if (signal>=4)
    start = 0;  % start of the formant
    ends  = 780;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F4  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F4_start = Freq(1);");
    disp(Letter + "_F4_end = Freq(end);");
    disp("["+Letter+"_F4_range, x] = size(S(" ...
        +Letter+"_F4_start:"+Letter+"_F4_end, :));");
    disp(Letter+"_D4= " + num2str(AvgDen)+";");
end
%------------------------------------


%% -------------------------------------------------------------------
graph = 0; %turns on and off the graph
Letter = "aI"; % what letter to use as a 
               % variable in the actual code
[data, fs] = audioread('TrainingData\aI_my.mp3');
%fs =fs/2;
%data = data(1:2:end);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
%Smax = max(abs(S),[],'all');
%S = S/Smax;

%-------------------------------------------------------
%--this is the start of the print text for actual code--
%-------------------------------------------------------
disp("%-------------------------------------------------------");
%using display we can print the string inside Letter
disp("% /"+Letter+"/ sound in ");
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
% formant ranges you detect, find the avg signal length
% step one find the time range of signal you detected;
%------------------------------------
%---find time snip of the phonemes---
%------------------------------------
T_index_start = find(T >= 2.598);
T_index_end   = find(T >= 2.846);
Stemp = S(:,T_index_start:T_index_end);
Smax = max(abs(Stemp),[],'all');
% Prints the MAX variable for the actual code
% EX: a_max = 12321; as an output
disp(Letter+"_max = "+Smax+";");
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
% parameters
%--------------------------------------
%--select how many formants you see----
%--max is 4 signals                ----
%--------------------------------------
signal = 3;
% First Formant range ________ find avg density
%------------------------------------
if (signal>=1)
    start = 0;  % start of the formant
    ends  = 340;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F1  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F1_start = Freq(1);");
    disp(Letter + "_F1_end = Freq(end);");
    disp("["+Letter+"_F1_range, x] = size(S(" ...
        +Letter+"_F1_start:"+Letter+"_F1_end, :));");
    disp(Letter+"_D1= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=2)
    start = 500;% start of the formant
    ends  = 800;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F2  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F2_start = Freq(1);");
    disp(Letter + "_F2_end = Freq(end);");
    disp("["+Letter+"_F2_range, x] = size(S(" ...
        +Letter+"_F2_start:"+Letter+"_F2_end, :));");
    disp(Letter+"_D2= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=3)
    start = 980;% start of the formant
    ends  = 1280;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F3  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F3_start = Freq(1);");
    disp(Letter + "_F3_end = Freq(end);");
    disp("["+Letter+"_F3_range, x] = size(S(" ...
        +Letter+"_F3_start:"+Letter+"_F3_end, :));");
    disp(Letter+"_D3= " + num2str(AvgDen)+";");;
end
%------------------------------------
if (signal>=4)
    start = 0;  % start of the formant
    ends  = 780;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F4  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F4_start = Freq(1);");
    disp(Letter + "_F4_end = Freq(end);");
    disp("["+Letter+"_F4_range, x] = size(S(" ...
        +Letter+"_F4_start:"+Letter+"_F4_end, :));");
    disp(Letter+"_D4= " + num2str(AvgDen)+";");
end
%------------------------------------


%% -------------------------------------------------------------------
graph = 0; %turns on and off the graph
Letter = "au"; % what letter to use as a 
               % variable in the actual code
[data, fs] = audioread('TrainingData\upsidedownA.mp3');
%fs =fs/2;
%data = data(1:2:end);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
%Smax = max(abs(S),[],'all');
%S = S/Smax;

%-------------------------------------------------------
%--this is the start of the print text for actual code--
%-------------------------------------------------------
disp("%-------------------------------------------------------");
%using display we can print the string inside Letter
disp("% /"+Letter+"/ sound in ");
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
% formant ranges you detect, find the avg signal length
% step one find the time range of signal you detected;
%------------------------------------
%---find time snip of the phonemes---
%------------------------------------
T_index_start = find(T >= 2.1);
T_index_end   = find(T >= 2.5);
Stemp = S(:,T_index_start:T_index_end);
Smax = max(abs(Stemp),[],'all');
% Prints the MAX variable for the actual code
% EX: a_max = 12321; as an output
disp(Letter+"_max = "+Smax+";");
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
% parameters
%--------------------------------------
%--select how many formants you see----
%--max is 4 signals                ----
%--------------------------------------
signal = 3;
% First Formant range ________ find avg density
%------------------------------------
if (signal>=1)
    start = 0;  % start of the formant
    ends  = 300;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F1  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F1_start = Freq(1);");
    disp(Letter + "_F1_end = Freq(end);");
    disp("["+Letter+"_F1_range, x] = size(S(" ...
        +Letter+"_F1_start:"+Letter+"_F1_end, :));");
    disp(Letter+"_D1= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=2)
    start = 420;% start of the formant
    ends  = 820;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F2  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F2_start = Freq(1);");
    disp(Letter + "_F2_end = Freq(end);");
    disp("["+Letter+"_F2_range, x] = size(S(" ...
        +Letter+"_F2_start:"+Letter+"_F2_end, :));");
    disp(Letter+"_D2= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=3)
    start = 1000;% start of the formant
    ends  = 1300;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F3  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F3_start = Freq(1);");
    disp(Letter + "_F3_end = Freq(end);");
    disp("["+Letter+"_F3_range, x] = size(S(" ...
        +Letter+"_F3_start:"+Letter+"_F3_end, :));");
    disp(Letter+"_D3= " + num2str(AvgDen)+";");;
end
%------------------------------------
if (signal>=4)
    start = 0;  % start of the formant
    ends  = 780;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F4  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F4_start = Freq(1);");
    disp(Letter + "_F4_end = Freq(end);");
    disp("["+Letter+"_F4_range, x] = size(S(" ...
        +Letter+"_F4_start:"+Letter+"_F4_end, :));");
    disp(Letter+"_D4= " + num2str(AvgDen)+";");
end
%------------------------------------


%% -------------------------------------------------------------------
graph = 0; %turns on and off the graph
Letter = "oa"; % what letter to use as a 
               % variable in the actual code
[data, fs] = audioread('TrainingData\EupsidedownImpedance_go.mp3');
%fs =fs/2;
%data = data(1:2:end);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
%Smax = max(abs(S),[],'all');
%S = S/Smax;

%-------------------------------------------------------
%--this is the start of the print text for actual code--
%-------------------------------------------------------
disp("%-------------------------------------------------------");
%using display we can print the string inside Letter
disp("% /"+Letter+"/ sound in ");
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
% formant ranges you detect, find the avg signal length
% step one find the time range of signal you detected;
%------------------------------------
%---find time snip of the phonemes---
%------------------------------------
T_index_start = find(T >= 2.261);
T_index_end   = find(T >= 2.4801);
Stemp = S(:,T_index_start:T_index_end);
Smax = max(abs(Stemp),[],'all');
% Prints the MAX variable for the actual code
% EX: a_max = 12321; as an output
disp(Letter+"_max = "+Smax+";");
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
% parameters
%--------------------------------------
%--select how many formants you see----
%--max is 4 signals                ----
%--------------------------------------
signal = 3;
% First Formant range ________ find avg density
%------------------------------------
if (signal>=1)
    start = 0;  % start of the formant
    ends  = 250;  % end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F1  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F1_start = Freq(1);");
    disp(Letter + "_F1_end = Freq(end);");
    disp("["+Letter+"_F1_range, x] = size(S(" ...
        +Letter+"_F1_start:"+Letter+"_F1_end, :));");
    disp(Letter+"_D1= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=2)
    start = 380;  % start of the formant
    ends  = 640;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F2  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F2_start = Freq(1);");
    disp(Letter + "_F2_end = Freq(end);");
    disp("["+Letter+"_F2_range, x] = size(S(" ...
        +Letter+"_F2_start:"+Letter+"_F2_end, :));");
    disp(Letter+"_D2= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=3)
    start = 820;% start of the formant
    ends  = 1150;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F3  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F3_start = Freq(1);");
    disp(Letter + "_F3_end = Freq(end);");
    disp("["+Letter+"_F3_range, x] = size(S(" ...
        +Letter+"_F3_start:"+Letter+"_F3_end, :));");
    disp(Letter+"_D3= " + num2str(AvgDen)+";");;
end
%------------------------------------
if (signal>=4)
    start = 0;  % start of the formant
    ends  = 780;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F4  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F4_start = Freq(1);");
    disp(Letter + "_F4_end = Freq(end);");
    disp("["+Letter+"_F4_range, x] = size(S(" ...
        +Letter+"_F4_start:"+Letter+"_F4_end, :));");
    disp(Letter+"_D4= " + num2str(AvgDen)+";");
end
%------------------------------------


%% -------------------------------------------------------------------
graph = 0; %turns on and off the graph
Letter = "oo"; % what letter to use as a 
               % variable in the actual code
[data, fs] = audioread('TrainingData\upsidedownImpedance Book.mp3');
%fs =fs/2;
%data = data(1:2:end);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
%Smax = max(abs(S),[],'all');
%S = S/Smax;

%-------------------------------------------------------
%--this is the start of the print text for actual code--
%-------------------------------------------------------
disp("%-------------------------------------------------------");
%using display we can print the string inside Letter
disp("% /"+Letter+"/ sound in ");
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
% formant ranges you detect, find the avg signal length
% step one find the time range of signal you detected;
%------------------------------------
%---find time snip of the phonemes---
%------------------------------------
T_index_start = find(T >= 1.08);
T_index_end   = find(T >= 1.25);
Stemp = S(:,T_index_start:T_index_end);
Smax = max(abs(Stemp),[],'all');
% Prints the MAX variable for the actual code
% EX: a_max = 12321; as an output
disp(Letter+"_max = "+Smax+";");
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
% parameters
%--------------------------------------
%--select how many formants you see----
%--max is 4 signals                ----
%--------------------------------------
signal = 2;
% First Formant range ________ find avg density
%------------------------------------
if (signal>=1)
    start = 0;  % start of the formant
    ends  = 500;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F1  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F1_start = Freq(1);");
    disp(Letter + "_F1_end = Freq(end);");
    disp("["+Letter+"_F1_range, x] = size(S(" ...
        +Letter+"_F1_start:"+Letter+"_F1_end, :));");
    disp(Letter+"_D1= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=2)
    start = 780;% start of the formant
    ends  = 1280;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F2  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F2_start = Freq(1);");
    disp(Letter + "_F2_end = Freq(end);");
    disp("["+Letter+"_F2_range, x] = size(S(" ...
        +Letter+"_F2_start:"+Letter+"_F2_end, :));");
    disp(Letter+"_D2= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=3)
    start = 1000;% start of the formant
    ends  = 1300;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F3  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F3_start = Freq(1);");
    disp(Letter + "_F3_end = Freq(end);");
    disp("["+Letter+"_F3_range, x] = size(S(" ...
        +Letter+"_F3_start:"+Letter+"_F3_end, :));");
    disp(Letter+"_D3= " + num2str(AvgDen)+";");;
end
%------------------------------------
if (signal>=4)
    start = 0;  % start of the formant
    ends  = 780;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F4  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F4_start = Freq(1);");
    disp(Letter + "_F4_end = Freq(end);");
    disp("["+Letter+"_F4_range, x] = size(S(" ...
        +Letter+"_F4_start:"+Letter+"_F4_end, :));");
    disp(Letter+"_D4= " + num2str(AvgDen)+";");
end
%------------------------------------


%% -------------------------------------------------------------------
graph = 0; %turns on and off the graph
Letter = "u"; % what letter to use as a 
               % variable in the actual code
[data, fs] = audioread('TrainingData\A_but.mp3');
%fs =fs/2;
%data = data(1:2:end);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
%Smax = max(abs(S),[],'all');
%S = S/Smax;

%-------------------------------------------------------
%--this is the start of the print text for actual code--
%-------------------------------------------------------
disp("%-------------------------------------------------------");
%using display we can print the string inside Letter
disp("% /"+Letter+"/ sound in ");
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
% formant ranges you detect, find the avg signal length
% step one find the time range of signal you detected;
%------------------------------------
%---find time snip of the phonemes---
%------------------------------------
T_index_start = find(T >= 2.605);
T_index_end   = find(T >= 2.743);
Stemp = S(:,T_index_start:T_index_end);
Smax = max(abs(Stemp),[],'all');
% Prints the MAX variable for the actual code
% EX: a_max = 12321; as an output
disp(Letter+"_max = "+Smax+";");
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
% parameters
%--------------------------------------
%--select how many formants you see----
%--max is 4 signals                ----
%--------------------------------------
signal = 1;
% First Formant range ________ find avg density
%------------------------------------
if (signal>=1)
    start = 480;  % start of the formant
    ends  = 619;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F1  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F1_start = Freq(1);");
    disp(Letter + "_F1_end = Freq(end);");
    disp("["+Letter+"_F1_range, x] = size(S(" ...
        +Letter+"_F1_start:"+Letter+"_F1_end, :));");
    disp(Letter+"_D1= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=2)
    start = 780;% start of the formant
    ends  = 1280;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F2  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F2_start = Freq(1);");
    disp(Letter + "_F2_end = Freq(end);");
    disp("["+Letter+"_F2_range, x] = size(S(" ...
        +Letter+"_F2_start:"+Letter+"_F2_end, :));");
    disp(Letter+"_D2= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=3)
    start = 1000;% start of the formant
    ends  = 1300;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F3  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F3_start = Freq(1);");
    disp(Letter + "_F3_end = Freq(end);");
    disp("["+Letter+"_F3_range, x] = size(S(" ...
        +Letter+"_F3_start:"+Letter+"_F3_end, :));");
    disp(Letter+"_D3= " + num2str(AvgDen)+";");;
end
%------------------------------------
if (signal>=4)
    start = 0;  % start of the formant
    ends  = 780;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F4  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F4_start = Freq(1);");
    disp(Letter + "_F4_end = Freq(end);");
    disp("["+Letter+"_F4_range, x] = size(S(" ...
        +Letter+"_F4_start:"+Letter+"_F4_end, :));");
    disp(Letter+"_D4= " + num2str(AvgDen)+";");
end
%------------------------------------


%% -------------------------------------------------------------------
graph = 0; %turns on and off the graph
Letter = "ue"; % what letter to use as a 
               % variable in the actual code
[data, fs] = audioread('TrainingData\uColon too.mp3');
%fs =fs/2;
%data = data(1:2:end);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
%Smax = max(abs(S),[],'all');
%S = S/Smax;

%-------------------------------------------------------
%--this is the start of the print text for actual code--
%-------------------------------------------------------
disp("%-------------------------------------------------------");
%using display we can print the string inside Letter
disp("% /"+Letter+"/ sound in ");
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
% formant ranges you detect, find the avg signal length
% step one find the time range of signal you detected;
%------------------------------------
%---find time snip of the phonemes---
%------------------------------------
T_index_start = find(T >= 1.3397);
T_index_end   = find(T >= 1.767);
Stemp = S(:,T_index_start:T_index_end);
Smax = max(abs(Stemp),[],'all');
% Prints the MAX variable for the actual code
% EX: a_max = 12321; as an output
disp(Letter+"_max = "+Smax+";");
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
% parameters
%--------------------------------------
%--select how many formants you see----
%--max is 4 signals                ----
%--------------------------------------
signal = 2;
% First Formant range ________ find avg density
%------------------------------------
if (signal>=1)
    start = 0;  % start of the formant
    ends  = 520;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F1  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F1_start = Freq(1);");
    disp(Letter + "_F1_end = Freq(end);");
    disp("["+Letter+"_F1_range, x] = size(S(" ...
        +Letter+"_F1_start:"+Letter+"_F1_end, :));");
    disp(Letter+"_D1= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=2)
    start = 840;% start of the formant
    ends  = 1220;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F2  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F2_start = Freq(1);");
    disp(Letter + "_F2_end = Freq(end);");
    disp("["+Letter+"_F2_range, x] = size(S(" ...
        +Letter+"_F2_start:"+Letter+"_F2_end, :));");
    disp(Letter+"_D2= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=3)
    start = 1000;% start of the formant
    ends  = 1300;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F3  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F3_start = Freq(1);");
    disp(Letter + "_F3_end = Freq(end);");
    disp("["+Letter+"_F3_range, x] = size(S(" ...
        +Letter+"_F3_start:"+Letter+"_F3_end, :));");
    disp(Letter+"_D3= " + num2str(AvgDen)+";");;
end
%------------------------------------
if (signal>=4)
    start = 0;  % start of the formant
    ends  = 780;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F4  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F4_start = Freq(1);");
    disp(Letter + "_F4_end = Freq(end);");
    disp("["+Letter+"_F4_range, x] = size(S(" ...
        +Letter+"_F4_start:"+Letter+"_F4_end, :));");
    disp(Letter+"_D4= " + num2str(AvgDen)+";");
end
%------------------------------------


%% -------------------------------------------------------------------
graph = 0; %turns on and off the graph
Letter = "oi"; % what letter to use as a 
               % variable in the actual code
[data, fs] = audioread('TrainingData\backwardsCI_boy.mp3');
%fs =fs/2;
%data = data(1:2:end);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
%Smax = max(abs(S),[],'all');
%S = S/Smax;

%-------------------------------------------------------
%--this is the start of the print text for actual code--
%-------------------------------------------------------
disp("%-------------------------------------------------------");
%using display we can print the string inside Letter
disp("% /"+Letter+"/ sound in ");
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
% formant ranges you detect, find the avg signal length
% step one find the time range of signal you detected;
%------------------------------------
%---find time snip of the phonemes---
%------------------------------------
T_index_start = find(T >= 2.692);
T_index_end   = find(T >= 3.012);
Stemp = S(:,T_index_start:T_index_end);
Smax = max(abs(Stemp),[],'all');
% Prints the MAX variable for the actual code
% EX: a_max = 12321; as an output
disp(Letter+"_max = "+Smax+";");
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
% parameters
%--------------------------------------
%--select how many formants you see----
%--max is 4 signals                ----
%--------------------------------------
signal = 1;
% First Formant range ________ find avg density
%------------------------------------
if (signal>=1)
    start = 190;  % start of the formant
    ends  = 800;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F1  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F1_start = Freq(1);");
    disp(Letter + "_F1_end = Freq(end);");
    disp("["+Letter+"_F1_range, x] = size(S(" ...
        +Letter+"_F1_start:"+Letter+"_F1_end, :));");
    disp(Letter+"_D1= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=2)
    start = 840;% start of the formant
    ends  = 1220;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F2  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F2_start = Freq(1);");
    disp(Letter + "_F2_end = Freq(end);");
    disp("["+Letter+"_F2_range, x] = size(S(" ...
        +Letter+"_F2_start:"+Letter+"_F2_end, :));");
    disp(Letter+"_D2= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=3)
    start = 1000;% start of the formant
    ends  = 1300;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F3  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F3_start = Freq(1);");
    disp(Letter + "_F3_end = Freq(end);");
    disp("["+Letter+"_F3_range, x] = size(S(" ...
        +Letter+"_F3_start:"+Letter+"_F3_end, :));");
    disp(Letter+"_D3= " + num2str(AvgDen)+";");;
end
%------------------------------------
if (signal>=4)
    start = 0;  % start of the formant
    ends  = 780;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F4  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F4_start = Freq(1);");
    disp(Letter + "_F4_end = Freq(end);");
    disp("["+Letter+"_F4_range, x] = size(S(" ...
        +Letter+"_F4_start:"+Letter+"_F4_end, :));");
    disp(Letter+"_D4= " + num2str(AvgDen)+";");
end
%------------------------------------


%% -------------------------------------------------------------------
graph = 0; %turns on and off the graph
Letter = "ow"; % what letter to use as a 
               % variable in the actual code
[data, fs] = audioread('TrainingData\aUpdidedownImpedsnce_how.mp3');
%fs =fs/2;
%data = data(1:2:end);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
%Smax = max(abs(S),[],'all');
%S = S/Smax;

%-------------------------------------------------------
%--this is the start of the print text for actual code--
%-------------------------------------------------------
disp("%-------------------------------------------------------");
%using display we can print the string inside Letter
disp("% /"+Letter+"/ sound in ");
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
% formant ranges you detect, find the avg signal length
% step one find the time range of signal you detected;
%------------------------------------
%---find time snip of the phonemes---
%------------------------------------
T_index_start = find(T >= 2.502);
T_index_end   = find(T >= 2.876);
Stemp = S(:,T_index_start:T_index_end);
Smax = max(abs(Stemp),[],'all');
% Prints the MAX variable for the actual code
% EX: a_max = 12321; as an output
disp(Letter+"_max = "+Smax+";");
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
% parameters
%--------------------------------------
%--select how many formants you see----
%--max is 4 signals                ----
%--------------------------------------
signal = 3;
% First Formant range ________ find avg density
%------------------------------------
if (signal>=1)
    start = 80;  % start of the formant
    ends  = 330;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F1  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F1_start = Freq(1);");
    disp(Letter + "_F1_end = Freq(end);");
    disp("["+Letter+"_F1_range, x] = size(S(" ...
        +Letter+"_F1_start:"+Letter+"_F1_end, :));");
    disp(Letter+"_D1= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=2)
    start = 470;% start of the formant
    ends  = 820;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F2  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F2_start = Freq(1);");
    disp(Letter + "_F2_end = Freq(end);");
    disp("["+Letter+"_F2_range, x] = size(S(" ...
        +Letter+"_F2_start:"+Letter+"_F2_end, :));");
    disp(Letter+"_D2= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=3)
    start = 1100;% start of the formant
    ends  = 1650;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F3  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F3_start = Freq(1);");
    disp(Letter + "_F3_end = Freq(end);");
    disp("["+Letter+"_F3_range, x] = size(S(" ...
        +Letter+"_F3_start:"+Letter+"_F3_end, :));");
    disp(Letter+"_D3= " + num2str(AvgDen)+";");;
end
%------------------------------------
if (signal>=4)
    start = 0;  % start of the formant
    ends  = 780;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F4  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F4_start = Freq(1);");
    disp(Letter + "_F4_end = Freq(end);");
    disp("["+Letter+"_F4_range, x] = size(S(" ...
        +Letter+"_F4_start:"+Letter+"_F4_end, :));");
    disp(Letter+"_D4= " + num2str(AvgDen)+";");
end
%------------------------------------


%% -------------------------------------------------------------------
graph = 0; %turns on and off the graph
Letter = "er"; % what letter to use as a 
               % variable in the actual code
[data, fs] = audioread('TrainingData\upsideDown_e_America.mp3');
%fs =fs/2;
%data = data(1:2:end);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
%Smax = max(abs(S),[],'all');
%S = S/Smax;

%-------------------------------------------------------
%--this is the start of the print text for actual code--
%-------------------------------------------------------
disp("%-------------------------------------------------------");
%using display we can print the string inside Letter
disp("% /"+Letter+"/ sound in ");
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
% formant ranges you detect, find the avg signal length
% step one find the time range of signal you detected;
%------------------------------------
%---find time snip of the phonemes---
%------------------------------------
T_index_start = find(T >= 3.105);
T_index_end   = find(T >= 3.2165);
Stemp = S(:,T_index_start:T_index_end);
Smax = max(abs(Stemp),[],'all');
% Prints the MAX variable for the actual code
% EX: a_max = 12321; as an output
disp(Letter+"_max = "+Smax+";");
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
% parameters
%--------------------------------------
%--select how many formants you see----
%--max is 4 signals                ----
%--------------------------------------
signal = 3;
% First Formant range ________ find avg density
%------------------------------------
if (signal>=1)
    start = 0;  % start of the formant
    ends  = 240;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F1  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F1_start = Freq(1);");
    disp(Letter + "_F1_end = Freq(end);");
    disp("["+Letter+"_F1_range, x] = size(S(" ...
        +Letter+"_F1_start:"+Letter+"_F1_end, :));");
    disp(Letter+"_D1= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=2)
    start = 330;  % start of the formant
    ends  = 700;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F2  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F2_start = Freq(1);");
    disp(Letter + "_F2_end = Freq(end);");
    disp("["+Letter+"_F2_range, x] = size(S(" ...
        +Letter+"_F2_start:"+Letter+"_F2_end, :));");
    disp(Letter+"_D2= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=3)
    start = 1000;% start of the formant
    ends  = 1460;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F3  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F3_start = Freq(1);");
    disp(Letter + "_F3_end = Freq(end);");
    disp("["+Letter+"_F3_range, x] = size(S(" ...
        +Letter+"_F3_start:"+Letter+"_F3_end, :));");
    disp(Letter+"_D3= " + num2str(AvgDen)+";");;
end
%------------------------------------
if (signal>=4)
    start = 0;  % start of the formant
    ends  = 780;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F4  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F4_start = Freq(1);");
    disp(Letter + "_F4_end = Freq(end);");
    disp("["+Letter+"_F4_range, x] = size(S(" ...
        +Letter+"_F4_start:"+Letter+"_F4_end, :));");
    disp(Letter+"_D4= " + num2str(AvgDen)+";");
end
%------------------------------------


%% -------------------------------------------------------------------
graph = 0; %turns on and off the graph
Letter = "air"; % what letter to use as a 
               % variable in the actual code
[data, fs] = audioread('TrainingData\eUpsidedownE_wear.mp3');
%fs =fs/2;
%data = data(1:2:end);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
%Smax = max(abs(S),[],'all');
%S = S/Smax;

%-------------------------------------------------------
%--this is the start of the print text for actual code--
%-------------------------------------------------------
disp("%-------------------------------------------------------");
%using display we can print the string inside Letter
disp("% /"+Letter+"/ sound in ");
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
% formant ranges you detect, find the avg signal length
% step one find the time range of signal you detected;
%------------------------------------
%---find time snip of the phonemes---
%------------------------------------
T_index_start = find(T >= 2.439);
T_index_end   = find(T >= 2.581);
Stemp = S(:,T_index_start:T_index_end);
Smax = max(abs(Stemp),[],'all');
% Prints the MAX variable for the actual code
% EX: a_max = 12321; as an output
disp(Letter+"_max = "+Smax+";");
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
% parameters
%--------------------------------------
%--select how many formants you see----
%--max is 4 signals                ----
%--------------------------------------
signal = 3;
% First Formant range ________ find avg density
%------------------------------------
if (signal>=1)
    start = 0;  % start of the formant
    ends  = 220;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F1  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F1_start = Freq(1);");
    disp(Letter + "_F1_end = Freq(end);");
    disp("["+Letter+"_F1_range, x] = size(S(" ...
        +Letter+"_F1_start:"+Letter+"_F1_end, :));");
    disp(Letter+"_D1= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=2)
    start = 390;  % start of the formant
    ends  = 750;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F2  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F2_start = Freq(1);");
    disp(Letter + "_F2_end = Freq(end);");
    disp("["+Letter+"_F2_range, x] = size(S(" ...
        +Letter+"_F2_start:"+Letter+"_F2_end, :));");
    disp(Letter+"_D2= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=3)
    start = 1500;% start of the formant
    ends  = 1800;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F3  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F3_start = Freq(1);");
    disp(Letter + "_F3_end = Freq(end);");
    disp("["+Letter+"_F3_range, x] = size(S(" ...
        +Letter+"_F3_start:"+Letter+"_F3_end, :));");
    disp(Letter+"_D3= " + num2str(AvgDen)+";");;
end
%------------------------------------
if (signal>=4)
    start = 0;  % start of the formant
    ends  = 780;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F4  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F4_start = Freq(1);");
    disp(Letter + "_F4_end = Freq(end);");
    disp("["+Letter+"_F4_range, x] = size(S(" ...
        +Letter+"_F4_start:"+Letter+"_F4_end, :));");
    disp(Letter+"_D4= " + num2str(AvgDen)+";");
end
%------------------------------------


%% -------------------------------------------------------------------
graph = 0; %turns on and off the graph
Letter = "ar"; % what letter to use as a 
               % variable in the actual code
[data, fs] = audioread('TrainingData\a_part.mp3');
%fs =fs/2;
%data = data(1:2:end);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
%Smax = max(abs(S),[],'all');
%S = S/Smax;

%-------------------------------------------------------
%--this is the start of the print text for actual code--
%-------------------------------------------------------
disp("%-------------------------------------------------------");
%using display we can print the string inside Letter
disp("% /"+Letter+"/ sound in ");
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
% formant ranges you detect, find the avg signal length
% step one find the time range of signal you detected;
%------------------------------------
%---find time snip of the phonemes---
%------------------------------------
T_index_start = find(T >= 2.974);
T_index_end   = find(T >= 3.065);
Stemp = S(:,T_index_start:T_index_end);
Smax = max(abs(Stemp),[],'all');
% Prints the MAX variable for the actual code
% EX: a_max = 12321; as an output
disp(Letter+"_max = "+Smax+";");
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
% parameters
%--------------------------------------
%--select how many formants you see----
%--max is 4 signals                ----
%--------------------------------------
signal = 3;
% First Formant range ________ find avg density
%------------------------------------
if (signal>=1)
    start = 0;  % start of the formant
    ends  = 220;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F1  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F1_start = Freq(1);");
    disp(Letter + "_F1_end = Freq(end);");
    disp("["+Letter+"_F1_range, x] = size(S(" ...
        +Letter+"_F1_start:"+Letter+"_F1_end, :));");
    disp(Letter+"_D1= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=2)
    start = 320;  % start of the formant
    ends  = 700;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F2  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F2_start = Freq(1);");
    disp(Letter + "_F2_end = Freq(end);");
    disp("["+Letter+"_F2_range, x] = size(S(" ...
        +Letter+"_F2_start:"+Letter+"_F2_end, :));");
    disp(Letter+"_D2= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=3)
    start = 980;% start of the formant
    ends  = 1320;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F3  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F3_start = Freq(1);");
    disp(Letter + "_F3_end = Freq(end);");
    disp("["+Letter+"_F3_range, x] = size(S(" ...
        +Letter+"_F3_start:"+Letter+"_F3_end, :));");
    disp(Letter+"_D3= " + num2str(AvgDen)+";");;
end
%------------------------------------
if (signal>=4)
    start = 0;  % start of the formant
    ends  = 780;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F4  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F4_start = Freq(1);");
    disp(Letter + "_F4_end = Freq(end);");
    disp("["+Letter+"_F4_range, x] = size(S(" ...
        +Letter+"_F4_start:"+Letter+"_F4_end, :));");
    disp(Letter+"_D4= " + num2str(AvgDen)+";");
end
%------------------------------------


%% -------------------------------------------------------------------
graph = 0; %turns on and off the graph
Letter = "ir"; % what letter to use as a 
               % variable in the actual code
[data, fs] = audioread('TrainingData\EpsilonColon_word.mp3');
%fs =fs/2;
%data = data(1:2:end);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
%Smax = max(abs(S),[],'all');
%S = S/Smax;

%-------------------------------------------------------
%--this is the start of the print text for actual code--
%-------------------------------------------------------
disp("%-------------------------------------------------------");
%using display we can print the string inside Letter
disp("% /"+Letter+"/ sound in ");
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
% formant ranges you detect, find the avg signal length
% step one find the time range of signal you detected;
%------------------------------------
%---find time snip of the phonemes---
%------------------------------------
T_index_start = find(T >= 2.304);
T_index_end   = find(T >= 2.588);
Stemp = S(:,T_index_start:T_index_end);
Smax = max(abs(Stemp),[],'all');
% Prints the MAX variable for the actual code
% EX: a_max = 12321; as an output
disp(Letter+"_max = "+Smax+";");
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
% parameters
%--------------------------------------
%--select how many formants you see----
%--max is 4 signals                ----
%--------------------------------------
signal = 2;
% First Formant range ________ find avg density
%------------------------------------
if (signal>=1)
    start = 250;  % start of the formant
    ends  = 740;  % end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F1  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F1_start = Freq(1);");
    disp(Letter + "_F1_end = Freq(end);");
    disp("["+Letter+"_F1_range, x] = size(S(" ...
        +Letter+"_F1_start:"+Letter+"_F1_end, :));");
    disp(Letter+"_D1= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=2)
    start = 1000;  % start of the formant
    ends  = 1400;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F2  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F2_start = Freq(1);");
    disp(Letter + "_F2_end = Freq(end);");
    disp("["+Letter+"_F2_range, x] = size(S(" ...
        +Letter+"_F2_start:"+Letter+"_F2_end, :));");
    disp(Letter+"_D2= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=3)
    start = 980;% start of the formant
    ends  = 1320;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F3  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F3_start = Freq(1);");
    disp(Letter + "_F3_end = Freq(end);");
    disp("["+Letter+"_F3_range, x] = size(S(" ...
        +Letter+"_F3_start:"+Letter+"_F3_end, :));");
    disp(Letter+"_D3= " + num2str(AvgDen)+";");;
end
%------------------------------------
if (signal>=4)
    start = 0;  % start of the formant
    ends  = 780;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F4  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F4_start = Freq(1);");
    disp(Letter + "_F4_end = Freq(end);");
    disp("["+Letter+"_F4_range, x] = size(S(" ...
        +Letter+"_F4_start:"+Letter+"_F4_end, :));");
    disp(Letter+"_D4= " + num2str(AvgDen)+";");
end
%------------------------------------


%% -------------------------------------------------------------------
graph = 0; %turns on and off the graph
Letter = "or"; % what letter to use as a 
               % variable in the actual code
[data, fs] = audioread('TrainingData\backwardsC_sort.mp3');
%fs =fs/2;
%data = data(1:2:end);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
%Smax = max(abs(S),[],'all');
%S = S/Smax;

%-------------------------------------------------------
%--this is the start of the print text for actual code--
%-------------------------------------------------------
disp("%-------------------------------------------------------");
%using display we can print the string inside Letter
disp("% /"+Letter+"/ sound in ");
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
% formant ranges you detect, find the avg signal length
% step one find the time range of signal you detected;
%------------------------------------
%---find time snip of the phonemes---
%------------------------------------
T_index_start = find(T >= 3.2655);
T_index_end   = find(T >= 3.36605);
Stemp = S(:,T_index_start:T_index_end);
Smax = max(abs(Stemp),[],'all');
% Prints the MAX variable for the actual code
% EX: a_max = 12321; as an output
disp(Letter+"_max = "+Smax+";");
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
% parameters
%--------------------------------------
%--select how many formants you see----
%--max is 4 signals                ----
%--------------------------------------
signal = 2;
% First Formant range ________ find avg density
%------------------------------------
if (signal>=1)
    start = 260;  % start of the formant
    ends  = 640;  % end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F1  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F1_start = Freq(1);");
    disp(Letter + "_F1_end = Freq(end);");
    disp("["+Letter+"_F1_range, x] = size(S(" ...
        +Letter+"_F1_start:"+Letter+"_F1_end, :));");
    disp(Letter+"_D1= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=2)
    start = 840;  % start of the formant
    ends  = 1100;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F2  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F2_start = Freq(1);");
    disp(Letter + "_F2_end = Freq(end);");
    disp("["+Letter+"_F2_range, x] = size(S(" ...
        +Letter+"_F2_start:"+Letter+"_F2_end, :));");
    disp(Letter+"_D2= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=3)
    start = 980;% start of the formant
    ends  = 1320;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F3  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F3_start = Freq(1);");
    disp(Letter + "_F3_end = Freq(end);");
    disp("["+Letter+"_F3_range, x] = size(S(" ...
        +Letter+"_F3_start:"+Letter+"_F3_end, :));");
    disp(Letter+"_D3= " + num2str(AvgDen)+";");;
end
%------------------------------------
if (signal>=4)
    start = 0;  % start of the formant
    ends  = 780;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F4  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F4_start = Freq(1);");
    disp(Letter + "_F4_end = Freq(end);");
    disp("["+Letter+"_F4_range, x] = size(S(" ...
        +Letter+"_F4_start:"+Letter+"_F4_end, :));");
    disp(Letter+"_D4= " + num2str(AvgDen)+";");
end
%------------------------------------


%% -------------------------------------------------------------------
graph = 0; %turns on and off the graph
Letter = "ere"; % what letter to use as a 
               % variable in the actual code
[data, fs] = audioread('TrainingData\IipsidedownE Here.mp3');
%fs =fs/2;
%data = data(1:2:end);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
%Smax = max(abs(S),[],'all');
%S = S/Smax;

%-------------------------------------------------------
%--this is the start of the print text for actual code--
%-------------------------------------------------------
disp("%-------------------------------------------------------");
%using display we can print the string inside Letter
disp("% /"+Letter+"/ sound in ");
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
% formant ranges you detect, find the avg signal length
% step one find the time range of signal you detected;
%------------------------------------
%---find time snip of the phonemes---
%------------------------------------
T_index_start = find(T >= 1.648);
T_index_end   = find(T >= 1.995);
Stemp = S(:,T_index_start:T_index_end);
Smax = max(abs(Stemp),[],'all');
% Prints the MAX variable for the actual code
% EX: a_max = 12321; as an output
disp(Letter+"_max = "+Smax+";");
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
% parameters
%--------------------------------------
%--select how many formants you see----
%--max is 4 signals                ----
%--------------------------------------
signal = 3;
% First Formant range ________ find avg density
%------------------------------------
if (signal>=1)
    start = 0;  % start of the formant
    ends  = 450;  % end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F1  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F1_start = Freq(1);");
    disp(Letter + "_F1_end = Freq(end);");
    disp("["+Letter+"_F1_range, x] = size(S(" ...
        +Letter+"_F1_start:"+Letter+"_F1_end, :));");
    disp(Letter+"_D1= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=2)
    start = 1930;  % start of the formant
    ends  = 2630;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F2  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F2_start = Freq(1);");
    disp(Letter + "_F2_end = Freq(end);");
    disp("["+Letter+"_F2_range, x] = size(S(" ...
        +Letter+"_F2_start:"+Letter+"_F2_end, :));");
    disp(Letter+"_D2= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=3)
    start = 3330;% start of the formant
    ends  = 3770;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F3  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F3_start = Freq(1);");
    disp(Letter + "_F3_end = Freq(end);");
    disp("["+Letter+"_F3_range, x] = size(S(" ...
        +Letter+"_F3_start:"+Letter+"_F3_end, :));");
    disp(Letter+"_D3= " + num2str(AvgDen)+";");;
end
%------------------------------------
if (signal>=4)
    start = 0;  % start of the formant
    ends  = 780;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F4  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F4_start = Freq(1);");
    disp(Letter + "_F4_end = Freq(end);");
    disp("["+Letter+"_F4_range, x] = size(S(" ...
        +Letter+"_F4_start:"+Letter+"_F4_end, :));");
    disp(Letter+"_D4= " + num2str(AvgDen)+";");
end
%------------------------------------



%% -------------------------------------------------------------------
graph = 0; %turns on and off the graph
Letter = "our"; % what letter to use as a 
               % variable in the actual code
[data, fs] = audioread('TrainingData\upsidedownImpedanceE_tour.mp3');
%fs =fs/2;
%data = data(1:2:end);
[S, F, T] = spectrogram(data, win, Noverlap, nfft, fs);
%Smax = max(abs(S),[],'all');
%S = S/Smax;

%-------------------------------------------------------
%--this is the start of the print text for actual code--
%-------------------------------------------------------
disp("%-------------------------------------------------------");
%using display we can print the string inside Letter
disp("% /"+Letter+"/ sound in ");
if (graph == 1)
    figure;
    imagesc(T ,F ,abs(S));
    title(Letter + " signal");
end
% formant ranges you detect, find the avg signal length
% step one find the time range of signal you detected;
%------------------------------------
%---find time snip of the phonemes---
%------------------------------------
T_index_start = find(T >= 2.6026);
T_index_end   = find(T >= 2.7193);
Stemp = S(:,T_index_start:T_index_end);
Smax = max(abs(Stemp),[],'all');
% Prints the MAX variable for the actual code
% EX: a_max = 12321; as an output
disp(Letter+"_max = "+Smax+";");
Stemp = Stemp/Smax;
if (graph == 1)
    figure; 
    imagesc(T(T_index_start:T_index_end) ,F ,abs(Stemp));
    title("zoomed in to letter "+Letter);
end
% parameters
%--------------------------------------
%--select how many formants you see----
%--max is 4 signals                ----
%--------------------------------------
signal = 2;
% First Formant range ________ find avg density
%------------------------------------
if (signal>=1)
    start = 120;  % start of the formant
    ends  = 550;  % end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F1  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F1_start = Freq(1);");
    disp(Letter + "_F1_end = Freq(end);");
    disp("["+Letter+"_F1_range, x] = size(S(" ...
        +Letter+"_F1_start:"+Letter+"_F1_end, :));");
    disp(Letter+"_D1= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=2)
    start = 676;  % start of the formant
    ends  = 1000;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F2  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F2_start = Freq(1);");
    disp(Letter + "_F2_end = Freq(end);");
    disp("["+Letter+"_F2_range, x] = size(S(" ...
        +Letter+"_F2_start:"+Letter+"_F2_end, :));");
    disp(Letter+"_D2= " + num2str(AvgDen)+";");
end
%------------------------------------
if (signal>=3)
    start = 3330;% start of the formant
    ends  = 3770;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F3  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F3_start = Freq(1);");
    disp(Letter + "_F3_end = Freq(end);");
    disp("["+Letter+"_F3_range, x] = size(S(" ...
        +Letter+"_F3_start:"+Letter+"_F3_end, :));");
    disp(Letter+"_D3= " + num2str(AvgDen)+";");;
end
%------------------------------------
if (signal>=4)
    start = 0;  % start of the formant
    ends  = 780;% end of the formant
    Freq = find(F>=start & F<=ends); %find the freq range
    F_start = Freq(1); %start freq index
    F_end = Freq(end); %end   freq index
    temp = abs(Stemp(F_start:F_end,:));
    [row,col] = size(temp);
    temp = sum(temp,2);
    AvgDen = (sum(temp))/(row*col);
    %printing all the variables and comments for main code
    disp("% F4  "+start+" "+ends+" Density "+AvgDen);
    disp("Freq = find(F>=" +start+ " & F<=" +ends+ ");");
    disp(Letter + "_F4_start = Freq(1);");
    disp(Letter + "_F4_end = Freq(end);");
    disp("["+Letter+"_F4_range, x] = size(S(" ...
        +Letter+"_F4_start:"+Letter+"_F4_end, :));");
    disp(Letter+"_D4= " + num2str(AvgDen)+";");
end
%------------------------------------











