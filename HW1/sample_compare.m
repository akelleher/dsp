% synth settings
notes = [262 294 330 349 392 440 494 524];
durs = 0.5*ones(1,8);
amps = [1 0 0.66 0 0.66 0 0.31 0.48 0.24];
adsr = [.05,.1,0.95,.05];
fs = 1000;

% ideal sample settings
low_sample_freq = 40;
low_sample_width = 0.25/low_sample_freq;

y = synthesizer(notes, durs, amps, adsr, fs);
t = 0:1/fs:length(y)/fs; %time vector for pulsetrain
d = 0:1/low_sample_freq:length(y)/fs;
pulses = pulstran(t,d,@rectpuls, low_sample_width);