function [t,e] = envelope(fs,a,d,s,dur,r)

% In each phase of the signal, determine the corresponding piece of time vector and envelope.

% Attack: signal linearly increases from 0 to 1 in a seconds
t = 0:1/fs:a;
e = interp1([0 a], [0 1], t);
    
% Decay: signal linearly decreases from 1 to s in d seconds
tdelay = 0:1/fs:(d-1/fs); 
t = [t, tdelay];
e = [e, interp1([0 d],[1 s], tdelay )];

% Sustain: signal stays at s for dur seconds
tsustain = 0:1/fs:(dur-1/fs);
esustain(0:size(tsustain)) = s;
t = [t, tsustain];
e = [e, esustain];

% Release: signal linearly decreases from s to 0 in r seconds
trelease = 0:1/fs:(r-1/fs);
t = [t, trelease];
e = [e, interp1([0 r], [s 0], trelease)];
