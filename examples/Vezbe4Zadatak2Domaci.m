clear all; close all; clc;

Fs = 4*2*47/(2*pi);
Ts = 1/Fs;
t = 0:Ts:1;
x = 2*sin(18*t) + 4*cos(25*t) - cos(47*t);
N = 4*2^nextpow2(length(x));
X = fft(x,N)/length(x);
X1 = abs(X(1:N/2+1));
X1(2:N/2+1) = 2*X1(2:N/2+1);
Xphase = unwrap(angle(X(1:N/2+1)));
f1 = 0:Fs/N:Fs/2;

figure(1)
  subplot(2,2,1:2)
    plot(t,x);
    xlabel('t[s]'); ylabel('x(t)'); title('Signal x(t)'); grid on;
  subplot(2,2,3)
    plot(f1,X1);
    xlabel('f[Hz]'); ylabel('|X(jf)|'); title('AFK signala x(t)'); grid on;
  subplot(2,2,4)
    plot(f1,Xphase);
    xlabel('f[Hz]'); ylabel('arg{X(jf)}'); title('FFK signala x(t)'); grid on;