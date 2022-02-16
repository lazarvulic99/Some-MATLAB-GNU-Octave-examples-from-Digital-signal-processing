clear all; close all; clc;
n = 0:9;
x = n/2;
y = 2*sin(1.5*n + pi/3);
N = length(x);

figure(1)
  subplot(2,1,1);
  stem(n,x);
  xlabel('n[odb]'); ylabel('x[n]'); title('Signal x[n]'); grid on;
  subplot(2,1,2);
  stem(n,y);
  xlabel('n[odb]'); ylabel('y[n]'); title('Signal y[n]'); grid on;
  
%Racunanje cirkularne konvolucije, vektorizacijom
z = zeros(1,N);
for k = 0:N-1
  z(k+1) = sum(x.*y(mod(k:(-1):k-N+1,N)+1));
end

figure(2)
  stem(n,z);
  hold on;
  xlabel('n[odb]'); ylabel('z[n]'); title('Signal z[n]'); grid on;