close all; clear all; clc;

filename = 'firefly_sum.wav';
[x,Fs] = audioread(filename);

Ts = 1/Fs;
t = 0:Ts:(length(x)-1)*Ts;
N = 4*2^nextpow2(length(x));
f1 = 0:Fs/N:Fs/2;
X = fft(x,N)/length(x);
X1 = abs(X(1:N/2+1));
X1(2:N/2+1) = 2*X1(2:N/2+1);
Xphase = unwrap(angle(X(1:N/2+1)));

figure(1)
  subplot(2,1,1)
    plot(t,x);
    xlabel('t[s]'); ylabel('x(t)'); title('Audio signal'); grid on;
  subplot(2,1,2)
    plot(f1,X1);
    xlabel('f[Hz]'); ylabel('|X(jf)|'); title('AFK audio signala x(t)'); grid on;
 
% Digitalni elipticki filtar
Wp = 2000/(Fs/2);
Ws = 2100/(Fs/2);
Rp = 1;
Rs = 40;
[n,Wn] = ellipord(Wp,Ws,Rp,Rs);
[b,a] = ellip(n,Rp,Rs,Wp);
[h,f] = freqz(b,a,N/2+1,Fs);

figure(2)
  hold on;
  plot(f, 20*log10(abs(h)));
  xlabel('f[Hz]');
  title('AFK filtra');
  
% Filtriranje signala
y = filter(b,a,x);
Y = fft(y,N)/length(y);
Y1 = abs(Y(1:N/2+1));
Y1(2:N/2+1) = 2*Y1(2:N/2+1);

figure(3)
  subplot(2,2,[1,3])
    plot(f1,X1,'Linewidth',1.5); hold on;
    plot(f1,Y1,'Linewidth',1.5);
    xlabel('f[Hz]'); ylabel('|X(jf)|, |Y(jf)|'); title('AFK ulaznog i izlaznog signala'); grid on;
  subplot(2,2,2)
    plot(t,x)
    xlabel('t[s]'); ylabel('x(t)'); title('Ulazni signal'); grid on;
  subplot(2,2,4)
    plot(t,y,'r');
    xlabel('t[s]'); ylabel('y(t)'); title('Izlazni signal'); grid on;
    
filename = 'output.wav';
audiowrite(filename,y,Fs);
sound(y,Fs);