clear all; close all; clc;
%% Sekcija 1
a = 4; b = sqrt(2)/2; c = pi/3; d = 1 + 1i;
% Nizovi
A1 = [2 4 6 8 10]
A2 = 2:2:10
A3 = linspace(2, 10, 5)
% Matrice
B = [1 2; 3 4]
C = [A1; flip(A1)]
D = [1+i, 1-i; -1+i, -1-i]
% Neke specijalne matrice
O = ones(1,3)
Z = zeros(3,2)
I = eye(3)
% Promena dimenzija matrica
Z1 = reshape(Z,6,1)
Z1(3)
% Sabiranje oduzimanje i mnozenje matrica
Z + a
Z + O'
transpose(Z)*I
C.*C
C.*A1
% Matematicke funkcije
sin(c)
cos(c)
tan(c)
cot(c)
asin(b)
acos(b)
atan(b)
acot(b)
exp(0)
log(exp(1))
log10(100)
2^3
2^(1/3)
nthroot(2,3)
sqrt(2)
sign(4)
sign(-4)
round(b)
floor(b)
ceil(b)
real(d)
imag(d)
abs(d)
angle(d)
conj(d)
d'
transpose(D)
D'
% Jos neke ugradjene funkcije
length(A1)
[m,n] = size(C)
numel(C)
ndims(A1)
isequal(A1,A2)
isempty(C)
% Neke nove matrice
F = [3 9 7; 8 4 2]
[maxF, idxF] = max(F)
[maxF, idxF] = max(F, [], 2)
max(maxF)
sum(F)
sum(F,2)
sum(sum(F))
indices = find(F<8)
sort(F, 'ascend')
sort(F, 'descend')
det(B)
rank(B)
trace(B)
diag(B)
inv(B)
% Definisanje stringova i nizova charova
s = "Digitalna obrada signala"
c = 'Digitalna obrada signala'
whos s
whos c
s(2)
c(2)
num2str(a)
% Resavanje sistema linearnih jednacina
A = [2 3 -4; -3 1 1; 1 -2 5];
B = [12; -2; 4];
x = inv(A)*B
% Operatori
a > b
b >= a
A1 == A2
A1 == C
A1 == 2 | A3 == 4
A1(A1<8)
% Graficki prikaz kontinualnog rezultata
t = 0: 0.01: 2*pi;
x = exp(-t).*sin(t);
y = cos(t);
figure
  plot(t,x,'g*', 'LineWidth', 1.5);
  hold on;
  plot(t,y);
  xlabel('t[sec]'); ylabel('x(t), y(t)'); title('Kontinualni signali');
  grid on;
  legend('x', 'y');
mean(x)
var(x)
%Graficki prikaz diskretnog signala
n = 0:10;
z = cos(n);
q = exp(-n);
figure
  subplot(2,1,1)
    stem(n,z);
    xlabel('n[odb]'); ylabel('z[n]'); title('Signal z(n)');
  subplot(2,1,2)
    stem(n,q);
    xlabel('n[odb]'); ylabel('q[n]'); title('Signal q(n)');
  grid on;
 sgtitle('Diskretni signali');