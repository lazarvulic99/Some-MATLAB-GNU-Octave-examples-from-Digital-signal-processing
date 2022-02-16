clear all; close all; clc;
N = 1000;
R = 4;
xc = 3;
yc = 5;
X = zeros(2, N);

for ind = 1:N
  angle = 2*pi*rand;
  rho = R*rand;
  X(1,ind) = rho*cos(angle) + xc;
  X(2,ind) = rho*sin(angle) + yc;
end

figure
  scatter(X(1, :), X(2, :));