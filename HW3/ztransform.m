function F = ztransform(f, z)

% Initialize F with n = 0 term

F = ones(length(z))*f(0);

% Create partial z sum from n=-500 to 500

for n=1:500
    F = F + f(n).*(z.^-n) + f(-n).*(z.^n);
end

