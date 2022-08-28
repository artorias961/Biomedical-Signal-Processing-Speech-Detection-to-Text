close all
clear all
nfft = 2^14;
Lwin = 256;
win = window(@hamming,Lwin);
Noverlap = round(Lwin * 0.5);


%% test phonetic bank
% /n/ sound n in nail
% frequency 140 and 280
% window size 2 time blocks, with degree of 12 or up

%% load the test signal sentence
[TestSignal, Testfs] = audioread('testing123.m4a');
%[TestSignal, Testfs] = audioread('ING sound.m4a');
%sound(TestSignal,Testfs);
% reduce fs to a better size

%Testfs =Testfs/4;
%TestSignal = TestSignal(1:4:end);
[S, F, T] = spectrogram(TestSignal, win, Noverlap, nfft, Testfs);
imagesc(T ,F ,abs(S));
%--- n sound ---
Freq = find(F>=280);
N_F1 = Freq(1); % density 10
Freq = find(F>=280);
N_F2 = Freq(1); % density 10
Freq = find(F>=280);
N_F3 = Freq(1); % density 10
%-- ing sound -- 
Freq = find(F>=160);
ING_F1 = Freq(1); % density 12
Freq = find(F>=320);
ING_F2 = Freq(1); % density 13
Freq = find(F>=500);
ING_F3 = Freq(1); % density 13
%-- t sound -- 
Freq = find(F>=2600);
T_F1 = Freq(1); % density 6
%-- e sound -- 
Freq = find(F>=545);
E_F1 = Freq(1); % density 13
%-- s sound -- 
Freq = find(F>=7350);
S_F1 = Freq(1); % density 13
Freq = find(F>=8700);
S_F2 = Freq(1); % density 13
%sound(TestSignal,Testfs);
[row,col] = size(S);
ing = false;
n = false;
t = false;
e = false;
s = false;
r = false; 
Mod = 48;
string = [];
trigger = 0;
for i = 1:10:col-50
    temp = abs(S(:,i:i+50));
    temp = sum(temp,2);
    if (temp(T_F1) >= (1*Mod)) % 1
        if(t == false)
            string = [string "t"];
            t = true;
            n = false;
            ing = false;
            e = false;
            s = false;
            disp([i "t"]);
        end
        trigger = trigger+1;
    elseif ((temp(S_F1) >= (0.7*Mod)) && ...% 1
            (temp(S_F2) >= (0.7*Mod)))
        if(s == false)
            string = [string "s"];
            s = true;
            t = false;
            n = false;
            ing = false;
            e = false;
            disp([i "s"]);
        end
        trigger = trigger+1;
     elseif (temp(E_F1) >= (17*Mod))
        if(e == false)
            string = [string "e"];
            e = true;
            t = false;
            n = false;
            ing = false;
            s = false;
            disp([i "e"]);
        end
        trigger = trigger+1;
    elseif((temp(ING_F1) >= (9*Mod)) && ...
       (temp(ING_F2) >= (9*Mod)) && ...
       (temp(ING_F3) >= (9*Mod)))
        if(ing == false)
            string = [string "ing"];
            ing = true;
            n = false;
            t = false;
            e = false;
            s = false;
            disp([i "ing"]);
        end
        trigger = trigger+1;
    elseif ((temp(N_F1) >= (10*Mod)) && ...
            (temp(N_F2) >= (10*Mod)) && ...
            (temp(N_F3) >= (10*Mod)))
        if(n == false)
            string = [string "n"];
            n = true;
            ing = false;
            t = false;
            e = false;
            s = false;
            disp([i "n"]);
        end
        trigger = trigger+1;
    end
    
end

trigger
string