clear all; close all; clc;

data = load('signal.mat');
x = data.signal;
Fs = data.Fs;
Ts = 1/Fs;
t = 0:Ts:(length(x)-1)/Fs;

figure(1)
  plot(t(1:200),x(1:200));
  xlabel('t[s]'); ylabel('x(t)'); title('Ulazni signal x(t)'); grid on;

[max_x,ind_x] = max(x(1:200));
idx=find(abs(x(1:200)-max_x)<1e-5);

figure(1)
  hold on;
  scatter(t(idx),x(idx));
  
T = t(idx(2)) - t(idx(1))