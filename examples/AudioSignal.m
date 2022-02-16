clear all; close all; clc;

filename = 'tone.wav';
[x, fs] = audioread(filename);
T = 1/fs;
t = 0: T: (length(x)-1)/fs;

figure(1)
  plot(t(1:200), x(1:200));
  xlabel('t[sec]'); ylabel('x[t]'); title('Audio signal'); grid on;