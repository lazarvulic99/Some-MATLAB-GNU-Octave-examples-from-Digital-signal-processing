clear all; close all; clc;
n = 0:4;
x = sin(2*pi.*n);
y = (-1).^n;
x(6:10) = 0;
y(6:10) = 0;

N = 10;

z = zeros(1,N);
for k = 0:N-1
  z(k+1) = sum(x.*y(mod(k:(-1):k-N+1,N)+1));
end

m = 0:9

figure(1)
  stem(m, z);
  xlabel('n[odb]'); ylabel('z[n]'); title('Signal z[n]');
  grid on;