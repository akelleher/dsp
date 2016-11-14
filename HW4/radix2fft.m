function w = radix2fft(v);

% v should be a length-N column vector

N = length(v);

if ~isequal(unique(factor(N)),2)
    error('N is not a power of 2!');
end
v_trans = v.'
if N == 2
    % Compute length-2 DFT directly (it's super simple)
    w = [v_trans(1), -v_trans(2)].'
else
    % Split input vector into even and odd parts
    v_even = v_trans(2:2:N)
    v_odd = v_trans(1:2:N)
    k = 0:N-1;
    % Take radix 2 FFT of each part
    w_even = radix2fft(v_even.').';
    w_odd = (radix2fft(v_odd.').')
    
    % Recombine length N/2 results into length N result
    w = ([w_even+w_odd, w_even-w_odd].*exp(-2*pi*1i*k/N)).'
end
   
