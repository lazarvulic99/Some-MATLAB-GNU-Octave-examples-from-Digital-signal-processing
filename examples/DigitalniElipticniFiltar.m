clear all; close all; clc;

Fs = 25;
Ts = 1/Fs;
t = 0:Ts:10;
x = 3*sin(2*pi*2*t) + 2*sin(2*pi*4.5*t) + 5*cos(2*pi*6*t) + 3*sin(2*pi*9.3*t);
N = 4*2^nextpow2(length(x));
f1 = 0:Fs/N:Fs/2;
X = fft(x,N)/length(x);
X1 = abs(X(1:N/2+1));
X1(2:N/2+1) = 2*X1(2:N/2+1);
Xphase = unwrap(angle(X(1:N/2+1)));

figure(1)
  subplot(2, 2, 1:2)
    plot(t,x);
    xlabel('t[s]'); ylabel('x(t)'); title('Signal x(t)'); grid on;
  subplot(2,2,3)
    plot(f1,X1);
    xlim([0 12.8]);
    xlabel('f[Hz]'); ylabel('|X(jf)|'); title('AFK signala x(t)'); grid on;
  subplot(2,2,4)
    plot(f1,Xphase);
    ylim([-320 20]);
    xlim([0 13]);
    xlabel('f[Hz]'); ylabel('arg{X(jf)}'); title('FFK signala x(t)'); grid on;
    
% Digitalni elipticni filtar
Wp = [4 5]/(Fs/2);
Ws = [3.8 5.2]/(Fs/2);
Rp = 1;
Rs = 40;
[n,Wn] = ellipord(Wp,Ws,Rp,Rs);
[b,a] = ellip(n,Rp,Rs,Wp);
[h,f] = freqz(b,a,N/2+1,Fs);

figure(2)
  hold on;
  plot(f,20*log10(abs(h)));
  xlabel('f[Hz]'); title('AFK filtra'); grid on;
  
% Filtriranje signala
y = filter(b,a,x);
Y = fft(y,N)/length(y);
Y1 = abs(Y(1:N/2+1));
Y1(2:N/2+1) = 2*Y1(2:N/2+1);
Yphase = unwrap(angle(Y(1:N/2+1)));

figure(3)
  subplot(2,2,[1,3])
    plot(f1,X1);
    hold on;
    plot(f1,Y1);
    legend('Ulazni signal', 'Izlazni signal');
    xlabel('f[Hz]'); ylabel('|X(jf)|, |Y(jf)|'); title('AFK ulaznog i izlaznog signala');
    grid on;
  subplot(2,2,2)
    plot(t,x);
    hold on;
    xlabel('t[s]'); ylabel('x(t)'); title('Ulazni signal'); grid on;
  subplot(2,2,4)
    plot(t,y,'r');
    hold on;
    xlabel('t[s]'); ylabel('y(t)'); title('Izlazni signal'); grid on;