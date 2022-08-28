close all
clear all
nfft = 2^16;
Lwin = 256;
win = window(@hamming,Lwin);
Noverlap = round(Lwin * 0.5);

%% load the test signal sentence
[TestSignal, Testfs] = audioread('testing123.m4a');
%[TestSignal, Testfs] = audioread('TrainingData\k rack cat k sound.m4a');
fc = 200;
[b, a] = ellip(4, 1, fc, fc/(Testfs/2), 'high' );
TestSignal = filtfilt(b,a,TestSignal);
[S, F, T] = spectrogram(TestSignal, win, Noverlap, nfft, Testfs);
%normalizing data'
Smax = max(abs(S),[],'all');
%S = S/Smax;

imagesc(T ,F ,abs(S));
xlabel("Time");
ylabel("Freq");
%% test phonetic bank / training data
load Phonemes_bankV4.mat

% 
%% training model
[row,col] = size(S);
%modify to improve or reduce performance
window = 250;
Mod = 0.98;
percent = 0.9;
%----------------------------------------
overlap = percent * window;
phonemes = false(45,1);
trigger = 0;
string = [];

%{ 
    list the phonemes order
%}
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
    temp = Stemp(b_Fstart:b_Fend);
    R = corrcoef(temp,b_stft);
    R_corr(1) = R(2);
    temp = Stemp(d_Fstart:d_Fend);
    R = corrcoef(temp,d_stft);
    R_corr(2) = R(2);
    temp = Stemp(f_Fstart:f_Fend);
    R = corrcoef(temp,f_stft);
    R_corr(3) = R(2);
    temp = Stemp(g_Fstart:g_Fend);
    R = corrcoef(temp,g_stft);
    R_corr(4) = R(2);
    temp = Stemp(h_Fstart:h_Fend);
    R = corrcoef(temp,h_stft);
    R_corr(5) = R(2);
    temp = Stemp(dj_Fstart:dj_Fend);
    R = corrcoef(temp,dj_stft);
    R_corr(6) = R(2);
    temp = Stemp(k_Fstart:k_Fend);
    R = corrcoef(temp,k_stft);
    R_corr(7) = R(2);
    temp = Stemp(l_Fstart:l_Fend);
    R = corrcoef(temp,l_stft);
    R_corr(8) = R(2);
    temp = Stemp(m_Fstart:m_Fend);
    R = corrcoef(temp,m_stft);
    R_corr(9) = R(2);
    temp = Stemp(n_Fstart:n_Fend);
    R = corrcoef(temp,n_stft);
    R_corr(10) = R(2);
    temp = Stemp(p_Fstart:p_Fend);
    R = corrcoef(temp,p_stft);
    R_corr(11) = R(2);
    temp = Stemp(r_Fstart:r_Fend);
    R = corrcoef(temp,r_stft);
    R_corr(12) = R(2);
    temp = Stemp(s_Fstart:s_Fend);
    R = corrcoef(temp,s_stft);
    R_corr(13) = R(2);
    temp = Stemp(t_Fstart:t_Fend);
    R = corrcoef(temp,t_stft);
    R_corr(14) = R(2);
    temp = Stemp(v_Fstart:v_Fend);
    R = corrcoef(temp,v_stft);
    R_corr(15) = R(2);
    temp = Stemp(w_Fstart:w_Fend);
    R = corrcoef(temp,w_stft);
    R_corr(16) = R(2);
    temp = Stemp(z_Fstart:z_Fend);
    R = corrcoef(temp,z_stft);
    R_corr(17) = R(2);
    temp = Stemp(si_Fstart:si_Fend);
    R = corrcoef(temp,si_stft);
    R_corr(18) = R(2);
    temp = Stemp(ch_Fstart:ch_Fend);
    R = corrcoef(temp,ch_stft);
    R_corr(19) = R(2);
    temp = Stemp(sh_Fstart:sh_Fend);
    R = corrcoef(temp,sh_stft);
    R_corr(20) = R(2);
    temp = Stemp(th_Fstart:th_Fend);
    R = corrcoef(temp,th_stft);
    R_corr(21) = R(2);
    %%%%%%%%%%%%%%%
    %%% th #22 %%%%
    %%%%%%%%%%%%%%%
    temp = Stemp(ng_Fstart:ng_Fend);
    R = corrcoef(temp,ng_stft);
    R_corr(23) = R(2);
    temp = Stemp(y_Fstart:y_Fend);
    R = corrcoef(temp,y_stft);
    R_corr(24) = R(2);
    temp = Stemp(ae_Fstart:ae_Fend);
    R = corrcoef(temp,ae_stft);
    R_corr(25) = R(2);
    temp = Stemp(eI_Fstart:eI_Fend);
    R = corrcoef(temp,eI_stft);
    R_corr(26) = R(2);
    temp = Stemp(e_Fstart:e_Fend);
    R = corrcoef(temp,e_stft);
    R_corr(27) = R(2);
    temp = Stemp(ee_Fstart:ee_Fend);
    R = corrcoef(temp,ee_stft);
    R_corr(28) = R(2);
    temp = Stemp(Ie_Fstart:Ie_Fend);
    R = corrcoef(temp,Ie_stft);
    R_corr(29) = R(2);
    temp = Stemp(aI_Fstart:aI_Fend);
    R = corrcoef(temp,aI_stft);
    R_corr(30) = R(2);
    temp = Stemp(au_Fstart:au_Fend);
    R = corrcoef(temp,au_stft);
    R_corr(31) = R(2);
    temp = Stemp(oa_Fstart:oa_Fend);
    R = corrcoef(temp,oa_stft);
    R_corr(32) = R(2);
    temp = Stemp(oo_Fstart:oo_Fend);
    R = corrcoef(temp,oo_stft);
    R_corr(33) = R(2);
    temp = Stemp(u_Fstart:u_Fend);
    R = corrcoef(temp,u_stft);
    R_corr(34) = R(2);
    temp = Stemp(ue_Fstart:ue_Fend);
    R = corrcoef(temp,ue_stft);
    R_corr(35) = R(2);
    temp = Stemp(oi_Fstart:oi_Fend);
    R = corrcoef(temp,oi_stft);
    R_corr(36) = R(2);
    temp = Stemp(ow_Fstart:ow_Fend);
    R = corrcoef(temp,ow_stft);
    R_corr(37) = R(2);
    temp = Stemp(er_Fstart:er_Fend);
    R = corrcoef(temp,er_stft);
    R_corr(38) = R(2);
    temp = Stemp(air_Fstart:air_Fend);
    R = corrcoef(temp,air_stft);
    R_corr(39) = R(2);
    temp = Stemp(ar_Fstart:ar_Fend);
    R = corrcoef(temp,ar_stft);
    R_corr(40) = R(2);
    temp = Stemp(ir_Fstart:ir_Fend);
    R = corrcoef(temp,ir_stft);
    R_corr(41) = R(2);
    temp = Stemp(or_Fstart:or_Fend);
    R = corrcoef(temp,or_stft);
    R_corr(42) = R(2);
    temp = Stemp(ere_Fstart:ere_Fend);
    R = corrcoef(temp,ere_stft);
    R_corr(43) = R(2);
    temp = Stemp(our_Fstart:our_Fend);
    R = corrcoef(temp,our_stft);
    R_corr(44) = R(2);
    temp = Stemp(silence_Fstart:silence_Fend);
    R = corrcoef(temp,silence_stft);
    R_corr(45) = R(2);
    [M,I] = max(R_corr);
    if I == 1
        if(phonemes(1) == false)
            string = [string "b"];
            phonemes = false(45,1);
            phonemes(1) = true;
            disp([i "b"]);
        end
        %disp([i "b"]);
        trigger = trigger+1;
    end
    if I == 2
        if(phonemes(2) == false)
            string = [string "d"];
            phonemes = false(45,1);
            phonemes(2) = true;
            disp([i "d"]);
        end
        %disp([i "d"]);
        trigger = trigger+1;
    end
    if I == 3
        if(phonemes(3) == false)
            string = [string "f"];
            phonemes = false(45,1);
            phonemes(3) = true;
            disp([i "f"]);
        end
        %disp([i "f"]);
        trigger = trigger+1;
    end
    if I == 4
        if(phonemes(4) == false)
            string = [string "g"];
            phonemes = false(45,1);
            phonemes(4) = true;
            disp([i "g"]);
        end
        %disp([i "g"]);
        trigger = trigger+1;
    end
    if I == 5
        if(phonemes(5) == false)
            string = [string "h"];
            phonemes = false(45,1);
            phonemes(5) = true;
            disp([i "h"]);
        end
        %disp([i "h"]);
        trigger = trigger+1;
    end
    if I == 6
        if(phonemes(6) == false)
            string = [string "dʒ"];
            phonemes = false(45,1);
            phonemes(6) = true;
            disp([i "dʒ"]);
        end
        %disp([i "dʒ"]);
        trigger = trigger+1;
    end
    if I == 7
        if(phonemes(7) == false)
            string = [string "k"];
            phonemes = false(45,1);
            phonemes(7) = true;
            disp([i "k"]);
        end
        %disp([i "k"]);
        trigger = trigger+1;
    end
    if I == 8
        if(phonemes(8) == false)
            string = [string "l"];
            phonemes = false(45,1);
            phonemes(8) = true;
            disp([i "l"]);
        end
        %disp([i "l"]);
        trigger = trigger+1;
    end
    if I == 9
        if(phonemes(9) == false)
            string = [string "m"];
            phonemes = false(45,1);
            phonemes(9) = true;
            disp([i "m"]);
        end
        %disp([i "m"]);
        trigger = trigger+1;
    end
    if I == 10
        if(phonemes(10) == false)
            string = [string "n"];
            phonemes = false(45,1);
            phonemes(10) = true;
            disp([i "n"]);
        end
        %disp([i "n"]);
        trigger = trigger+1;
    end
    if I == 11
        if(phonemes(11) == false)
            string = [string "p"];
            phonemes = false(45,1);
            phonemes(11) = true;
            disp([i "p"]);
        end
        %disp([i "p"]);
        trigger = trigger+1;
    end
    if I == 12
        if(phonemes(12) == false)
            string = [string "r"];
            phonemes = false(45,1);
            phonemes(12) = true;
            disp([i "r"]);
        end
        %disp([i "r"]);
        trigger = trigger+1;
    end
    if I == 13
        if(phonemes(13) == false)
            string = [string "s"];
            phonemes = false(45,1);
            phonemes(13) = true;
            disp([i "s"]);
        end
        %disp([i "s"]);
        trigger = trigger+1;
    end
    if I == 14
        if(phonemes(14) == false)
            string = [string "t"];
            phonemes = false(45,1);
            phonemes(14) = true;
            disp([i "t"]);
        end
        %disp([i "t"]);
        trigger = trigger+1;
    end
    if I == 15
        if(phonemes(15) == false)
            string = [string "v"];
            phonemes = false(45,1);
            phonemes(15) = true;
            disp([i "v"]);
        end
        %disp([i "v"]);
        trigger = trigger+1;
    end
    if I == 16
        if(phonemes(16) == false)
            string = [string "w"];
            phonemes = false(45,1);
            phonemes(16) = true;
            disp([i "w"]);
        end
        %disp([i "w"]);
        trigger = trigger+1;
    end
    if I == 17
        if(phonemes(17) == false)
            string = [string "z"];
            phonemes = false(45,1);
            phonemes(17) = true;
            disp([i "z"]);
        end
        %disp([i "z"]);
        trigger = trigger+1;
    end
    if I == 18
        if(phonemes(18) == false)
            string = [string "ʒ"];
            phonemes = false(45,1);
            phonemes(18) = true;
            disp([i "ʒ"]);
        end
        %disp([i "ʒ"]);
        trigger = trigger+1;
    end
    if I == 19
        if(phonemes(19) == false)
            string = [string "tʃ"];
            phonemes = false(45,1);
            phonemes(19) = true;
            disp([i "tʃ"]);
        end
        %disp([i "tʃ"]);
        trigger = trigger+1;
    end
    if I == 20
        if(phonemes(20) == false)
            string = [string "ʃ"];
            phonemes = false(45,1);
            phonemes(20) = true;
            disp([i "ʃ"]);
        end
        %disp([i "ʃ"]);
        trigger = trigger+1;
    end
    if I == 21
        if(phonemes(21) == false)
            string = [string "θ"];
            phonemes = false(45,1);
            phonemes(21) = true;
            disp([i "θ"]);
        end
        %disp([i "θ"]);
        trigger = trigger+1;
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% th #22 ð %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
    if I == 23
        if(phonemes(23) == false)
            string = [string "ŋ"];
            phonemes = false(45,1);
            phonemes(23) = true;
            disp([i "ŋ"]);
        end
        %disp([i "ŋ"]);
        trigger = trigger+1;
    end
    if I == 24
        if(phonemes(23) == false)
            string = [string "j"];
            phonemes = false(45,1);
            phonemes(23) = true;
            disp([i "j"]);
        end
        %disp([i "j"]);
        trigger = trigger+1;
    end
    if I == 25
        if(phonemes(25) == false)
            string = [string "æ"];
            phonemes = false(45,1);
            phonemes(25) = true;
            disp([i "æ"]);
        end
        %disp([i "æ"]);
        trigger = trigger+1;
    end
    if I == 26
        if(phonemes(26) == false)
            string = [string "eɪ"];
            phonemes = false(45,1);
            phonemes(26) = true;
            disp([i "eɪ"]);
        end
        %disp([i "eɪ"]);
        trigger = trigger+1;
    end
    if I == 27
        if(phonemes(27) == false)
            string = [string "e"];
            phonemes = false(45,1);
            phonemes(27) = true;
            disp([i "e"]);
        end
        %disp([i "e"]);
        trigger = trigger+1;
    end
    if I == 28
        if(phonemes(28) == false)
            string = [string "i:"];
            phonemes = false(45,1);
            phonemes(28) = true;
            disp([i "i:"]);
        end
        %disp([i "i:"]);
        trigger = trigger+1;
    end
    if I == 29
        if(phonemes(29) == false)
            string = [string "ɪ"];
            phonemes = false(45,1);
            phonemes(29) = true;
            disp([i "ɪ"]);
        end
        %disp([i "ɪ"]);
        trigger = trigger+1;
    end
    if I == 30
        if(phonemes(30) == false)
            string = [string "aɪ"];
            phonemes = false(45,1);
            phonemes(30) = true;
            disp([i "aɪ"]);
        end
        %disp([i "aɪ"]);
        trigger = trigger+1;
    end
    if I == 31
        if(phonemes(31) == false)
            string = [string "ɒ"];
            phonemes = false(45,1);
            phonemes(31) = true;
            disp([i "ɒ"]);
        end
        %disp([i "ɒ"]);
        trigger = trigger+1;
    end
    if I == 32
        if(phonemes(32) == false)
            string = [string "oʊ"];
            phonemes = false(45,1);
            phonemes(32) = true;
            disp([i "oʊ"]);
        end
        %disp([i "oʊ"]);
        trigger = trigger+1;
    end
    if I == 33
        if(phonemes(33) == false)
            string = [string "ʊ"];
            phonemes = false(45,1);
            phonemes(33) = true;
            disp([i "ʊ"]);
        end
        %disp([i "ʊ"]);
        trigger = trigger+1;
    end
    if I == 34
        if(phonemes(34) == false)
            string = [string "ʌ"];
            phonemes = false(45,1);
            phonemes(34) = true;
            disp([i "ʌ"]);
        end
        %disp([i "ʌ"]);
        trigger = trigger+1;
    end
    if I == 35
        if(phonemes(35) == false)
            string = [string "u:"];
            phonemes = false(45,1);
            phonemes(35) = true;
            disp([i "u:"]);
        end
        %disp([i "u:"]);
        trigger = trigger+1;
    end
    if I == 36
        if(phonemes(36) == false)
            string = [string "ɔɪ"];
            phonemes = false(45,1);
            phonemes(36) = true;
            disp([i "ɔɪ"]);
        end
        %disp([i "ɔɪ"]);
        trigger = trigger+1;
    end
    if I == 37
        if(phonemes(37) == false)
            string = [string "aʊ"];
            phonemes = false(45,1);
            phonemes(37) = true;
            disp([i "aʊ"]);
        end
        %disp([i "aʊ"]);
        trigger = trigger+1;
    end
    if I == 38
        if(phonemes(38) == false)
            string = [string "ə"];
            phonemes = false(45,1);
            phonemes(38) = true;
            disp([i "ə"]);
        end
        %disp([i "ə"]);
        trigger = trigger+1;
    end
    if I == 39
        if(phonemes(39) == false)
            string = [string "eəʳ"];
            phonemes = false(45,1);
            phonemes(39) = true;
            disp([i "eəʳ"]);
        end
        %disp([i "eəʳ"]);
        trigger = trigger+1;
    end
    if I == 40
        if(phonemes(40) == false)
            string = [string "ɑ:"];
            phonemes = false(45,1);
            phonemes(40) = true;
            disp([i "ɑ:"]);
        end
        %disp([i "ɑ:"]);
        trigger = trigger+1;
    end
    if I == 41
        if(phonemes(41) == false)
            string = [string "ɜ:ʳ"];
            phonemes = false(45,1);
            phonemes(41) = true;
            disp([i "ɜ:ʳ"]);
        end
        %disp([i "ɜ:ʳ"]);
        trigger = trigger+1;
    end
    if I == 42
        if(phonemes(42) == false)
            string = [string "ɔ:"];
            phonemes = false(45,1);
            phonemes(42) = true;
            disp([i "ɔ:"]);
        end
        %disp([i "ɔ:"]);
        trigger = trigger+1;
    end
    if I == 43
        if(phonemes(43) == false)
            string = [string "ɪəʳ"];
            phonemes = false(45,1);
            phonemes(43) = true;
            disp([i "ɪəʳ"]);
        end
        %disp([i "ɪəʳ"]);
        trigger = trigger+1;
    end
    if I == 44
        if(phonemes(44) == false)
            string = [string "ʊəʳ"];
            phonemes = false(45,1);
            phonemes(44) = true;
            disp([i "ʊəʳ"]);
        end
        %disp([i "ʊəʳ"]);
        trigger = trigger+1;
    end
    if I == 45
        if(phonemes(45) == false)
            string = [string "blank"];
            phonemes = false(45,1);
            phonemes(45) = true;
            disp([i "blank"]);
        end
        %disp([i "blank"]);
        trigger = trigger+1;
    end
end
trigger
string