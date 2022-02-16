clear all; close all; clc;
Fs = 1000;
T = 1/Fs;
t = 0:T:0.1;
x = sin(2*pi*120*t) + sin(2*pi*60*t);

figure(1)
  plot(t,x);
  xlabel('t[s]'); ylabel('x(t)'); title('Signal x(t)');
  grid on;
  
%Isti signal samo sa neadekvatnim odabiranjem
Fs2 = 200;
Ts2 = 1/Fs2;
t2 = 0:Ts2:0.1;
x2 = sin(2*pi*120*t2) + sin(2*pi*60*t2);

figure(2)
  plot(t,x);
  hold on;
  scatter(t2, x2,'r', '*');
  xlabel('t[s]'); ylabel('x(t)'); title('Signal x(t)');
  grid on;
  
x3 = sin(2*pi*80*t + pi) + sin(2*pi*60*t)
plot(t, x3, 'g');
legend('Originalni x(t)', 'Odabrani x(t) sa Fs=200Hz', 'x(t)-zamena');

