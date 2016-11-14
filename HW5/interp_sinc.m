function [tout,yout] = interp_sinc(tin,yin,factor);

% Create the longer time vector (see Problem 5.1)
tout = time_resample(tin,factor);

% Initialize the output vector
yinit = zeros(size(tout));
yinit(1:factor:end) = yin;

% Create the sinc function that will be used to filter the
% zero-interpolated sample values.  
sinctime = -50:1/factor:50;
sincfilt = sinc(sinctime);

% Filter the signal with the sinc function; make sure that the time samples
% and signal samples are aligned (i.e., the interpolated signal matches the
% original samples at the correct points).

ytemp = conv(sincfilt,yinit);
trim_length = (50*factor);
yout = ytemp((trim_length+1):(length(ytemp)-trim_length));

% Zero out interpolated samples at the beginning and end 
% that we know are inaccurate

%yout(...) = 0;
