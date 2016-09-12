function y = synthesizer(notes,durs,harmamps,adsr,fs)

% Initialize output as empty
y = [];

% Loop over the notes
for i=1:length(notes)
    % Compute the time vector and ADSR envelope for this note
    sustain_length = durs(i) - adsr(1) - adsr(2) - adsr(4)
    [t,e] = envelope(fs, adsr(1), adsr(2), adsr(3), durs(i), adsr(4));
    
    % Compute the sum of harmonics for this note
    h = harmonics(t, notes(i), harmamps);
    
    % Modulate the sum of harmonics with the envelope
    n = h .* e;

    % Add the note to the sequence
    y = [y,n];
end

% Play the sound
sound(y,fs);
