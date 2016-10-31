function w = directdft(v)

% v should be a length-N column vector

N = length(v);

% create N x N DFT matrix

[X,Y] = meshgrid(0:N-1, 0:N-1);

F = exp(-2*pi*1i*(X.*Y)/N);

% compute w using a matrix-vector product

w = F*v;