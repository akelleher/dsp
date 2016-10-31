function w = radix2fft(v);

% v should be a length-N column vector

N = length(v);

if ~isequal(unique(factor(N)),2)
    error('N is not a power of 2!');
end

if N == 2
    % Compute length-2 DFT directly (it's super simple)
    w = ...
else
    % Split input vector into even and odd parts
    v_even = ...
    v_odd = ...
    
    % Take radix 2 FFT of each part
    w_even = ...
    w_odd = ...
    
    % Recombine length N/2 results into length N result
    w = ...
end
   
