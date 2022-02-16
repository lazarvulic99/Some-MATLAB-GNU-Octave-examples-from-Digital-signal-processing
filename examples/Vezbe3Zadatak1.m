clear all; close all; clc;

% Crtanje grafika signala, signal je adevkatno odabran
Fs = 1000;
Ts = 1/Fs;
t = 0:Ts:0.1;
x = sin(2*pi*120*t) + sin(2*pi*60*t);

figure(1)
  plot(t,x);
  xlabel('t[s]'); ylabel('x(t)'); title('Signal x(t)'); grid on;
  
% Crtanje grafika signala, signal je neadekvatno odabran
Fs1 = 200;
Ts1 = 1/Fs1;
t1 = 0:Ts1:0.1;
x1 = sin(2*pi*120*t1) + sin(2*pi*60*t1);
% Dolazi do zamene ucestanosti
y = sin(2*pi*80*t + pi) + sin(2*pi*60*t);

figure(2)
  plot(t,x); hold on;
  scatter(t1,x1,'r','*');
  xlabel('t[s]'); ylabel('x(t)'); title('Signal x(t)'); grid on;
  plot(t,y,'g');
  legend('Originalni signal', 'Odabrani Fs=200Hz', 'Signal-zamenjene ucestanosti');