function F = dtft(f,T,N,w)
%f - function to be sampled
%T - sampling period
%N - number of samples either side of zero
%w - vector of frequencies at which to sample DTFT
transform = fft(f, 
% Evaluate the DTFT sum directly for each of the w samples
for i=1:length(w)
    F(i) = 0;
    for n=-N:N
        F(i) = F(i) + fft()
    end
end

% Plot the normalized DTFT magnitude 
Fnorm = abs(F)*T;
plot(w, Fnorm);

% Scale the y axis to go from 0 to the max value
set(gca, 'ylim', [0 max(Fnorm(:))])