function yout = rationalresample(yin,I,D)

tin = 1:1/fs:length(yin);
% Upsample the input by I

[tup, yup] = interp_sinc(tin, yin, I);

% Create FFT of upsampled signal

F = fft(yup);

% Create ideal lowpass filter in the frequency domain

w = floor(length(fft)/4);
remainder = length(fft)-w;

H = [ones(1, w), zeros(1, remainder), ones(1,w)];

% Product in frequency domain

G = F.*H

% Inverse FFT

g = ifft(G);

% Ensure output is real

g = real(g);

% Downsample by D

%yout = ...