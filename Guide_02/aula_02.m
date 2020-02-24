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
%For each value of p and for n = 2, 3, 4 and 5, determine the probability of false
%positives.
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

res2 * 100


%% exercicio 1c
res3 = [];
for n = [2 3 4 5]

pN = [0.99 0.999 0.9999 0.99999];
pI = 1- pN;

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