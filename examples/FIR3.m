clear all; close all; clc;

N = [10, 20, 40];
Nfft = 1024;
w1 = 0:2*pi/Nfft:pi;
Wn = [1.2, 1.8]/pi;

for k = 1:length(N)
   n = N(k)-1; 
   window = kaiser(N(k)); 
   figure(1)
      subplot(3,1,k)
        stem(window);
        xlabel('n [odb]'); xlim([0, 40]);
        title(['Prozorska funkcija za N = ' num2str(N(k))]); grid on;
        
   Xw = fft(window, Nfft)/length(window); 
   Xw1 = abs(Xw(1:Nfft/2+1));
   Xw1(2:Nfft/2+1) = 2*Xw1(2:Nfft/2+1); 
   figure(2)
      hold on
      plot(w1, Xw1); 
      xlabel('\Omega [rad/odb]'); 
      title('Amplitudska karakteristika prozorske funkcije'); grid on;
   b = fir1(n, Wn, window);
   a = 1;
   [hz, w] = freqz(b, 1, Nfft/2+1);
   figure(3)
      hold on; 
      plot(w, 20*log10(abs(hz))); 
      xlabel('\Omega [rad/odb]'); xlim([0 pi]); 
      title('Amplitudska karakteristika filtra'); grid on;
end