close all; 
clear 

%%% Demo of convolution
n = -5:15;
n0 = find(n==0);
lneg = sum(n<0); % length of negative time-axis (n-axis)
lpos = sum(n>=0);

% %% Example 1
% pw = 5; % pulse width
% h = [zeros(1,lneg) ones(1,pw) zeros(1,lpos-pw)];
% x = [zeros(1,lneg) ones(1,7) zeros(1, lpos-7)];

% %% Example 2
pw = 7; % pulse width
h = [zeros(1,lneg) ones(1,pw) zeros(1,lpos-pw)];
x = [zeros(1,lneg) ones(1,3) 2/3 1/3 zeros(1, lpos-5)];


%%
subplot(3,1,1);
stem(n, h);
set(gca,'FontSize', 14);
ylabel('h[n]');
%hold on;
%plot(n, h, 'k--');

subplot(3,1,2);
stem(n, x); %hold on;
set(gca,'FontSize', 14);
ylabel('x[n]');
%plot(n, x, 'k--');

pause;
figure;
subplot(3,1,1);
stem(n, h);
%axis([n(1) n(end) -0.1 1.1]);
set(gca,'FontSize', 14);
ylabel('h[i]');
%hold on;
%plot(n, h, 'k--');

i0 = length(n) - find(n==0) + 1; %index for n = 0 when flipped;
y = zeros(1,length(n));
xflip = x(end:-1:1); % x[-i]

for k = n(1):n(end), %0:lpos-1,
subplot(3,1,2);
%xkmini = [zeros(1, max([lneg+k-i0+1],0)) ...
%    xflip(i0 - (lneg + k):min(end,i0+lpos-k)) ...
%    zeros(1, lpos-(length(xflip)-i0+1+k))]; % x[k-i]
xkmini = [zeros(1, max([lneg+k-i0],0)) ...
    xflip(max(1, i0 - (lneg + k)):min(end,i0+lpos-k)) ...
    zeros(1, lpos-(length(xflip)-i0+1+k))]; % x[k-i]
stem(n, xkmini);
set(gca,'FontSize', 14);
ylabel('x[k-i]');
axis([n(1) n(end) min(x) 1.1*max(x)]);
%stem(n, [x(k+i0+lneg:-1:k+));
subplot(3,1,3)
y(n0+k) = xkmini*h';
stem(n, y);
set(gca,'FontSize', 14);
ylabel('y[k]');
xlabel('k');
%axis([n(1) n(end) -0.1 1.1*(x*h')]);
pause
end

