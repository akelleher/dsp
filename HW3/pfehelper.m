function [C1,C2,r,w0] = pfehelper(b,a);

% Compute roots of denominator

p = roots(a);

% Error checking

if all(isreal(p))
    error('Transfer function has real roots.');
elseif (length(b)~=2) | (length(a)~=3)
    error('Transfer numerator/denominator is wrong length.');
end

% Compute r and w0

r = sqrt(a(3));
w0 = acos(-a(2)/(2*r));

% Compute C1 and C2 (C1 is the cosine term, C2 the sine term)

C1 = b(1);
C2 = (C1*r*cos(w0)+b(2))/(r*sin(w0));

