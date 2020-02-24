%% aula 2
%% exercicio 1a
% For each value of p, determine the probability of the link being in the interference state
% and in the normal state when one control frame is received with errors (fulfil the
% following table). What do you conclude?


clc
clear all

pE_N = 1 - binomial(10^-7,128*8,0)
pE_I = 1 - binomial(10^-3,128*8,0)

pN = [0.99 0.999 0.9999 0.99999];
pI = 1- pN

pN_E = pE_N*pN./(pE_N*pN + pE_I*pI)*100
pI_E = 100-pN_E

res = [pN_E' pI_E']


%% exercicio 1b
res2 = [];
for n = [2 3 4 5]

pE_N = 1 - binomial(10^-7,128*8,0);
pE_N = pE_N^n;
pE_I = 1 - binomial(10^-3,128*8,0);
pE_I = pE_I^n;

pN = [0.99 0.999 0.9999 0.99999];
pI = 1- pN;


pN_E = pE_N*pN./(pE_N*pN + pE_I*pI)*100;
res2=[res2 pN_E'];
end

res2


%% exercicio 1c
res3 = [];
for n = [2 3 4 5]

pN = [0.99 0.999 0.9999 0.99999];
pI = 1- pN;

% pnotE_N = binomial(10^-7,128*8,0);
% pnotE_N = pnotE_N^n;
% 
% pnotE_I = binomial(10^-3,128*8,0);
% pnotE_I = pnotE_I^n;

pE_N = 1 - binomial(10^-7,128*8,0);  % p(1 dos bits ter erro)->frame estar errada [em N]
pE_N = pE_N^n;                       % p(n frames estarem erradas) [em N]
pE_I = 1 - binomial(10^-3,128*8,0);
pE_I = pE_I^n;


pnotE_N = 1-pE_N;                    % p(n frames estarem certas em modo N)

pnotE_I = 1-pE_I;                    % p(n frames estarem certas em modo I)

pI_notE = pnotE_I*pI;
pI_notE = pI_notE ./ (pnotE_I*pI + pnotE_N*pN);
res3 = [res3 pI_notE'];
end

res3 * 100


%% exercicio 2.a

pi6 = 1/(1+ 1/180 + (1/180)*(20/40) + (1/180)*(20/40)*(10/20) + (1/180)*(20/40)*(10/20)*(5/2))

pi5 = ((1/180))/pi6

pi4 = ((1/180)*(20/40))/pi6

pi3 = ((1/180)*(20/40)*(10/20))/pi6

pi2 = ((1/180)*(20/40)*(10/20)*(5/2))/pi6


e2b = pi6*10^(-6)+pi5*10^(-5)+pi4*10^(-4)+pi3*10^(-3)+pi2*10^(-2)

fprintf("2c\n")

T6 = 60/1

T5 = 60/(180+20)

T4 = 60/(40+10)

T3 = 60/(20+5)

T2 = 60/2

pINT=(pi3+pi2)*100

averageINT = (pi3*10^(-3)+pi2*10^(-2))/(pi3+pi2)





