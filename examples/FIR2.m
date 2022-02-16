close all; clear all; clc;

data = load('diskretni_signal.mat');
x = data.x;
N = 4*2^nextpow2(length(x));
w1 = 0:2*pi/N:pi;
X = fft(x,N)/length(x);
X1 = abs(X(1:N/2+1));
X1(2:N/2+1) = 2*X1(2:N/2+1);
Xphase = unwrap(angle(X(1:N/2+1)));

figure(1)
  subplot(2,2,1:2)
    stem(x(1:200));
    xlabel('n[odb]'); ylabel('x[n]'); title('Diskretan signal'); grid on;
  subplot(2,2,3)
    plot(w1,X1);
    xlabel('\Omega [rad/odb]'); ylabel('|X(j\Omega)|'); title('AFK signala x[n]'); grid on;
  subplot(2,2,4)
    plot(w1,Xphase);
    xlabel('\Omega [rad/odb]'); ylabel('arg{X(j\Omega)}'); title('FFK signala x[n]'); grid on;

% Kreiranje FIR filtra
n = 40;
window = hamming(n+1);
Wn = [1.2 1.8]/pi;
a = 1;
b = fir1(n,Wn,window);
[hz,w] = freqz(b,a,N/2+1);

figure(2)
  subplot(2,1,1)
    stem(window);
    xlabel('n[odb]'); title('Prozorska funkcija'); grid on;
  subplot(2,1,2)
    plot(w,20*log10(abs(hz)));
    xlabel('\Omega [rad/odb]'); title('AFK FIR filtra, Hamming-ov prozor'); grid on;
    
% Filtriranje signala x(t)
y = filter(b,a,x);
Y = fft(y,N)/length(y);
Y1 = abs(Y(1:N/2+1));
Y1(2:N/2+1) = 2*Y1(2:N/2+1);

figure(3)
  subplot(2, 2, [1, 3])
    plot(w1, X1); hold on
    plot(w1, Y1); 
    xlabel('\Omega [rad/odb]'); ylabel('|X(jf)|, |Y(jf)|');
    legend('ulazni', 'izlazni signal');
    title('Amplitudske karakteristike ulaznog i izlaznog signala'); grid on;
  subplot(2, 2, 2)
    stem(x(1:100));
    xlabel('n[odb]'); ylabel('x[n]');
    title('Ulazni signal'); grid on;
  subplot(2, 2, 4)
    stem(y(1:100), 'r');
    xlabel('n[odb]'); ylabel('y[n]');
    title('Izlazni signal'); grid on;

  