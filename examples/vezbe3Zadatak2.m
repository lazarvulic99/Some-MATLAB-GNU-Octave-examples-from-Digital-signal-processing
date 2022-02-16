clear all; close all; clc;
filename = 'tone.wav';
[x,Fs] = audioread(filename);
t = 0:1/Fs:(length(x)-1)/Fs;
figure(1)
  plot(t(1:300),x(1:300));
  xlabel('t[s]'); ylabel('x(t)'); title('Audio signal'); grid on;