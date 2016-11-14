function [tout,yout] = interp_linear(tin,yin,factor);

% Create the longer time vector (see Problem 5.1)
tout = time_resample(tin, factor);

% Linear interpolation using interp1
yout = interp1(tin, yin, tout);
