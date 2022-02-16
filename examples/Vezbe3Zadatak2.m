close all; clear all; clc;

filename = 'E:\6. semestar snimci\DOSR\Vezbanje\tone.wav';
[x,Fs] = audioread(filename);
Ts = 1/Fs;
t = 0:Ts:(length(x)-1)/Fs;

figure(1)
  plot(t(1:100),x(1:100));
  xlabel('t[s]'); ylabel('x(t)'); title('Tone.wav signal'); grid on;