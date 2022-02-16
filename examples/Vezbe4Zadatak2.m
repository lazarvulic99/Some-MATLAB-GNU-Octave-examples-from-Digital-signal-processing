close all; clear all; clc;

n=0:100;
x = sin(n) + 3*cos(3*n);
N = 4*2^nextpow2(length(x));
X = fft(x,N)/length(x);
X1 = abs(X(1:N/2+1));
X1(2:N/2+1) = 2*X1(2:N/2+1);
Xphase = unwrap(angle(X(1:N/2+1)));
w1 = 0:2*pi/N:pi; %[rad/odb]
% f1 = 0:1/N:1/2 [1/odb]

figure(1)
  stem(x);
  xlim([0 100]);
  xlabel('n[odb]'); ylabel('x[n]'); title('Signal x[n]'); grid on;
  
figure(2)
  subplot(2,1,1)
    plot(w1,X1);
    xlabel('\Omega [rad/odb]'); ylabel('|X(j\Omega)|'); title('AFK signala x[n]'); grid on;
  subplot(2,1,2)
    plot(w1,Xphase);
    xlabel('\Omega [rad/odb]'); ylabel('arg{X(j\Omega)}'); title('FFK signala x[n]'); grid on;