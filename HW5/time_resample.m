function tout = time_resample(tin,factor);
x = 1:length(tin);
% Create the longer time vector using interp1
tout = interp1(x, tin, 1:1/factor:length(tin));

% Remove end values from tout that are inaccurate, if necessary
%tout(...) = [];