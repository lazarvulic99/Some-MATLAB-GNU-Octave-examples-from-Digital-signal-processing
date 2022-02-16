close all; clear all; clc;

N = [10 20 40];
Nfft = 1024;
w1 = 0:2*pi/Nfft:pi;
Wn = [1.2 1.8]/pi;

for k=1:length(N)
  n = N(k)-1;
  window = kaiser(n+1);
  figure(1)
    subplot(3,1,k)
      stem(window);
      xlim([0 40]);
      xlabel('n[odb]'); title(['Prozorska funkcija za N = ' num2str(N(k))]); grid on;
  Xw = fft(window,Nfft)/length(window);
  Xw1 = abs(Xw(1:Nfft/2+1));
  Xw1(2:Nfft/2+1) = 2*Xw1(2:Nfft/2+1);
  figure(2)
    hold on;
    plot(w1,Xw1);
    xlabel('\Omega [rad/odb]'); title('AFK prozorske funkcije'); grid on;
  a = 1;
  b = fir1(n,Wn,window);
  [hz,w] = freqz(b,a,Nfft/2+1);
  figure(3)
    hold on;
    plot(w,20*log10(abs(hz)));
    xlabel('\Omega [rad/odb]'); title('AFK filtra'); grid on;
end

figure(2)
  legend(['N_1 = ' num2str(N(1))],['N_2 = ' num2str(N(2))],['N_3 = ' num2str(N(3))]);
  
figure(3)
  legend(['N_1 = ' num2str(N(1))],['N_2 = ' num2str(N(2))],['N_3 = ' num2str(N(3))]);