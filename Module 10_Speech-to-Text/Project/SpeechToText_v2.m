close all
clear all
nfft = 2^14;
Lwin = 256;
win = window(@hamming,Lwin);
Noverlap = round(Lwin * 0.5);
visual = false;
%% load the test signal sentence
[TestSignal, Testfs] = audioread('testing123 slow.m4a');
%[TestSignal, Testfs] = audioread('ING sound.m4a');
if (visual == true)
    Testfs =Testfs/2;
    TestSignal = TestSignal(1:2:end);
end
[S, F, T] = spectrogram(TestSignal, win, Noverlap, nfft, Testfs);
%normalizing data'
Smax = max(abs(S),[],'all');
%S = S/Smax;

imagesc(T ,F ,abs(S));
%% test phonetic bank / training data
%-------------------------------------------------------
% /b/ sound in 
b_max = 14.8419;
% F1  38 700 Density 0.38856
Freq = find(F>=38 & F<=700);
b_F1_start = Freq(1);
b_F1_end = Freq(end);
[b_F1_range, x] = size(S(b_F1_start:b_F1_end, :));
b_D1= 0.38856;
% F2  1000 1200 Density 0.11311
Freq = find(F>=1000 & F<=1200);
b_F2_start = Freq(1);
b_F2_end = Freq(end);
[b_F2_range, x] = size(S(b_F2_start:b_F2_end, :));
b_D2= 0.11311;
%-------------------------------------------------------
% /d/ sound in 
d_max = 6.5211;
% F1  100 500 Density 0.37323
Freq = find(F>=100 & F<=500);
d_F1_start = Freq(1);
d_F1_end = Freq(end);
[d_F1_range, x] = size(S(d_F1_start:d_F1_end, :));
d_D1= 0.37323;
% F2  1380 1521 Density 0.17585
Freq = find(F>=1380 & F<=1521);
d_F2_start = Freq(1);
d_F2_end = Freq(end);
[d_F2_range, x] = size(S(d_F2_start:d_F2_end, :));
d_D2= 0.17585;
% F3  2330 2550 Density 0.092808
Freq = find(F>=2330 & F<=2550);
d_F3_start = Freq(1);
d_F3_end = Freq(end);
[d_F3_range, x] = size(S(d_F3_start:d_F3_end, :));
d_D3= 0.092808;
%-------------------------------------------------------
% /f/ sound in 
f_max = 3.818;
% F1  0 300 Density 0.20558
Freq = find(F>=0 & F<=300);
f_F1_start = Freq(1);
f_F1_end = Freq(end);
[f_F1_range, x] = size(S(f_F1_start:f_F1_end, :));
f_D1= 0.20558;
% F2  6800 12500 Density 0.079395
Freq = find(F>=6800 & F<=12500);
f_F2_start = Freq(1);
f_F2_end = Freq(end);
[f_F2_range, x] = size(S(f_F2_start:f_F2_end, :));
f_D2= 0.079395;
%-------------------------------------------------------
% /g/ sound in 
g_max = 7.9454;
% F1  0 780 Density 0.36077
Freq = find(F>=0 & F<=780);
g_F1_start = Freq(1);
g_F1_end = Freq(end);
[g_F1_range, x] = size(S(g_F1_start:g_F1_end, :));
g_D1= 0.36077;
% F2  1100 1600 Density 0.13415
Freq = find(F>=1100 & F<=1600);
g_F2_start = Freq(1);
g_F2_end = Freq(end);
[g_F2_range, x] = size(S(g_F2_start:g_F2_end, :));
g_D2= 0.13415;
%-------------------------------------------------------
% /h/ sound in 
h_max = 4.7181;
% F1  1100 1600 Density 0.086309
Freq = find(F>=1100 & F<=1600);
h_F1_start = Freq(1);
h_F1_end = Freq(end);
[h_F1_range, x] = size(S(h_F1_start:h_F1_end, :));
h_D1= 0.086309;
% F2  2600 3000 Density 0.1264
Freq = find(F>=2600 & F<=3000);
h_F2_start = Freq(1);
h_F2_end = Freq(end);
[h_F2_range, x] = size(S(h_F2_start:h_F2_end, :));
h_D2= 0.1264;
%-------------------------------------------------------
% /dʒ/ sound in 
dj_max = 4.016;
% F1  0 540 Density 0.13313
Freq = find(F>=0 & F<=540);
dj_F1_start = Freq(1);
dj_F1_end = Freq(end);
[dj_F1_range, x] = size(S(dj_F1_start:dj_F1_end, :));
dj_D1= 0.13313;
% F2  1400 1750 Density 0.0033074
Freq = find(F>=1400 & F<=1750);
dj_F2_start = Freq(1);
dj_F2_end = Freq(end);
[dj_F2_range, x] = size(S(dj_F2_start:dj_F2_end, :));
dj_D2= 0.0033074;
% F3  2300 6000 Density 0.0014621
Freq = find(F>=2300 & F<=6000);
dj_F3_start = Freq(1);
dj_F3_end = Freq(end);
[dj_F3_range, x] = size(S(dj_F3_start:dj_F3_end, :));
dj_D3= 0.0014621;
%-------------------------------------------------------
% /k/ sound in 
k_max = 6.7796;
% F1  800 2000 Density 0.12318
Freq = find(F>=800 & F<=2000);
k_F1_start = Freq(1);
k_F1_end = Freq(end);
[k_F1_range, x] = size(S(k_F1_start:k_F1_end, :));
k_D1= 0.12318;
% F2  3800 4500 Density 0.068565
Freq = find(F>=3800 & F<=4500);
k_F2_start = Freq(1);
k_F2_end = Freq(end);
[k_F2_range, x] = size(S(k_F2_start:k_F2_end, :));
k_D2= 0.068565;
% F3  7300 11000 Density 0.027686
Freq = find(F>=7300 & F<=11000);
k_F3_start = Freq(1);
k_F3_end = Freq(end);
[k_F3_range, x] = size(S(k_F3_start:k_F3_end, :));
k_D3= 0.027686;
%-------------------------------------------------------
% /l/ sound in 
l_max = 13.4103;
% F1  0 600 Density 0.33682
Freq = find(F>=0 & F<=600);
l_F1_start = Freq(1);
l_F1_end = Freq(end);
[l_F1_range, x] = size(S(l_F1_start:l_F1_end, :));
l_D1= 0.33682;
% F2  1100 1650 Density 0.039545
Freq = find(F>=1100 & F<=1650);
l_F2_start = Freq(1);
l_F2_end = Freq(end);
[l_F2_range, x] = size(S(l_F2_start:l_F2_end, :));
l_D2= 0.039545;
% F3  2250 4000 Density 0.028643
Freq = find(F>=2250 & F<=4000);
l_F3_start = Freq(1);
l_F3_end = Freq(end);
[l_F3_range, x] = size(S(l_F3_start:l_F3_end, :));
l_D3= 0.028643;
% F4  13000 18000 Density 0.00048094
Freq = find(F>=13000 & F<=18000);
l_F4_start = Freq(1);
l_F4_end = Freq(end);
[l_F4_range, x] = size(S(l_F4_start:l_F4_end, :));
l_D4= 0.00048094;
%-------------------------------------------------------
% /m/ sound in 
m_max = 20.2055;
% F1  0 550 Density 0.30003
Freq = find(F>=0 & F<=550);
m_F1_start = Freq(1);
m_F1_end = Freq(end);
[m_F1_range, x] = size(S(m_F1_start:m_F1_end, :));
m_D1= 0.30003;
% F2  680 1450 Density 0.019901
Freq = find(F>=680 & F<=1450);
m_F2_start = Freq(1);
m_F2_end = Freq(end);
[m_F2_range, x] = size(S(m_F2_start:m_F2_end, :));
m_D2= 0.019901;
% F3  1870 2700 Density 0.021867
Freq = find(F>=1870 & F<=2700);
m_F3_start = Freq(1);
m_F3_end = Freq(end);
[m_F3_range, x] = size(S(m_F3_start:m_F3_end, :));
m_D3= 0.021867;
% F4  13000 18000 Density 0.00039647
Freq = find(F>=13000 & F<=18000);
m_F4_start = Freq(1);
m_F4_end = Freq(end);
[m_F4_range, x] = size(S(m_F4_start:m_F4_end, :));
m_D4= 0.00039647;
%-------------------------------------------------------
% /n/ sound in 
n_max = 22.7109;
% F1  80 190 Density 0.44208
Freq = find(F>=80 & F<=190);
n_F1_start = Freq(1);
n_F1_end = Freq(end);
[n_F1_range, x] = size(S(n_F1_start:n_F1_end, :));
n_D1= 0.44208;
% F2  220 340 Density 0.337
Freq = find(F>=220 & F<=340);
n_F2_start = Freq(1);
n_F2_end = Freq(end);
[n_F2_range, x] = size(S(n_F2_start:n_F2_end, :));
n_D2= 0.337;
% F3  380 480 Density 0.1652
Freq = find(F>=380 & F<=480);
n_F3_start = Freq(1);
n_F3_end = Freq(end);
[n_F3_range, x] = size(S(n_F3_start:n_F3_end, :));
n_D3= 0.1652;
% F4  500 590 Density 0.074605
Freq = find(F>=500 & F<=590);
n_F4_start = Freq(1);
n_F4_end = Freq(end);
[n_F4_range, x] = size(S(n_F4_start:n_F4_end, :));
n_D4= 0.074605;
%-------------------------------------------------------
% /p/ sound in 
p_max = 14.378;
% F1  560 12000 Density 0.0080863
Freq = find(F>=560 & F<=12000);
p_F1_start = Freq(1);
p_F1_end = Freq(end);
[p_F1_range, x] = size(S(p_F1_start:p_F1_end, :));
p_D1= 0.0080863;
%-------------------------------------------------------
% /r/ sound in 
r_max = 15.3122;
% F1  100 700 Density 0.30206
Freq = find(F>=100 & F<=700);
r_F1_start = Freq(1);
r_F1_end = Freq(end);
[r_F1_range, x] = size(S(r_F1_start:r_F1_end, :));
r_D1= 0.30206;
% F2  1100 1900 Density 0.13127
Freq = find(F>=1100 & F<=1900);
r_F2_start = Freq(1);
r_F2_end = Freq(end);
[r_F2_range, x] = size(S(r_F2_start:r_F2_end, :));
r_D2= 0.13127;
%-------------------------------------------------------
% /s/ sound in 
s_max = 3.8317;
% F1  3500 5200 Density 0.055264
Freq = find(F>=3500 & F<=5200);
s_F1_start = Freq(1);
s_F1_end = Freq(end);
[s_F1_range, x] = size(S(s_F1_start:s_F1_end, :));
s_D1= 0.055264;
% F2  5600 9500 Density 0.12251
Freq = find(F>=5600 & F<=9500);
s_F2_start = Freq(1);
s_F2_end = Freq(end);
[s_F2_range, x] = size(S(s_F2_start:s_F2_end, :));
s_D2= 0.12251;
% F3  10200 13160 Density 0.14347
Freq = find(F>=10200 & F<=13160);
s_F3_start = Freq(1);
s_F3_end = Freq(end);
[s_F3_range, x] = size(S(s_F3_start:s_F3_end, :));
s_D3= 0.14347;
%-------------------------------------------------------
% /t/ sound in 
t_max = 3.2421;
% F1  1500 5000 Density 0.11288
Freq = find(F>=1500 & F<=5000);
t_F1_start = Freq(1);
t_F1_end = Freq(end);
[t_F1_range, x] = size(S(t_F1_start:t_F1_end, :));
t_D1= 0.11288;
% F2  6800 10300 Density 0.19732
Freq = find(F>=6800 & F<=10300);
t_F2_start = Freq(1);
t_F2_end = Freq(end);
[t_F2_range, x] = size(S(t_F2_start:t_F2_end, :));
t_D2= 0.19732;
%-------------------------------------------------------
% /v/ sound in 
v_max = 10.9244;
% F1  0 300 Density 0.41417
Freq = find(F>=0 & F<=300);
v_F1_start = Freq(1);
v_F1_end = Freq(end);
[v_F1_range, x] = size(S(v_F1_start:v_F1_end, :));
v_D1= 0.41417;
% F2  4000 12000 Density 0.0067095
Freq = find(F>=4000 & F<=12000);
v_F2_start = Freq(1);
v_F2_end = Freq(end);
[v_F2_range, x] = size(S(v_F2_start:v_F2_end, :));
v_D2= 0.0067095;
%-------------------------------------------------------
% /w/ sound in 
w_max = 12.8129;
% F1  0 1000 Density 0.34323
Freq = find(F>=0 & F<=1000);
w_F1_start = Freq(1);
w_F1_end = Freq(end);
[w_F1_range, x] = size(S(w_F1_start:w_F1_end, :));
w_D1= 0.34323;
%-------------------------------------------------------
% /z/ sound in 
z_max = 9.1502;
% F1  0 600 Density 0.14729
Freq = find(F>=0 & F<=600);
z_F1_start = Freq(1);
z_F1_end = Freq(end);
[z_F1_range, x] = size(S(z_F1_start:z_F1_end, :));
z_D1= 0.14729;
% F2  5000 9000 Density 0.028672
Freq = find(F>=5000 & F<=9000);
z_F2_start = Freq(1);
z_F2_end = Freq(end);
[z_F2_range, x] = size(S(z_F2_start:z_F2_end, :));
z_D2= 0.028672;
%-------------------------------------------------------
% /ʒ/ sound in 
si_max = 10.4255;
% F1  0 560 Density 0.26721
Freq = find(F>=0 & F<=560);
si_F1_start = Freq(1);
si_F1_end = Freq(end);
[si_F1_range, x] = size(S(si_F1_start:si_F1_end, :));
si_D1= 0.26721;
% F2  1500 5500 Density 0.025024
Freq = find(F>=1500 & F<=5500);
si_F2_start = Freq(1);
si_F2_end = Freq(end);
[si_F2_range, x] = size(S(si_F2_start:si_F2_end, :));
si_D2= 0.025024;
% F3  8000 8600 Density 0.0066084
Freq = find(F>=8000 & F<=8600);
si_F3_start = Freq(1);
si_F3_end = Freq(end);
[si_F3_range, x] = size(S(si_F3_start:si_F3_end, :));
si_D3= 0.0066084;
%-------------------------------------------------------
% /ch/ sound in 
ch_max = 9.2495;
% F1  2000 3700 Density 0.19998
Freq = find(F>=2000 & F<=3700);
ch_F1_start = Freq(1);
ch_F1_end = Freq(end);
[ch_F1_range, x] = size(S(ch_F1_start:ch_F1_end, :));
ch_D1= 0.19998;
% F2  4500 6700 Density 0.12477
Freq = find(F>=4500 & F<=6700);
ch_F2_start = Freq(1);
ch_F2_end = Freq(end);
[ch_F2_range, x] = size(S(ch_F2_start:ch_F2_end, :));
ch_D2= 0.12477;
% F3  7800 9800 Density 0.066153
Freq = find(F>=7800 & F<=9800);
ch_F3_start = Freq(1);
ch_F3_end = Freq(end);
[ch_F3_range, x] = size(S(ch_F3_start:ch_F3_end, :));
ch_D3= 0.066153;
%-------------------------------------------------------
% /sh/ sound in 
sh_max = 7.0718;
% F1  2000 3500 Density 0.18557
Freq = find(F>=2000 & F<=3500);
sh_F1_start = Freq(1);
sh_F1_end = Freq(end);
[sh_F1_range, x] = size(S(sh_F1_start:sh_F1_end, :));
sh_D1= 0.18557;
% F2  3700 6000 Density 0.10542
Freq = find(F>=3700 & F<=6000);
sh_F2_start = Freq(1);
sh_F2_end = Freq(end);
[sh_F2_range, x] = size(S(sh_F2_start:sh_F2_end, :));
sh_D2= 0.10542;
% F3  6000 10000 Density 0.052755
Freq = find(F>=6000 & F<=10000);
sh_F3_start = Freq(1);
sh_F3_end = Freq(end);
[sh_F3_range, x] = size(S(sh_F3_start:sh_F3_end, :));
sh_D3= 0.052755;
%-------------------------------------------------------
% /th/ sound in 
th_max = 15.9177;
% F1  0 850 Density 0.2426
Freq = find(F>=0 & F<=850);
th_F1_start = Freq(1);
th_F1_end = Freq(end);
[th_F1_range, x] = size(S(th_F1_start:th_F1_end, :));
th_D1= 0.2426;
% F2  1100 1600 Density 0.095416
Freq = find(F>=1100 & F<=1600);
th_F2_start = Freq(1);
th_F2_end = Freq(end);
[th_F2_range, x] = size(S(th_F2_start:th_F2_end, :));
th_D2= 0.095416;
% F3  2300 2700 Density 0.017632
Freq = find(F>=2300 & F<=2700);
th_F3_start = Freq(1);
th_F3_end = Freq(end);
[th_F3_range, x] = size(S(th_F3_start:th_F3_end, :));
th_D3= 0.017632;
%-------------------------------------------------------
% /ng/ sound in 
ng_max = 12.1383;
% F1  0 370 Density 0.43323
Freq = find(F>=0 & F<=370);
ng_F1_start = Freq(1);
ng_F1_end = Freq(end);
[ng_F1_range, x] = size(S(ng_F1_start:ng_F1_end, :));
ng_D1= 0.43323;
% F2  730 1730 Density 0.030279
Freq = find(F>=730 & F<=1730);
ng_F2_start = Freq(1);
ng_F2_end = Freq(end);
[ng_F2_range, x] = size(S(ng_F2_start:ng_F2_end, :));
ng_D2= 0.030279;
% F3  2050 2500 Density 0.058483
Freq = find(F>=2050 & F<=2500);
ng_F3_start = Freq(1);
ng_F3_end = Freq(end);
[ng_F3_range, x] = size(S(ng_F3_start:ng_F3_end, :));
ng_D3= 0.058483;
%-------------------------------------------------------
% /y/ sound in 
y_max = 6.9665;
% F1  0 600 Density 0.25099
Freq = find(F>=0 & F<=600);
y_F1_start = Freq(1);
y_F1_end = Freq(end);
[y_F1_range, x] = size(S(y_F1_start:y_F1_end, :));
y_D1= 0.25099;
% F2  1400 2600 Density 0.027525
Freq = find(F>=1400 & F<=2600);
y_F2_start = Freq(1);
y_F2_end = Freq(end);
[y_F2_range, x] = size(S(y_F2_start:y_F2_end, :));
y_D2= 0.027525;
% F3  2800 3700 Density 0.019361
Freq = find(F>=2800 & F<=3700);
y_F3_start = Freq(1);
y_F3_end = Freq(end);
[y_F3_range, x] = size(S(y_F3_start:y_F3_end, :));
y_D3= 0.019361;
%-------------------------------------------------------
% /ae/ sound in 
ae_max = 25.891;
% F1  755 881 Density 0.56621
Freq = find(F>=755 & F<=881);
ae_F1_start = Freq(1);
ae_F1_end = Freq(end);
[ae_F1_range, x] = size(S(ae_F1_start:ae_F1_end, :));
ae_D1= 0.56621;
% F2  1464 1576 Density 0.33976
Freq = find(F>=1464 & F<=1576);
ae_F2_start = Freq(1);
ae_F2_end = Freq(end);
[ae_F2_range, x] = size(S(ae_F2_start:ae_F2_end, :));
ae_D2= 0.33976;
% F3  2200 2700 Density 0.069404
Freq = find(F>=2200 & F<=2700);
ae_F3_start = Freq(1);
ae_F3_end = Freq(end);
[ae_F3_range, x] = size(S(ae_F3_start:ae_F3_end, :));
ae_D3= 0.069404;
%-------------------------------------------------------
% /eI/ sound in 
eI_max = 26.6605;
% F1  0 200 Density 0.1923
Freq = find(F>=0 & F<=200);
eI_F1_start = Freq(1);
eI_F1_end = Freq(end);
[eI_F1_range, x] = size(S(eI_F1_start:eI_F1_end, :));
eI_D1= 0.1923;
% F2  435 513 Density 0.68779
Freq = find(F>=435 & F<=513);
eI_F2_start = Freq(1);
eI_F2_end = Freq(end);
[eI_F2_range, x] = size(S(eI_F2_start:eI_F2_end, :));
eI_D2= 0.68779;
%-------------------------------------------------------
% /e/ sound in 
e_max = 29.741;
% F1  0 310 Density 0.21392
Freq = find(F>=0 & F<=310);
e_F1_start = Freq(1);
e_F1_end = Freq(end);
[e_F1_range, x] = size(S(e_F1_start:e_F1_end, :));
e_D1= 0.21392;
% F2  445 764 Density 0.51222
Freq = find(F>=445 & F<=764);
e_F2_start = Freq(1);
e_F2_end = Freq(end);
[e_F2_range, x] = size(S(e_F2_start:e_F2_end, :));
e_D2= 0.51222;
% F3  1380 1600 Density 0.10682
Freq = find(F>=1380 & F<=1600);
e_F3_start = Freq(1);
e_F3_end = Freq(end);
[e_F3_range, x] = size(S(e_F3_start:e_F3_end, :));
e_D3= 0.10682;
%-------------------------------------------------------
% /aI/ sound in 
aI_max = 26.3809;
% F1  0 340 Density 0.2535
Freq = find(F>=0 & F<=340);
aI_F1_start = Freq(1);
aI_F1_end = Freq(end);
[aI_F1_range, x] = size(S(aI_F1_start:aI_F1_end, :));
aI_D1= 0.2535;
% F2  500 800 Density 0.41891
Freq = find(F>=500 & F<=800);
aI_F2_start = Freq(1);
aI_F2_end = Freq(end);
[aI_F2_range, x] = size(S(aI_F2_start:aI_F2_end, :));
aI_D2= 0.41891;
% F3  980 1280 Density 0.27957
Freq = find(F>=980 & F<=1280);
aI_F3_start = Freq(1);
aI_F3_end = Freq(end);
[aI_F3_range, x] = size(S(aI_F3_start:aI_F3_end, :));
aI_D3= 0.27957;
%-------------------------------------------------------
% /au/ sound in 
au_max = 24.1997;
% F1  0 300 Density 0.080712
Freq = find(F>=0 & F<=300);
au_F1_start = Freq(1);
au_F1_end = Freq(end);
[au_F1_range, x] = size(S(au_F1_start:au_F1_end, :));
au_D1= 0.080712;
% F2  420 820 Density 0.19498
Freq = find(F>=420 & F<=820);
au_F2_start = Freq(1);
au_F2_end = Freq(end);
[au_F2_range, x] = size(S(au_F2_start:au_F2_end, :));
au_D2= 0.19498;
% F3  1000 1300 Density 0.052879
Freq = find(F>=1000 & F<=1300);
au_F3_start = Freq(1);
au_F3_end = Freq(end);
[au_F3_range, x] = size(S(au_F3_start:au_F3_end, :));
au_D3= 0.052879;
%-------------------------------------------------------
% /oa/ sound in 
oa_max = 27.0556;
% F1  0 250 Density 0.18697
Freq = find(F>=0 & F<=250);
oa_F1_start = Freq(1);
oa_F1_end = Freq(end);
[oa_F1_range, x] = size(S(oa_F1_start:oa_F1_end, :));
oa_D1= 0.18697;
% F2  380 640 Density 0.68397
Freq = find(F>=380 & F<=640);
oa_F2_start = Freq(1);
oa_F2_end = Freq(end);
[oa_F2_range, x] = size(S(oa_F2_start:oa_F2_end, :));
oa_D2= 0.68397;
% F3  820 1150 Density 0.10169
Freq = find(F>=820 & F<=1150);
oa_F3_start = Freq(1);
oa_F3_end = Freq(end);
[oa_F3_range, x] = size(S(oa_F3_start:oa_F3_end, :));
oa_D3= 0.10169;
%-------------------------------------------------------
% /oo/ sound in 
oo_max = 15.7261;
% F1  0 500 Density 0.42036
Freq = find(F>=0 & F<=500);
oo_F1_start = Freq(1);
oo_F1_end = Freq(end);
[oo_F1_range, x] = size(S(oo_F1_start:oo_F1_end, :));
oo_D1= 0.42036;
% F2  780 1280 Density 0.076369
Freq = find(F>=780 & F<=1280);
oo_F2_start = Freq(1);
oo_F2_end = Freq(end);
[oo_F2_range, x] = size(S(oo_F2_start:oo_F2_end, :));
oo_D2= 0.076369;
%-------------------------------------------------------
% /u/ sound in 
u_max = 39.7584;
% F1  480 619 Density 0.4129
Freq = find(F>=480 & F<=619);
u_F1_start = Freq(1);
u_F1_end = Freq(end);
[u_F1_range, x] = size(S(u_F1_start:u_F1_end, :));
u_D1= 0.4129;
%-------------------------------------------------------
% /ue/ sound in 
ue_max = 14.7118;
% F1  0 520 Density 0.39369
Freq = find(F>=0 & F<=520);
ue_F1_start = Freq(1);
ue_F1_end = Freq(end);
[ue_F1_range, x] = size(S(ue_F1_start:ue_F1_end, :));
ue_D1= 0.39369;
% F2  840 1220 Density 0.084135
Freq = find(F>=840 & F<=1220);
ue_F2_start = Freq(1);
ue_F2_end = Freq(end);
[ue_F2_range, x] = size(S(ue_F2_start:ue_F2_end, :));
ue_D2= 0.084135;
%-------------------------------------------------------
% /oi/ sound in 
oi_max = 33.491;
% F1  190 800 Density 0.35884
Freq = find(F>=190 & F<=800);
oi_F1_start = Freq(1);
oi_F1_end = Freq(end);
[oi_F1_range, x] = size(S(oi_F1_start:oi_F1_end, :));
oi_D1= 0.35884;
%-------------------------------------------------------
% /ow/ sound in 
ow_max = 31.0747;
% F1  80 330 Density 0.15508
Freq = find(F>=80 & F<=330);
ow_F1_start = Freq(1);
ow_F1_end = Freq(end);
[ow_F1_range, x] = size(S(ow_F1_start:ow_F1_end, :));
ow_D1= 0.15508;
% F2  470 820 Density 0.35703
Freq = find(F>=470 & F<=820);
ow_F2_start = Freq(1);
ow_F2_end = Freq(end);
[ow_F2_range, x] = size(S(ow_F2_start:ow_F2_end, :));
ow_D2= 0.35703;
% F3  1100 1650 Density 0.096025
Freq = find(F>=1100 & F<=1650);
ow_F3_start = Freq(1);
ow_F3_end = Freq(end);
[ow_F3_range, x] = size(S(ow_F3_start:ow_F3_end, :));
ow_D3= 0.096025;
%-------------------------------------------------------
% /er/ sound in 
er_max = 35.1728;
% F1  0 240 Density 0.17503
Freq = find(F>=0 & F<=240);
er_F1_start = Freq(1);
er_F1_end = Freq(end);
[er_F1_range, x] = size(S(er_F1_start:er_F1_end, :));
er_D1= 0.17503;
% F2  330 700 Density 0.36422
Freq = find(F>=330 & F<=700);
er_F2_start = Freq(1);
er_F2_end = Freq(end);
[er_F2_range, x] = size(S(er_F2_start:er_F2_end, :));
er_D2= 0.36422;
% F3  1000 1460 Density 0.10868
Freq = find(F>=1000 & F<=1460);
er_F3_start = Freq(1);
er_F3_end = Freq(end);
[er_F3_range, x] = size(S(er_F3_start:er_F3_end, :));
er_D3= 0.10868;
%-------------------------------------------------------
% /air/ sound in 
air_max = 29.2938;
% F1  0 220 Density 0.17783
Freq = find(F>=0 & F<=220);
air_F1_start = Freq(1);
air_F1_end = Freq(end);
[air_F1_range, x] = size(S(air_F1_start:air_F1_end, :));
air_D1= 0.17783;
% F2  390 750 Density 0.47025
Freq = find(F>=390 & F<=750);
air_F2_start = Freq(1);
air_F2_end = Freq(end);
[air_F2_range, x] = size(S(air_F2_start:air_F2_end, :));
air_D2= 0.47025;
% F3  1500 1800 Density 0.14441
Freq = find(F>=1500 & F<=1800);
air_F3_start = Freq(1);
air_F3_end = Freq(end);
[air_F3_range, x] = size(S(air_F3_start:air_F3_end, :));
air_D3= 0.14441;
%-------------------------------------------------------
% /ar/ sound in 
ar_max = 25.8837;
% F1  0 220 Density 0.18838
Freq = find(F>=0 & F<=220);
ar_F1_start = Freq(1);
ar_F1_end = Freq(end);
[ar_F1_range, x] = size(S(ar_F1_start:ar_F1_end, :));
ar_D1= 0.18838;
% F2  320 700 Density 0.46275
Freq = find(F>=320 & F<=700);
ar_F2_start = Freq(1);
ar_F2_end = Freq(end);
[ar_F2_range, x] = size(S(ar_F2_start:ar_F2_end, :));
ar_D2= 0.46275;
% F3  980 1320 Density 0.13405
Freq = find(F>=980 & F<=1320);
ar_F3_start = Freq(1);
ar_F3_end = Freq(end);
[ar_F3_range, x] = size(S(ar_F3_start:ar_F3_end, :));
ar_D3= 0.13405;
%-------------------------------------------------------
% /ir/ sound in 
ir_max = 35.3763;
% F1  250 740 Density 0.40927
Freq = find(F>=250 & F<=740);
ir_F1_start = Freq(1);
ir_F1_end = Freq(end);
[ir_F1_range, x] = size(S(ir_F1_start:ir_F1_end, :));
ir_D1= 0.40927;
% F2  1000 1400 Density 0.087233
Freq = find(F>=1000 & F<=1400);
ir_F2_start = Freq(1);
ir_F2_end = Freq(end);
[ir_F2_range, x] = size(S(ir_F2_start:ir_F2_end, :));
ir_D2= 0.087233;
%-------------------------------------------------------
% /or/ sound in 
or_max = 40.0255;
% F1  260 640 Density 0.4318
Freq = find(F>=260 & F<=640);
or_F1_start = Freq(1);
or_F1_end = Freq(end);
[or_F1_range, x] = size(S(or_F1_start:or_F1_end, :));
or_D1= 0.4318;
% F2  840 1100 Density 0.096107
Freq = find(F>=840 & F<=1100);
or_F2_start = Freq(1);
or_F2_end = Freq(end);
[or_F2_range, x] = size(S(or_F2_start:or_F2_end, :));
or_D2= 0.096107;
%-------------------------------------------------------
% /ere/ sound in 
ere_max = 10.1402;
% F1  0 450 Density 0.30605
Freq = find(F>=0 & F<=450);
ere_F1_start = Freq(1);
ere_F1_end = Freq(end);
[ere_F1_range, x] = size(S(ere_F1_start:ere_F1_end, :));
ere_D1= 0.30605;
% F2  1930 2630 Density 0.042538
Freq = find(F>=1930 & F<=2630);
ere_F2_start = Freq(1);
ere_F2_end = Freq(end);
[ere_F2_range, x] = size(S(ere_F2_start:ere_F2_end, :));
ere_D2= 0.042538;
% F3  3330 3770 Density 0.021359
Freq = find(F>=3330 & F<=3770);
ere_F3_start = Freq(1);
ere_F3_end = Freq(end);
[ere_F3_range, x] = size(S(ere_F3_start:ere_F3_end, :));
ere_D3= 0.021359;
%-------------------------------------------------------
% /our/ sound in 
our_max = 40.4307;
% F1  120 550 Density 0.48024
Freq = find(F>=120 & F<=550);
our_F1_start = Freq(1);
our_F1_end = Freq(end);
[our_F1_range, x] = size(S(our_F1_start:our_F1_end, :));
our_D1= 0.48024;
% F2  676 1000 Density 0.13154
Freq = find(F>=676 & F<=1000);
our_F2_start = Freq(1);
our_F2_end = Freq(end);
[our_F2_range, x] = size(S(our_F2_start:our_F2_end, :));
our_D2= 0.13154;

% 
%% training model
[row,col] = size(S);
%modify to improve or reduce performance
window = 10;
Mod = 1;
percent = 0.8;
%----------------------------------------
overlap = percent * window;
string = [];
trigger = 0;
phonemes = false(44,1);
%{ 
    list the phonemes order
%}
for i = 1:window-overlap:col-window-1
    % storing window of time we are comparing to phonemes
    temp = abs(S(:,i:i+window-1));
    % normalizing the window we selected.
    tempmax = max(temp,[],'all');
    if tempmax <= 0.01
        %eliminate noise
        temp = temp * 0;
    end
    temp = temp/tempmax;
    % summing the values into by frequency
    temp = sum(temp,2);
    
    %goes into if statements to see if avg matches stored avg for a
    %corresponding phoneme
    if (((sum(temp(b_F1_start:b_F1_end))/(b_F1_range*window)) >= b_D1*(b_max/tempmax)) && ...
        ((sum(temp(b_F2_start:b_F2_end))/(b_F2_range*window)) >= b_D2*(b_max/tempmax)))
        if(phonemes(1) == false)
            string = [string "b"];
            phonemes = false(44,1);
            phonemes(1) = true;
            disp([i "b"]);
        end
        %disp([i "b"]);
        trigger = trigger+1;
   elseif (((sum(temp(d_F1_start:d_F1_end))/(d_F1_range*window)) >= d_D1*(d_max/tempmax)) && ...
           ((sum(temp(d_F2_start:d_F2_end))/(d_F2_range*window)) >= d_D2*(d_max/tempmax)) && ...
           ((sum(temp(d_F3_start:d_F3_end))/(d_F3_range*window)) >= d_D3*(d_max/tempmax)))
        if(phonemes(2) == false)
            string = [string "d"];
            phonemes = false(44,1);
            phonemes(2) = true;
            disp([i "d"]);
        end
        %disp([i "d"]);
        trigger = trigger+1;
    elseif (((sum(temp(f_F1_start:f_F1_end))/(f_F1_range*window)) >= f_D1*(f_max/tempmax)) && ...
            ((sum(temp(f_F2_start:f_F2_end))/(f_F2_range*window)) >= f_D2*(f_max/tempmax)))
        if(phonemes(3) == false)
            string = [string "f"];
            phonemes = false(44,1);
            phonemes(3) = true;
            disp([i "f"]);
        end
        %disp([i "f"]);
        trigger = trigger+1;
    
    elseif (((sum(temp(g_F1_start:g_F1_end))/(g_F1_range*window)) >= g_D1*(g_max/tempmax)) && ...
            ((sum(temp(g_F2_start:g_F2_end))/(g_F2_range*window)) >= g_D2*(g_max/tempmax)))
        if(phonemes(4) == false)
            string = [string "g"];
            phonemes = false(44,1);
            phonemes(4) = true;
            disp([i "g"]);
        end
        %disp([i "g"]);
        trigger = trigger+1;  
    elseif (((sum(temp(h_F1_start:h_F1_end))/(h_F1_range*window)) >= h_D1*(h_max/tempmax)) && ...
            ((sum(temp(h_F2_start:h_F2_end))/(h_F2_range*window)) >= h_D2*(h_max/tempmax)))
        if(phonemes(5) == false)
            string = [string "h"];
            phonemes = false(44,1);
            phonemes(5) = true;
            disp([i "h"]);
        end
        %disp([i "h"]);
        trigger = trigger+1;
    elseif (((sum(temp(dj_F1_start:dj_F1_end))/(dj_F1_range*window)) >= dj_D1*(dj_max/tempmax)) && ...
            ((sum(temp(dj_F2_start:dj_F2_end))/(dj_F2_range*window)) >= dj_D2*(dj_max/tempmax)) && ...
            ((sum(temp(dj_F3_start:dj_F3_end))/(dj_F3_range*window)) >= dj_D3*(dj_max/tempmax)))
        if(phonemes(6) == false)
            string = [string "dʒ"];
            phonemes = false(44,1);
            phonemes(6) = true;
            disp([i "dʒ"]);
        end
        %disp([i "dʒ"]);
        trigger = trigger+1;
    elseif (((sum(temp(k_F1_start:k_F1_end))/(k_F1_range*window)) >= k_D1*(k_max/tempmax)) && ...
            ((sum(temp(k_F2_start:k_F2_end))/(k_F2_range*window)) >= k_D2*(k_max/tempmax)) && ...
            ((sum(temp(k_F3_start:k_F3_end))/(k_F3_range*window)) >= k_D3*(k_max/tempmax)))
        if(phonemes(7) == false)
            string = [string "k"];
            phonemes = false(44,1);
            phonemes(7) = true;
            disp([i "k"]);
        end
        %disp([i "k"]);
        trigger = trigger+1;   
    elseif (((sum(temp(l_F1_start:l_F1_end))/(l_F1_range*window)) >= l_D1*(l_max/tempmax)) && ...
            ((sum(temp(l_F2_start:l_F2_end))/(l_F2_range*window)) >= l_D2*(l_max/tempmax)) && ...
            ((sum(temp(l_F3_start:l_F3_end))/(l_F3_range*window)) >= l_D3*(l_max/tempmax)) && ...
            ((sum(temp(l_F4_start:l_F4_end))/(l_F4_range*window)) >= l_D4*(l_max/tempmax)))
        if(phonemes(8) == false)
            string = [string "l"];
            phonemes = false(44,1);
            phonemes(8) = true;
            disp([i "l"]);
        end
        %disp([i "l"]);
        trigger = trigger+1;
    elseif (((sum(temp(m_F1_start:m_F1_end))/(m_F1_range*window)) >= m_D1*(l_max/tempmax)) && ...
            ((sum(temp(m_F2_start:m_F2_end))/(m_F2_range*window)) >= m_D2*(l_max/tempmax)) && ...
            ((sum(temp(m_F3_start:m_F3_end))/(m_F3_range*window)) >= m_D3*(l_max/tempmax)) && ...
            ((sum(temp(m_F4_start:m_F4_end))/(m_F4_range*window)) >= m_D4*(l_max/tempmax)))
        if(phonemes(9) == false)
            string = [string "m"];
            phonemes = false(44,1);
            phonemes(9) = true;
            disp([i "m"]);
        end
        %disp([i "m"]);
        trigger = trigger+1;
    elseif (((sum(temp(n_F1_start:n_F1_end))/(n_F1_range*window)) >= n_D1*(n_max/tempmax)) && ...
            ((sum(temp(n_F2_start:n_F2_end))/(n_F2_range*window)) >= n_D2*(n_max/tempmax)) && ...
            ((sum(temp(n_F3_start:n_F3_end))/(n_F3_range*window)) >= n_D3*(n_max/tempmax)) && ...
            ((sum(temp(n_F4_start:n_F4_end))/(n_F4_range*window)) >= n_D4*(n_max/tempmax)))
        if(phonemes(10) == false)
            string = [string "n"];
            phonemes = false(44,1);
            phonemes(10) = true;
            disp([i "n"]);
        end
        %disp([i "n"]);
        trigger = trigger+1;
   elseif (((sum(temp(p_F1_start:p_F1_end))/(p_F1_range*window)) >= p_D1*(p_max/tempmax)))
        if(phonemes(11) == false)
            string = [string "p"];
            phonemes = false(44,1);
            phonemes(11) = true;
            disp([i "p"]);
        end
        %disp([i "p"]);
        trigger = trigger+1;
    elseif (((sum(temp(r_F1_start:r_F1_end))/(r_F1_range*window)) >= r_D1*(r_max/tempmax)) && ...
            ((sum(temp(r_F2_start:r_F2_end))/(r_F2_range*window)) >= r_D2*(r_max/tempmax)))
        if(phonemes(12) == false)
            string = [string "r"];
            phonemes = false(44,1);
            phonemes(12) = true;
            disp([i "r"]);
        end
        %disp([i "r"]);
        trigger = trigger+1;
    elseif (((sum(temp(s_F1_start:s_F1_end))/(s_F1_range*window)) >= s_D1*(s_max/tempmax)) && ...
            ((sum(temp(s_F2_start:s_F2_end))/(s_F2_range*window)) >= s_D2*(s_max/tempmax)) && ...
            ((sum(temp(s_F3_start:s_F3_end))/(s_F3_range*window)) >= s_D3*(s_max/tempmax)))
        if(phonemes(13) == false)
            string = [string "s"];
            phonemes = false(44,1);
            phonemes(13) = true;
            disp([i "s"]);
        end
        %disp([i "s"]);
        trigger = trigger+1;    
   elseif (((sum(temp(t_F1_start:t_F1_end))/(t_F1_range*window)) >= t_D1*(t_max/tempmax)) && ...
           ((sum(temp(t_F2_start:t_F2_end))/(t_F2_range*window)) >= t_D2*(t_max/tempmax)))
        if(phonemes(14) == false)
            string = [string "t"];
            phonemes = false(44,1);
            phonemes(14) = true;
            disp([i "t"]);
        end
        %disp([i "t"]);
        trigger = trigger+1;     
    elseif (((sum(temp(v_F1_start:v_F1_end))/(v_F1_range*window)) >= v_D1*(v_max/tempmax)) && ...
            ((sum(temp(v_F2_start:v_F2_end))/(v_F2_range*window)) >= v_D2*(v_max/tempmax)))
        if(phonemes(15) == false)
            string = [string "v"];
            phonemes = false(44,1);
            phonemes(15) = true;
            disp([i "v"]);
        end
        %disp([i "v"]);
        trigger = trigger+1;
    elseif (((sum(temp(w_F1_start:w_F1_end))/(w_F1_range*window)) >= w_D1*(w_max/tempmax)))
        if(phonemes(16) == false)
            string = [string "w"];
            phonemes = false(44,1);
            phonemes(16) = true;
            disp([i "w"]);
        end
        %disp([i "w"]);
        trigger = trigger+1;
   elseif (((sum(temp(z_F1_start:z_F1_end))/(z_F1_range*window)) >= z_D1*(z_max/tempmax)) && ...
           ((sum(temp(z_F2_start:z_F2_end))/(z_F2_range*window)) >= z_D2*(z_max/tempmax)))
        if(phonemes(17) == false)
            string = [string "z"];
            phonemes = false(44,1);
            phonemes(17) = true;
            disp([i "z"]);
        end
        %disp([i "z"]);
        trigger = trigger+1;    
    elseif (((sum(temp(si_F1_start:si_F1_end))/(si_F1_range*window)) >= si_D1*(si_max/tempmax)) && ...
            ((sum(temp(si_F2_start:si_F2_end))/(si_F2_range*window)) >= si_D2*(si_max/tempmax)) && ...
            ((sum(temp(si_F3_start:si_F3_end))/(si_F3_range*window)) >= si_D3*(si_max/tempmax)))
        if(phonemes(18) == false)
            string = [string "ʒ"];
            phonemes = false(44,1);
            phonemes(18) = true;
            disp([i "ʒ"]);
        end
        %disp([i "ʒ"]);
        trigger = trigger+1;   
    elseif (((sum(temp(ch_F1_start:ch_F1_end))/(ch_F1_range*window)) >= ch_D1*(ch_max/tempmax)) && ...
            ((sum(temp(ch_F2_start:ch_F2_end))/(ch_F2_range*window)) >= ch_D2*(ch_max/tempmax)) && ...
            ((sum(temp(ch_F3_start:ch_F3_end))/(ch_F3_range*window)) >= ch_D3*(ch_max/tempmax)))
        if(phonemes(19) == false)
            string = [string "tʃ"];
            phonemes = false(44,1);
            phonemes(19) = true;
            disp([i "tʃ"]);
        end
        %disp([i "tʃ"]);
        trigger = trigger+1;   
    elseif (((sum(temp(sh_F1_start:sh_F1_end))/(sh_F1_range*window)) >= sh_D1*(sh_max/tempmax)) && ...
            ((sum(temp(sh_F2_start:sh_F2_end))/(sh_F2_range*window)) >= sh_D2*(sh_max/tempmax)) && ...
            ((sum(temp(sh_F3_start:sh_F3_end))/(sh_F3_range*window)) >= sh_D3*(sh_max/tempmax)))
        if(phonemes(20) == false)
            string = [string "ʃ"];
            phonemes = false(44,1);
            phonemes(20) = true;
            disp([i "ʃ"]);
        end
        %disp([i "ʃ"]);
        trigger = trigger+1;   
    elseif (((sum(temp(th_F1_start:th_F1_end))/(th_F1_range*window)) >= th_D1*(th_max/tempmax)) && ...
            ((sum(temp(th_F2_start:th_F2_end))/(th_F2_range*window)) >= th_D2*(th_max/tempmax)) && ...
            ((sum(temp(th_F3_start:th_F3_end))/(th_F3_range*window)) >= th_D3*(th_max/tempmax)))
        if(phonemes(21) == false)
            string = [string "θ"];
            phonemes = false(44,1);
            phonemes(21) = true;
            disp([i "θ"]);
        end
        %disp([i "θ"]);
        trigger = trigger+1;   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% th #22 ð %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    elseif (((sum(temp(ng_F1_start:ng_F1_end))/(ng_F1_range*window)) >= ng_D1*(ng_max/tempmax)) && ...
            ((sum(temp(ng_F2_start:ng_F2_end))/(ng_F2_range*window)) >= ng_D2*(ng_max/tempmax)) && ...
            ((sum(temp(ng_F3_start:ng_F3_end))/(ng_F3_range*window)) >= ng_D3*(ng_max/tempmax)))
        if(phonemes(23) == false)
            string = [string "ŋ"];
            phonemes = false(44,1);
            phonemes(23) = true;
            disp([i "ŋ"]);
        end
        %disp([i "ŋ"]);
        trigger = trigger+1;   
    elseif (((sum(temp(y_F1_start:y_F1_end))/(y_F1_range*window)) >= y_D1*(y_max/tempmax)) && ...
            ((sum(temp(y_F2_start:y_F2_end))/(y_F2_range*window)) >= y_D2*(y_max/tempmax)) && ...
            ((sum(temp(y_F3_start:y_F3_end))/(y_F3_range*window)) >= y_D3*(y_max/tempmax)))
        if(phonemes(24) == false)
            string = [string "j"];
            phonemes = false(44,1);
            phonemes(24) = true;
            disp([i "j"]);
        end
        %disp([i "j"]);
        trigger = trigger+1;   
    elseif (((sum(temp(ae_F1_start:ae_F1_end))/(ae_F1_range*window)) >= ae_D1*(ae_max/tempmax)) && ...
            ((sum(temp(ae_F2_start:ae_F2_end))/(ae_F2_range*window)) >= ae_D2*(ae_max/tempmax)) && ...
            ((sum(temp(ae_F3_start:ae_F3_end))/(ae_F3_range*window)) >= ae_D3*(ae_max/tempmax)))
        if(phonemes(25) == false)
            string = [string "æ"];
            phonemes = false(44,1);
            phonemes(25) = true;
            disp([i "æ"]);
        end
        %disp([i "æ"]);
        trigger = trigger+1;   
    elseif (((sum(temp(eI_F1_start:eI_F1_end))/(eI_F1_range*window)) >= eI_D1*(eI_max/tempmax)) && ...
            ((sum(temp(eI_F2_start:eI_F2_end))/(eI_F2_range*window)) >= eI_D2*(eI_max/tempmax)))
        if(phonemes(26) == false)
            string = [string "eɪ"];
            phonemes = false(44,1);
            phonemes(26) = true;
            disp([i "eɪ"]);
        end
        %disp([i "eɪ"]);
        trigger = trigger+1;   
    elseif (((sum(temp(e_F1_start:e_F1_end))/(e_F1_range*window)) >= e_D1*(e_max/tempmax)) && ...
            ((sum(temp(e_F2_start:e_F2_end))/(e_F2_range*window)) >= e_D2*(e_max/tempmax)) && ...
            ((sum(temp(e_F3_start:e_F3_end))/(e_F3_range*window)) >= e_D3*(e_max/tempmax)))
        if(phonemes(27) == false)
            string = [string "e"];
            phonemes = false(44,1);
            phonemes(27) = true;
            disp([i "e"]);
        end
        %disp([i "e"]);
        trigger = trigger+1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      % i: missing 
      % phonemes(28)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%     elseif (((sum(temp(I_F1_start:I_F1_end))/(I_F1_range*window)) >= I_D1*(I_max/tempmax)) && ...
%             ((sum(temp(I_F2_start:I_F2_end))/(I_F2_range*window)) >= I_D2*(I_max/tempmax)) && ...
%             ((sum(temp(I_F3_start:I_F3_end))/(I_F3_range*window)) >= I_D3*(I_max/tempmax)))
%         if(phonemes(29) == false)
%             string = [string "ɪ"];
%             phonemes = false(44,1);
%             phonemes(29) = true;
%             disp([i "ɪ"]);
%         end
%         %disp([i "ɪ"]);
%         trigger = trigger+1;
    elseif (((sum(temp(aI_F1_start:aI_F1_end))/(aI_F1_range*window)) >= aI_D1*(aI_max/tempmax)) && ...
            ((sum(temp(aI_F2_start:aI_F2_end))/(aI_F2_range*window)) >= aI_D2*(aI_max/tempmax)) && ...
            ((sum(temp(aI_F3_start:aI_F3_end))/(aI_F3_range*window)) >= aI_D3*(aI_max/tempmax)))
        if(phonemes(30) == false)
            string = [string "aɪ"];
            phonemes = false(44,1);
            phonemes(30) = true;
            disp([i "aɪ"]);
        end
        %disp([i "aɪ"]);
        trigger = trigger+1;
    elseif (((sum(temp(au_F1_start:au_F1_end))/(au_F1_range*window)) >= au_D1*(au_max/tempmax)) && ...
            ((sum(temp(au_F2_start:au_F2_end))/(au_F2_range*window)) >= au_D2*(au_max/tempmax)) && ...
            ((sum(temp(au_F3_start:au_F3_end))/(au_F3_range*window)) >= au_D3*(au_max/tempmax)))
        if(phonemes(31) == false)
            string = [string "ɒ"];
            phonemes = false(44,1);
            phonemes(31) = true;
            disp([i "ɒ"]);
        end
        %disp([i "ɒ"]);
        trigger = trigger+1;
    elseif (((sum(temp(oa_F1_start:oa_F1_end))/(oa_F1_range*window)) >= oa_D1*(oa_max/tempmax)) && ...
            ((sum(temp(oa_F2_start:oa_F2_end))/(oa_F2_range*window)) >= oa_D2*(oa_max/tempmax)) && ...
            ((sum(temp(oa_F3_start:oa_F3_end))/(oa_F3_range*window)) >= oa_D3*(oa_max/tempmax)))
        if(phonemes(32) == false)
            string = [string "oʊ"];
            phonemes = false(44,1);
            phonemes(32) = true;
            disp([i "oʊ"]);
        end
        %disp([i "oʊ"]);
        trigger = trigger+1;
    elseif (((sum(temp(oo_F1_start:oo_F1_end))/(oo_F1_range*window)) >= oo_D1*(oo_max/tempmax)) && ...
            ((sum(temp(oo_F2_start:oo_F2_end))/(oo_F2_range*window)) >= oo_D2*(oo_max/tempmax)))
        if(phonemes(33) == false)
            string = [string "ʊ"];
            phonemes = false(44,1);
            phonemes(33) = true;
            disp([i "ʊ"]);
        end
        %disp([i "oʊ"]);
        trigger = trigger+1;
    elseif (((sum(temp(u_F1_start:u_F1_end))/(u_F1_range*window)) >= u_D1*(u_max/tempmax)))
        if(phonemes(34) == false)
            string = [string "ʌ"];
            phonemes = false(44,1);
            phonemes(34) = true;
            disp([i "ʌ"]);
        end
        %disp([i "ʌ"]);
        trigger = trigger+1;
    elseif (((sum(temp(ue_F1_start:ue_F1_end))/(ue_F1_range*window)) >= ue_D1*(ue_max/tempmax)) && ...
            ((sum(temp(ue_F2_start:ue_F2_end))/(ue_F2_range*window)) >= ue_D2*(ue_max/tempmax)))
        if(phonemes(35) == false)
            string = [string "u:"];
            phonemes = false(44,1);
            phonemes(35) = true;
            disp([i "u:"]);
        end
        %disp([i "u:"]);
        trigger = trigger+1;
    elseif (((sum(temp(oi_F1_start:oi_F1_end))/(oi_F1_range*window)) >= oi_D1*(oi_max/tempmax)))
        if(phonemes(36) == false)
            string = [string "ɔɪ"];
            phonemes = false(44,1);
            phonemes(36) = true;
            disp([i "ɔɪ"]);
        end
        %disp([i "ɔɪ"]);
        trigger = trigger+1;
    elseif (((sum(temp(ow_F1_start:ow_F1_end))/(ow_F1_range*window)) >= ow_D1*(ow_max/tempmax)) && ...
            ((sum(temp(ow_F2_start:ow_F2_end))/(ow_F2_range*window)) >= ow_D2*(ow_max/tempmax)) && ...
            ((sum(temp(ow_F3_start:ow_F3_end))/(ow_F3_range*window)) >= ow_D3*(ow_max/tempmax)))
        if(phonemes(37) == false)
            string = [string "aʊ"];
            phonemes = false(44,1);
            phonemes(37) = true;
            disp([i "aʊ"]);
        end
        %disp([i "aʊ"]);
        trigger = trigger+1;
    elseif (((sum(temp(er_F1_start:er_F1_end))/(er_F1_range*window)) >= er_D1*(er_max/tempmax)) && ...
            ((sum(temp(er_F2_start:er_F2_end))/(er_F2_range*window)) >= er_D2*(er_max/tempmax)) && ...
            ((sum(temp(er_F3_start:er_F3_end))/(er_F3_range*window)) >= er_D3*(er_max/tempmax)))
        if(phonemes(38) == false)
            string = [string "ə"];
            phonemes = false(44,1);
            phonemes(38) = true;
            disp([i "ə"]);
        end
        %disp([i "ə"]);
        trigger = trigger+1;
    elseif (((sum(temp(air_F1_start:air_F1_end))/(air_F1_range*window)) >= air_D1*(air_max/tempmax)) && ...
            ((sum(temp(air_F2_start:air_F2_end))/(air_F2_range*window)) >= air_D2*(air_max/tempmax)) && ...
            ((sum(temp(air_F3_start:air_F3_end))/(air_F3_range*window)) >= air_D3*(air_max/tempmax)))
        if(phonemes(39) == false)
            string = [string "eəʳ"];
            phonemes = false(44,1);
            phonemes(39) = true;
            disp([i "eəʳ"]);
        end
        %disp([i "eəʳ"]);
        trigger = trigger+1;
    elseif (((sum(temp(ar_F1_start:ar_F1_end))/(ar_F1_range*window)) >= ar_D1*(ar_max/tempmax)) && ...
            ((sum(temp(ar_F2_start:ar_F2_end))/(ar_F2_range*window)) >= ar_D2*(ar_max/tempmax)) && ...
            ((sum(temp(ar_F3_start:ar_F3_end))/(ar_F3_range*window)) >= ar_D3*(ar_max/tempmax)))
        if(phonemes(40) == false)
            string = [string "ɑ:"];
            phonemes = false(44,1);
            phonemes(40) = true;
            disp([i "ɑ:"]);
        end
        %disp([i "ɑ:"]);
        trigger = trigger+1;
    elseif (((sum(temp(ir_F1_start:ir_F1_end))/(ir_F1_range*window)) >= ir_D1*(ir_max/tempmax)) && ...
            ((sum(temp(ir_F2_start:ir_F2_end))/(ir_F2_range*window)) >= ir_D2*(ir_max/tempmax)))
        if(phonemes(41) == false)
            string = [string "ɜ:ʳ"];
            phonemes = false(44,1);
            phonemes(41) = true;
            disp([i "ɜ:ʳ"]);
        end
        %disp([i "ɜ:ʳ"]);
        trigger = trigger+1;
    elseif (((sum(temp(or_F1_start:or_F1_end))/(or_F1_range*window)) >= or_D1*(or_max/tempmax)) && ...
            ((sum(temp(or_F2_start:or_F2_end))/(or_F2_range*window)) >= or_D2*(or_max/tempmax)))
        if(phonemes(42) == false)
            string = [string "ɔ:"];
            phonemes = false(44,1);
            phonemes(42) = true;
            disp([i "ɔ:"]);
        end
        %disp([i "ɔ:"]);
        trigger = trigger+1;
    elseif (((sum(temp(ere_F1_start:ere_F1_end))/(ere_F1_range*window)) >= ere_D1*(ere_max/tempmax)) && ...
            ((sum(temp(ere_F2_start:ere_F2_end))/(ere_F2_range*window)) >= ere_D2*(ere_max/tempmax)) && ...
            ((sum(temp(ere_F3_start:ere_F3_end))/(ere_F3_range*window)) >= ere_D3*(ere_max/tempmax)))
        if(phonemes(43) == false)
            string = [string "ɪəʳ"];
            phonemes = false(44,1);
            phonemes(43) = true;
            disp([i "ɪəʳ"]);
        end
        %disp([i "ɪəʳ"]);
        trigger = trigger+1;
    elseif (((sum(temp(our_F1_start:our_F1_end))/(our_F1_range*window)) >= our_D1*(our_max/tempmax)) && ...
            ((sum(temp(our_F2_start:our_F2_end))/(our_F2_range*window)) >= our_D2*(our_max/tempmax)) && ...
            ((sum(temp(our_F3_start:our_F3_end))/(our_F3_range*window)) >= our_D3*(our_max/tempmax)))
        if(phonemes(44) == false)
            string = [string "ʊəʳ"];
            phonemes = false(44,1);
            phonemes(44) = true;
            disp([i "ʊəʳ"]);
        end
        %disp([i "ʊəʳ"]);
        trigger = trigger+1;
    end
    
end

trigger
string