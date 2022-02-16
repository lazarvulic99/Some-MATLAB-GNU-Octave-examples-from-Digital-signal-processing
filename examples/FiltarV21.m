close all; clear all; clc;

Fs = 250;
Ts = 1/Fs;
t = 0:Ts:1;
x = 3*cos(2*pi*25*t) + 5*sin(2*pi*45*t) + 2*sin(2*pi*60*t) + 6*cos(2*pi*90*t);
N = 4*2^nextpow2(length(x));
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
    hold on;
    plot(f1,X1);
    xlim([0 Fs/2]);
    xlabel('f[Hz]'); ylabel('|X(jf)|'); title('Amplitudska frekvencijska karakteristika'); grid on;
  subplot(2,2,4)
    plot(f1,Xphase);
    xlim([0 Fs/2]);
    ylim([-400 10]);
    xlabel('f[Hz]'); ylabel('arg{|X(jf)|}'); title('Fazna frekvencijska karakteristika'); grid on;
    
% Analogni Butterworthov filtar
Wp = [40 45]*2*pi;
Ws = [38 47]*2*pi;
Rp = 2;
Rs = 40;

[n,Wn] = buttord(Wp,Ws,Rp,Rs,'s');
[b, a] = butter(n,Wn,'s');
w = zeros(1, N/2+1);
h = freqs(b,a,w);

[bz,az] = impinvar(b,a,Fs);
%fp = 45;
%[hz, fz] = bilinear(b,a,Fs,fp);
[hz, fz] = freqz(bz,az,N/2+1,Fs);

figure
  plot(w/(2*pi), 20*log10(abs(h)), 'Linewidth', 1.5);
  hold on;
  plot(fz, 20*log10(abs(hz)), 'r', 'Linewidth', 1.5);
  xlabel('f[Hz]');
  title('Amplitudske karakteristike filtra');
  legend('Analogni', 'Digitalni');
  grid on;
  
figure
  pzmap(bz,az);