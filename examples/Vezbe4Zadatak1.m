clear all; close all; clc;

Fs = 1000;
Ts = 1/Fs;
t = 0:Ts:0.1;
x = sin(2*pi*120*t) + sin(2*pi*60*t);
N = 4*2^nextpow2(length(x));
% Jednostruki spektar
f1 = 0:Fs/N:Fs/2;
X = fft(x,N)/length(x);
X1 = abs(X(1:N/2+1));
X1(2:N/2+1) = 2*X1(2:N/2+1);
Xphase = unwrap(angle(X(1:N/2+1)));
% Dvostruki spektar
f2 = -Fs/2:Fs/N:Fs/2-Fs/N;
X2 = abs(fftshift(X));

figure(1)
  plot(t,x);
  xlabel('t[s]'); ylabel('x(t)'); title('Signal x(t)'); grid on;
  
figure(2)
  subplot(2,1,1)
    plot(f1,X1);
    xlabel('f[Hz]'); ylabel('|X(jf)|'); title('AFK signala x(t)'); grid on;
  subplot(2,1,2)
    plot(f1,Xphase)
    xlabel('f[Hz]'); ylabel('arg{X(jf)}'); title('FFK signala x(t)'); grid on;

figure(3)
  plot(f2,X2);
  xlabel('f[Hz]'); ylabel('|X(jf)|'); title('AFK-Dvostrano signala x(t)'); grid on;