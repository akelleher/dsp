function coeffs = singlepolecascade(params)

N = length(params);

if length(unique(params))~=N
    error('Transfer function has repeated poles.');
end

% Initialize NxN matrix for linear system

A = zeros(N);

% Fill in each column of A, based on corresponding product of terms

for i=1:N
    product = 1;
    %A(:,i) = param(N)
    for j = 1:N
        if i~=j
            product = product * (params(i)-params(j));
        end
    end
    A(i,i) = product;
end


% Determine right-hand side

rhs = (params.^(length(params)-1)).';

% Solve linear system to get coefficients
%coeffs = rhs;
coeffs = A\rhs;