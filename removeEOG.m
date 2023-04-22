function f = removeEOG(figno, trial)
% function - remove EOG
task1 = double(trial{4});

kernel = abs(fft(task1(7,:)));
M = max(kernel);
kernel = kernel / M;


sigf = fft(task1(1,:));
sigf = sigf.*(1-kernel);
c3 = sigf;

sigf = fft(task1(2,:));
sigf = sigf.*(1-kernel);
c4 =  sigf;

sigf = fft(task1(3,:));
sigf = sigf.*(1-kernel);
p3 = sigf;

sigf = fft(task1(4,:));
sigf = sigf.*(1-kernel);
p4  = sigf;

sigf = fft(task1(5,:));
sigf = sigf.*(1-kernel);
o1  = sigf;

sigf = fft(task1(6,:));
sigf = sigf.*(1-kernel);
o2 = sigf;

eog = fftshift(abs(kernel));

f = {c3, c4, p3, p4, o1, o2, eog};
%%%%%