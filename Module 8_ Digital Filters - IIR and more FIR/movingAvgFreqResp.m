%% Find magnitude response of the moving aveage filter


% Numerator coefficients
B = ones(1, 7);

% Denominator coefficients
A = [1];

% Find freq response
Nfft = 2^10;
[H] = freqz(B, A, Nfft);
W1 = [0:(Nfft-1)]*pi/Nfft;

%% View magnitude response
plot(W, abs(H));
hold on;
plot(W1, abs(H));


