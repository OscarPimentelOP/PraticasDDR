%% aula 2
%% exercicio 1a

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

res2*100


%% exercicio 1c
res3 = [];
n = 2

pE_N = 1 - binomial(10^-7,128*8,0);
pE_N = pE_N^n;

pE_I = 1 - binomial(10^-3,128*8,0);
pE_I = pE_I^n;

pE = (pE_N*pN + pE_I*pI)
pnE = 1 - pE

pI_nE = 