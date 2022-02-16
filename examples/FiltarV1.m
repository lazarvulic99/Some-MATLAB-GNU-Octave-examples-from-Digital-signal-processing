clear all; close all; clc;

Fs = 25;
Ts = 1/Fs;
t = 0:Ts:10;

x = 3*cos(2*pi*2*t) + 2*sin(2*pi*4.5*t) + 5*cos(2*pi*6*t) + 3*sin(2*pi*9.3*t);

N = 8*2^nextpow2(length(x));
f1 = 0:Fs/N:Fs/2;
X = fft(x,N)/length(x);
X1 = abs(X(1:N/2+1));
X1(2:N/2+1) = 2*X1(2:N/2+1);
Xphase = unwrap(angle(X(1:N/2+1)));

figure
  subplot(2,2,1:2)
    plot(t,x);
    xlabel('t[s]'); ylabel('x(t)'); title('Signal x(t)'); grid on;
  subplot(2,2,3)
    plot(f1,X1);
    xlabel('f[Hz]'); ylabel('|X(jf)|'); title('Amplitudska frekvencijska karakteristika'); grid on;
  subplot(2,2,4)
    plot(f1,Xphase);
    xlabel('f[Hz]'); ylabel('arg{X(jf)}'); title('Fazna frekvencijska karakteristika'); grid on;
    
% Digitalni elipticki filtar
Wp = [4.1 4.9]/(Fs/2);
Ws = [3.9 5.1]/(Fs/2);
Rp = 1;
Rs = 40;

[n,Wn] = ellipord(Wp,Ws,Rp,Rs);
[b,a] = ellip(n,Rp,Rs,Wp);
[h,f] = freqz(b,a,N/2+1,Fs);

figure
  hold on;
  plot(f,20*log10(abs(h)));
  xlabel('f[Hz]');
  ylabel('Amplitudska frekvencijska karakteristika filtra');
  title('Amplitudska frekvencijska karakteristika filtra');
  grid on;
  
% Filtriranje signala
y = filter(b,a,x);
Y = fft(y,N)/length(y);
Y1 = abs(Y(1:N/2+1));
Y1(2:N/2+1) = 2*Y1(2:N/2+1);

figure
  subplot(2,2, [1, 3]);
    plot(f1,X1);
    hold on;
    plot(f1,Y1);
    xlabel('f[Hz]'); ylabel('|X(jf)|, |Y(jf)|'); title('Amplitudska karakteristika ulaznog i izlaznog signala');
    legend('Ulazni signal', 'Izlazni signal');
    grid on;
  subplot(2,2,2)
    plot(t,x);
    xlabel('t[s]'); ylabel('x(t)'); title('Ulazni signal'); grid on;
  subplot(2,2,4)
    plot(t,y, 'r');
    xlabel('t[s]'); ylabel('y(t)'); title('Izlazni signal'); grid on;