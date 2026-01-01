
% Script for ensemble average in class exercise
% Looking for brain's response to auditory stimulus
% Recording begins, step input sound played 250ms into the recording for 1
% second
% 100 trials

clear all;
close all;

load ensemble_data-1.mat
dt = 1.25/250;
y1 = data(:, 1); % brain's response during trial 1

L = 250;
k = [1 : L];
t = (k-1)*dt;
tact = t - 0.25;

plot(tact, y1);

y = data(:, [1, 11, 21]);
plot(tact, y);
xlabel('time (s)')
ylabel('amplitude of response on trials 1, 11, 21 (V)')

ym = mean(data(:, :), 2);
figure;
plot(tact, ym);
xlabel('time (s)')
ylabel('amplitude of ensemble average response (V)')
hold on;
plot(tact, ym + std(data, 0, 2), '--');
plot(tact, ym - std(data, 0, 2), '--');
legend('ens. avg.', '+1 std. dev.', '-1 std. dev.');


%ybase = mean(ym(
%ymax = max(ym);

ybase = 0;
ymax = 0.97;

y10 = (ymax - ybase)*0.10 + ybase;
y90 = (ymax - ybase)*0.90 + ybase;

t10 =  tact(sum(ym < y10));
t90 =  tact(sum(ym < y90));



