%% ZADATAK 2 ==============================================================
% Napraviti digitalni Cheybshev-ljev filtar druge vrste koji je NF tipa i
% propusta prve dve komponente sledeceg signala. 
% x(t) = sin(50t) + 2cos(80t) + cos(90t) + 2sin(120t)
% Parametre Rp, Rs, Wp i Ws izabrati proizvoljno. Skicirati frekvencijske
% karakteristike filtra i potvrditi njegove selektivne osobine. U kojim
% jedinicama je logicno crtati frekvencijske karakteristike signala i
% filtra?
% -------------------------------------------------------------------------

close all; clear all; clc;

Fs = 4*2*120/(2*pi);
Ts = 1/Fs;
t = 0:Ts:1;
x = sin(50*t) + 2*cos(80*t) + cos(90*t) + 2*sin(120*t);
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
    
% Dig. Cheby II
Wp = 13.3/(Fs/2);
Ws = 13.8/(Fs/2);
Rp = 1;
Rs = 40;
[n,Wn] = cheb2ord(Wp,Ws,Rp,Rs);
[b,a] = cheby2(n,Rs,Ws,'low');
[h,f] = freqz(b,a,N/2+1,Fs);

figure
  hold on;
  plot(f, 20*log10(abs(h)));
  xlabel('f[Hz]');
  title('Amplitudska karakteristika signala');
  grid on;
  
% Filtriranje signala
y = filter(b, a, x);
Y = fft(y,N)/length(y);
Y1 = abs(Y(1:N/2+1));
Y1(2:N/2+1) = 2*Y1(2:N/2+1);

figure
  subplot(2, 2, [1, 3])
    plot(f1, X1, 'Linewidth', 1.5); hold on;
    plot(f1, Y1, 'Linewidth', 1.5);
    xlabel('f[Hz]'); ylabel('|X(jf)|, |Y(jf)|'); 
    legend('ulazni', 'izlazni signal');
    title('Amplitudske karakteristike ulaznog i izlaznog signala');
    grid on;
  subplot(2, 2, 2)
    plot(t,x);
    xlabel('t[s]');
    ylabel('x(t)');
    title('Ulazni signal');
    grid on;
  subplot(2, 2, 4)
    stem(n, y, 'r');
    xlabel('t[s]'); ylabel('y(t)');
    title('Izlazni signal');
    grid on;
    