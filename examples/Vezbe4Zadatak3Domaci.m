clear all; close all; clc;

n = 0:100;
x = 1 + 3*cos(0.5*n) - 2*sin(2*n + pi/2) + cos(2.2*n + 3*pi/4);
N = 4*2^nextpow2(length(x));
X = fft(x,N)/length(x);
X1 = abs(X(1:N/2+1));
X1(2:N/2+1) = 2*X1(2:N/2+1);
Xphase = unwrap(angle(X(1:N/2+1)));
w1 = 0:2*pi/N:pi;

figure(1)
  subplot(2,2,1:2)
    stem(x);
    xlim([0 100]);
    xlabel('n[odb]'); ylabel('x[n]'); title('Signal x[n]'); grid on;
  subplot(2,2,3)
    plot(w1,X1);
    xlabel('\Omega [rad/odb]'); ylabel('|X(j\Omega)|'); title('AFK signala x[n]'); grid on;
  subplot(2,2,4)
    plot(w1,Xphase);
    xlabel('\Omega [rad/odb]'); ylabel('arg{X(j\Omega)}'); title('FFK signala x[n]'); grid on;