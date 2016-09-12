function [t,e] = envelope(fs,a,d,s,dur,r)

% In each phase of the signal, determine the corresponding piece of time vector and envelope.

% Attack: signal linearly increases from 0 to 1 in a seconds
t = 0:1/fs:a-1/fs;
e = interp1([0 a-1/fs], [0 1], t);
    
% Decay: signal linearly decreases from 1 to s in d seconds
tdelay = a:1/fs:(a+d-1/fs); 
t = [t, tdelay];
e = [e, interp1([a a+d-1/fs],[1 s], tdelay )];

% Sustain: signal stays at s for dur seconds
tsustain = (a+d):1/fs:(a+d+dur-1/fs);
esustain = ones(size(tsustain));
esustain = esustain .* s;
t = [t, tsustain];
e = [e, esustain];

% Release: signal linearly decreases from s to 0 in r seconds
trelease = (a+d+dur):1/fs:(a+d+dur+r-1/fs);
t = [t, trelease];
e = [e, interp1([0 r-1/fs], [s 0], trelease)];
