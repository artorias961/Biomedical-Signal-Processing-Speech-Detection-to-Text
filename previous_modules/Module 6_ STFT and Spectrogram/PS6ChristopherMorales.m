% Christopher Morales
% 4/7/2022 EE 4820

%% Problem 1

% Import file
load time_freq1.mat;

% Checking what is inside the file
whos

% Resolution
Nfft = 2^9;

% Creating the length 
L = length(x);

% Creating how many windows we will have
Lwin15 = round(L/15);
Lwin25 = round(L/25);
Lwin35 = round(L/35);
Lwin45 = round(L/45);
Lwin55 = round(L/55);
Lwin65 = round(L/65);

% Creating the type of window
win15 = window(@gausswin, Lwin15);
win25 = window(@gausswin, Lwin25);
win35 = window(@gausswin, Lwin35);
win45 = window(@gausswin, Lwin45);
win55 = window(@gausswin, Lwin55);
win65 = window(@gausswin, Lwin65);


% Creating the overlap for the window
Noverlap15 = round(Lwin15 * 0.10);
Noverlap25 = round(Lwin25 * 0.10);
Noverlap35 = round(Lwin35 * 0.10);
Noverlap45 = round(Lwin45 * 0.10);
Noverlap55 = round(Lwin55 * 0.10);
Noverlap65 = round(Lwin65 * 0.10);

% Applying the Short Time Fourier Transform
[y15, f15, t15] = stft(x, fs,'Window', win15, 'OverlapLength',Noverlap15, 'FFTlength', Nfft );
[y25, f25, t25] = stft(x, fs,'Window', win25, 'OverlapLength',Noverlap25, 'FFTlength', Nfft );
[y35, f35, t35] = stft(x, fs,'Window', win35, 'OverlapLength',Noverlap35, 'FFTlength', Nfft );
[y45, f45, t45] = stft(x, fs,'Window', win45, 'OverlapLength',Noverlap45, 'FFTlength', Nfft );
[y55, f55, t55] = stft(x, fs,'Window', win55, 'OverlapLength',Noverlap55, 'FFTlength', Nfft );
[y65, f65, t65] = stft(x, fs,'Window', win65, 'OverlapLength',Noverlap65, 'FFTlength', Nfft );


% Creating a figure
figure(1)

% Frequency Color Map, 15 Gausswin Windows 
subplot(6,1,1);
imagesc(t15,f15,abs(y15));
colorbar;
xlabel('Time');
ylabel('Frequency');
title('Frequency Color Map, 15 Gausswin Windows');

% Frequency Color Map, 25 Gausswin Windows
subplot(6,1,2);
imagesc(t25,f25,abs(y25));
colorbar;
xlabel('Time');
ylabel('Frequency');
title('Frequency Color Map, 25 Gausswin Windows');

% Frequency Color Map, 35 Gausswin Windows
subplot(6,1,3);
imagesc(t35,f35,abs(y35));
colorbar;
xlabel('Time');
ylabel('Frequency');
title('Frequency Color Map, 35 Gausswin Windows');

% Frequency Color Map, 45 Gausswin Windows
subplot(6,1,4);
imagesc(t45,f45,abs(y45));
colorbar;
xlabel('Time');
ylabel('Frequency');
title('Frequency Color Map, 45 Gausswin Windows');

% Frequency Color Map, 55 Gausswin Windows
subplot(6,1,5);
imagesc(t55,f55,abs(y55));
colorbar;
xlabel('Time');
ylabel('Frequency');
title('Frequency Color Map, 55 Gausswin Windows');

% Frequency Color Map, 65 Gausswin Windows
subplot(6,1,6);
imagesc(t65,f65,abs(y65));
colorbar;
xlabel('Time');
ylabel('Frequency');
title('Frequency Color Map, 65 Gausswin Windows');

%% Problem 2

% Load file
load time_freq2.mat;

% Checking the contents
whos

% Sample Frequency
fs = 600;

% Resolution 
Nfft = 2^9;

% Creating the length 
L = length(x);

% Creating how many windows
Lwin80 = round(L/80);
Lwin20 = round(L/20);


% Creating the type of window (either rectangular or hamming window and 80 or 20 windows)
winRectangular80 = window(@rectwin, Lwin80);
winHamming80 = window(@hamming, Lwin80);
winRectangular20 = window(@rectwin, Lwin20);
winHamming20 = window(@hamming, Lwin20);


% How much to overlap on the window
Noverlap80 = round(Lwin80*0.50);
Noverlap20 = round(Lwin20*0.50);


% Applying Short Time Fourier Transfer
[yRect80, fRect80, tRect80] = stft(x, fs, "Window", winRectangular80, "OverlapLength", Noverlap80, "FFTLength", Nfft);
[yRect20, fRect20, tRect20] = stft(x, fs, "Window", winRectangular20, "OverlapLength", Noverlap20, "FFTLength", Nfft);
[yHam80, fHam80, tHam80] = stft(x, fs, "Window", winHamming80, "OverlapLength", Noverlap80, "FFTLength", Nfft);
[yHam20, fHam20, tHam20] = stft(x, fs, "Window", winHamming20, "OverlapLength", Noverlap20, "FFTLength", Nfft);

% Creating a figure
figure(2);

% Plotting Rectangluar with 80 windows
subplot(4,1,1);
imagesc(tRect80,fRect80, abs(yRect80));
xlabel('Time');
ylabel('Frequency');
title('Frequency Color Map, 80 Rectangular Windows');
colorbar;

% Plotting Rectanular with 20 windows
subplot(4,1,2);
imagesc(tRect20,fRect20, abs(yRect20));
xlabel('Time');
ylabel('Frequency');
title('Frequency Color Map, 20 Rectangular Windows');
colorbar;

% Plotting Hamming with 80 windows
subplot(4,1,3);
imagesc(tHam80,fHam80, abs(yHam80));
xlabel('Time');
ylabel('Frequency');
title('Frequency Color Map, 80 Hamming Windows');
colorbar;

% Plotting Hamming with 20 windows
subplot(4,1,4);
imagesc(tHam20,fHam20, abs(yHam20));
xlabel('Time');
ylabel('Frequency');
title('Frequency Color Map, 20 Hamming Windows');
colorbar;


%% Problem 3

% Loading in the 8 EEG signals 
load eeg1-c3.dat;
load eeg1-c4.dat;
load eeg1-f3.dat;
load eeg1-f4.dat;
load eeg1-o1.dat;
load eeg1-o2.dat;
load eeg1-p3.dat;
load eeg1-p4.dat;

% Creating an array 
eegTotal = [eeg1_c3 eeg1_c4 eeg1_f3 eeg1_f4 eeg1_o1 eeg1_o2 eeg1_p3 eeg1_p4];

% Resolution
Nfft = 256;

% Sample Frequency
fs = 100;

% Getting the length
L = length(eeg1_c3);

% Time domain
t1 = [1:L]/fs;

% Creating how many windows
Lwin = round(L/60);

% Creating the type of window 
win = window(@gausswin, Lwin);

% How much to overlap on the window
Noverlap = round(Lwin*0.50);

% Applying Short Time Fourier Transfer
[y, f, t] = stft(eeg1_c3, fs, "Window", win, "OverlapLength", Noverlap, "FFTLength", Nfft);
[y1, f, t] = stft(eeg1_c4, fs, "Window", win, "OverlapLength", Noverlap, "FFTLength", Nfft);
[y2, f, t] = stft(eeg1_f3, fs, "Window", win, "OverlapLength", Noverlap, "FFTLength", Nfft);
[y3, f, t] = stft(eeg1_f4, fs, "Window", win, "OverlapLength", Noverlap, "FFTLength", Nfft);
[y4, f, t] = stft(eeg1_o1, fs, "Window", win, "OverlapLength", Noverlap, "FFTLength", Nfft);
[y5, f, t] = stft(eeg1_o2, fs, "Window", win, "OverlapLength", Noverlap, "FFTLength", Nfft);
[y6, f, t] = stft(eeg1_p3, fs, "Window", win, "OverlapLength", Noverlap, "FFTLength", Nfft);
[y7, f, t] = stft(eeg1_p4, fs, "Window", win, "OverlapLength", Noverlap, "FFTLength", Nfft);


% Creating a figure
figure(3)

% Plotting all the EEG Signals in Frequency Colormap
subplot(8,1,1);
imagesc(t,f, abs(y));
xlabel('Time');
ylabel('EEG Signal, C3');
title('Time vs EEG Signal');

subplot(8,1,2);
imagesc(t,f, abs(y1));
xlabel('Time');
ylabel('EEG Signal, C4');
title('Time vs EEG Signal');

subplot(8,1,3);
imagesc(t,f, abs(y2));
xlabel('Time');
ylabel('EEG Signal, f3');
title('Time vs EEG Signal');

subplot(8,1,4);
imagesc(t,f, abs(y3));
xlabel('Time');
ylabel('EEG Signal, f4');
title('Time vs EEG Signal');

subplot(8,1,5);
imagesc(t,f, abs(y4));
xlabel('Time');
ylabel('EEG Signal, o1');
title('Time vs EEG Signal');

subplot(8,1,6);
imagesc(t,f, abs(y5));
xlabel('Time');
ylabel('EEG Signal, o2');
title('Time vs EEG Signal');

subplot(8,1,7);
imagesc(t,f, abs(y6));
xlabel('Time');
ylabel('EEG Signal, p3');
title('Time vs EEG Signal');

subplot(8,1,8);
imagesc(t,f, abs(y7));
xlabel('Time');
ylabel('EEG Signal, p4');
title('Time vs EEG Signal');



% Creating a figure
figure(4)

% Plotting Time Domain vs Power Density
subplot(8,1,1);
plot(t, abs(y));
xlabel('Time');
ylabel('EEG Signal, c3');
title('Time vs Power Density');

subplot(8,1,2);
plot(t, abs(y1));
xlabel('Time');
ylabel('EEG Signal, c4');
title('Time vs Power Density');

subplot(8,1,3);
plot(t, abs(y2));
xlabel('Time');
ylabel('EEG Signal, f3');
title('Time vs Power Density');

subplot(8,1,4);
plot(t, abs(y3));
xlabel('Time');
ylabel('EEG Signal, f4');
title('Time vs Power Density');

subplot(8,1,5);
plot(t, abs(y4));
xlabel('Time');
ylabel('EEG Signal, o1');
title('Time vs Power Density');

subplot(8,1,6);
plot(t, abs(y5));
xlabel('Time');
ylabel('EEG Signal, o2');
title('Time vs Power Density');

subplot(8,1,7);
plot(t, abs(y6));
xlabel('Time');
ylabel('EEG Signal, p3');
title('Time vs Power Density');

subplot(8,1,8);
plot(t, abs(y7));
xlabel('Time');
ylabel('EEG Signal, p4');
title('Time vs Power Density');



% Creating a figure
figure(5)

% Plotting Time Domain vs Power Density
subplot(8,1,1);
plot(f, abs(y));
xlabel('Frequency');
ylabel('EEG Signal, c3');
title('Frequency vs Power Density');

subplot(8,1,2);
plot(f, abs(y1));
xlabel('Frequency');
ylabel('EEG Signal, c4');
title('Frequency vs Power Density');

subplot(8,1,3);
plot(f, abs(y2));
xlabel('Frequency');
ylabel('EEG Signal, f3');
title('Frequency vs Power Density');

subplot(8,1,4);
plot(f, abs(y3));
xlabel('Frequency');
ylabel('EEG Signal, f4');
title('Frequency vs Power Density');

subplot(8,1,5);
plot(f, abs(y4));
xlabel('Frequency');
ylabel('EEG Signal, o1');
title('Frequency vs Power Density');

subplot(8,1,6);
plot(f, abs(y5));
xlabel('Frequency');
ylabel('EEG Signal, o2');
title('Frequency vs Power Density');

subplot(8,1,7);
plot(f, abs(y6));
xlabel('Frequency');
ylabel('EEG Signal, p3');
title('Frequency vs Power Density');

subplot(8,1,8);
plot(f, abs(y7));
xlabel('Frequency');
ylabel('EEG Signal, p4');
title('Frequency vs Power Density');


fprintf('I plotted (Time vs Power Density), (Frequency vs Power Density), and (Frequency Colormap) \n');
fprintf('To see any coorelation, where in time the rythmn is located for (Time vs Density) \n');
fprintf('Then using, (Frequency vs Power Density), to determine where the peak is located at \n')
fprintf('Once observing the two plots, I verify with the (Frequency Colormap) \n');
fprintf('For each eeg to see what is coorelation \n');
fprintf('From my observation, around or close to 0, the signal is most active \n');
fprintf('Finally, from observing from each (Frequency Colormap), I noticed the bright spots \n');
fprintf('The bright spots duration is from 0 - 200 second around 0 Hz \n');

% Identify axes coordinates
%[x,y] = ginput(eegTotal);