close all; clear all; clc;

data = load('signal.mat');
x = data.signal;
Fs = data.Fs;

Ts = 1/Fs;
t = 0:Ts:(length(x)-1)/Fs;

figure
  plot(t(1:200),x(1:200));
  xlabel('t[s]'); ylabel('x(t)'); title('Signal'); grid on;
  
ac = xcorr(x,x);
[~,locs] = findpeaks(ac, "DoubleSided");
mean(diff(locs)*Ts)