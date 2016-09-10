function y = harmonics(t, f0, harmamps, harmphase);

% Initialize y to 0
y = zeros(size(t));

if nargin<4  % phase is the same (0) for all harmonics
    harmphase = zeros(size(harmamps));
end

% Loop over harmonics, adding weighted versions to y
for i=1:length(harmamps)
    y = y+...
end

% Normalize maximum amplitude to 0.95 so that 
% sound(y,fs) doesn't get distorted
y = y/max(y(:))*0.95;