%% ZADATAK 1 ==============================================================
% Napraviti digitalni Butterworth-ov, Elipticki i Chebyshev-ljev filtar
% prve i druge vrste sa slede?im specifikacijama:
% * Maksimalno slabljenje u propusnom opsegu: 1 dB
% * Minimalno slabljenje u nepropusnom opsegu: 40 dB
% * Propusni opseg: od 300 rad/s do 400 rad/s
% * Nepropusni opseg: pre 280 rad/s i posle 420 rad/s
% Skicirati frekvencijske odzive ovih filtara na istom grafiku i uporediti
% njihove performanse. Da li postoji razlika u redovima filtara? Kako
% odabir periode odabiranja utice na karakteristike i redove filtara?
% -------------------------------------------------------------------------
clear all; close all; clc; 

Nfft = 1024;
Fs = 300;
Wp = [300/(2*pi) 400/(2*pi)]/(Fs/2);
Ws = [280/(2*pi) 420/(2*pi)]/(Fs/2);
Rp = 1;
Rs = 40;

% Butterworth filtar
[nb,Wnb] = buttord(Wp,Ws,Rp,Rs);
[bb,ab] = butter(nb,Wnb);
[hb, fb] = freqz(bb,ab,Nfft,Fs);
nb

% Elipticki
[ne,Wne] = ellipord(Wp,Ws,Rp,Rs);
[be,ae] = ellip(ne,Rp,Rs,Wp);
[he, fe] = freqz(be,ae,Nfft,Fs);
ne

% Cheby I filtar
[nC1,WnC1] = cheb1ord(Wp,Ws,Rp,Rs);
[bC1,aC1] = cheby1(nC1,Rp,Wp);
[hC1, fC1] = freqz(bC1,aC1,Nfft,Fs);
nC1

% Butterworth filtar
[nC2,WnC2] = cheb2ord(Wp,Ws,Rp,Rs);
[bC2,aC2] = cheby2(nC2,Rs,Ws);
[hC2, fC2] = freqz(bC2,aC2,Nfft,Fs);
nC2

figure(1)
  hold on;
  plot(fb*2*pi,20*log10(abs(hb)));
  plot(fe*2*pi,20*log10(abs(he)),'r');
  plot(fC1*2*pi,20*log10(abs(hC1)),'g');
  plot(fC2*2*pi,20*log10(abs(hC2)),'y');
  xlabel('[rad/s]'); title('AFK filtara');
  legend('BW filtar', 'Elipticki filtar', 'Cheby I filtar', 'Cheby II filtar');

