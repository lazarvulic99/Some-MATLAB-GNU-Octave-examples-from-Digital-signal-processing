close all; clear all; clc;

n = 0:100;
x = sin(1.2*n) + 2*cos(3*n);
N = 4*2^nextpow2(length(x));
w1 = 0:2*pi/N:pi;
X = fft(x,N)/length(x);
X1 = abs(X(1:N/2+1));
X1(2:N/2+1) = 2*X1(2:N/2+1);
Xphase = unwrap(angle(X(1:N/2+1)));

figure(1)
  subplot(2,2, 1:2)
    stem(n,x);
    xlabel('n[odb]'); ylabel('x[n]'); title('Signal x[n]'); grid on;
  subplot(2,2,3)
    plot(w1,X1);
    xlabel('\Omega [rad/odb]'); ylabel('|X(j\Omega)'); title('AFK'); grid on;
  subplot(2,2,4)
    plot(w1,Xphase);
    xlabel('\Omega [rad/odb]'); ylabel('arg{X(j\Omega)}'); title('FFK'); grid on;
    
% Digitalni Cheby filtar I vrste
Wp = [1 1.4]/pi;
Ws = [0.9 1.5]/pi;
Rp = 1;
Rs = 30;
[n,Wn] = cheb1ord(Wp,Ws,Rp,Rs);
[b,a] = cheby1(n,Rp,Wp);
[h,w] = freqz(b,a,N/2+1);

figure(2)
  hold on;
  plot(w, 20*log10(abs(h)));
  xlabel('\Omega [rad/odb]'); title('AFK filtra'); grid on;
  
% Filtriranje signala
y = filter(b,a,x);
Y = fft(y,N)/length(y);
Y1 = abs(Y(1:N/2+1));
Y1(2:N/2+1) = 2*Y1(2:N/2+1);

figure(3)
  subplot(2,2,[1,3])
    plot(w1,X1,'Linewidth',1.5); hold on;
    plot(w1,Y1,'Linewidth',1.5);
    xlabel('\Omega [rad/odb]'); ylabel('|X(j\Omega)|, |Y(j\Omega|'); title('AFK ulaznog i izlaznog signala'); grid on;
  subplot(2,2,2)
    stem(x);
    xlabel('n[odb]'); ylabel('x[n]'); title('Ulazni signal'); grid on;
  subplot(2,2,4)
    stem(y,'r');
    xlabel('n[odb]'); ylabel('y[n]'); title('Izlazni signal'); grid on;