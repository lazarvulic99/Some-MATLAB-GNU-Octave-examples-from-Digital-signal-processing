%% ZADATAK 3 ==============================================================
% Napraviti digitalni Butterworth-ov filtar koji je VF tipa i potiskuje
% samo prvu komponentu sledeceg signala. 
% x[n] = 1 + cos(0.5n) + sin(1.2n) + 2cos(2n)
% Parametre Rp, Rs, Wp i Ws izabrati proizvoljno. Skicirati frekvencijske 
% karakteristike filtra i potvrditi njegove selektivne osobine. 
% -------------------------------------------------------------------------

close all; clear all; clc;

n = 0:100;
x = 1 + cos(0.5*n) + sin(1.2*n) + 2*cos(2*n)
N = 4*2^nextpow2(length(x));
w1 = 0:2*pi/N:pi;
X = fft(x,N)/length(x);
X1 = abs(X(1:N/2+1));
X(2:N/2+1)=2*X(2:N/2+1);
Xphase = unwrap(angle(X(1:N/2+1)));

figure
  subplot(2,2,1:2)
    stem(x);
    xlim([0 100]);
    xlabel('n[odb]'); ylabel('x[n]'); title('Signal x[n]');
    grid on;
  subplot(2,2,3)
    plot(w1,X1);
    xlabel('\Omega [rad/odb]'); ylabel('|X(j\Omega)|'); title('Amplitudska frekvencijska karakteristika');
    grid on;
  subplot(2,2,4)
    plot(w1,Xphase);
    xlabel('\Omega [rad/odb]'); ylabel('arg{X(j\Omega)}'); title('Fazna frekvencijska karakteristika');
    grid on;
    
%Digitalni Chebyshev filtar
Wp = 0.3/pi;
Ws = 0.2/pi;
Rp = 1;
Rs = 40;
[n,Wn] = buttord(Wp, Ws, Rp, Rs);
[b,a] = butter(n,Wn,'high');
[h,w] = freqz(b, a, N/2 + 1);

figure
  hold on;
  plot(w, 20*log10(abs(h)));
  xlabel('\Omega [rad/odb]');
  title('Amplitudska karakteristika signala');
  grid on;
  
% Filtriranje signala
y = filter(b, a, x);
Y = fft(y,N)/length(y);
Y1 = abs(Y(1:N/2+1));
Y1(2:N/2+1) = 2*Y1(2:N/2+1);

figure
  subplot(2, 2, [1, 3])
    plot(w1, X1, 'Linewidth', 1.5); hold on;
    plot(w1, Y1, 'Linewidth', 1.5);
    xlabel('\Omega [rad/odb]'); ylabel('|X(jf)|, |Y(jf)|'); 
    legend('ulazni', 'izlazni signal');
    title('Amplitudske karakteristike ulaznog i izlaznog signala');
    grid on;
  subplot(2, 2, 2)
    stem(n, x);
    xlabel('n[odb]');
    ylabel('x[n]');
    title('Ulazni signal');
    grid on;
  subplot(2, 2, 4)
    stem(n, y, 'r');
    xlabel('n[odb]'); ylabel('y[n]');
    title('Izlazni signal');
    grid on;
    