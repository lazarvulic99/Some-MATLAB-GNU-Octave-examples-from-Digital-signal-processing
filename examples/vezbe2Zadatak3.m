clear all; close all; clc;

t = 0:0.01:10;
x = 2*sin(t);
y = x.^2 + 1;
[minY, xmin] = min(y)
[maxY, xmax] = max(y)

step = (10-0)/1000;
lastindex = ceil(6/step);
srVrY = mean(y)
srVrY06 = mean(y(1:lastindex))

figure
  plot(t,x);
  hold on;
  plot(t,y, 'g', 'Linewidth', 1);
  hold on;
  line([t(1) t(end)], [srVrY srVrY], 'Color', 'r');
  xlabel('t[s]'); ylabel('x(t), y(t)');
  legend('x(t)', 'y(t)', 'Sr. vred.');
  grid on