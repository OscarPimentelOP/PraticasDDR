function [w1,w2] = mg1_2filas(lambda1,C,n)
%MG1_2FILAS Summary of this function goes here
%   Detailed explanation goes here

% w1 for data
% w2 for voip

p64 = 0.16;
p1518=0.22;
pResto = (1-p1518-p64);
pIndividual = pResto/(1517-65+1);

t64 = 64/(125000*C);
t1518 = 1518/(125000*C);
tEq = ((65+1517)/2)/(125000*C);

es_f1 = p64*t64+p1518*t1518+pResto*tEq;
es2_f1 = p64*t64^2 + p1518*t1518^2;

for tamanho=65:1517
    tIndividual = tamanho/(125000*C);
    es2_f1 = es2_f1 + pIndividual*tIndividual^2;
end

pacote_medio1 = p64*64 + p1518*1518 + pResto*(1517+65)/2;
pacote_medio2 = (110+130)/2;

u1 = (C*10^6)/(pacote_medio1*8);
u2 = (C*10^6)/(pacote_medio2*8);

lambda2 = n/(20*10^(-3));

es_f2 = 1/u2;
es2_f2 = 0;

pIndividual = 1/(130-110+1);
for tamanho=110:130
    tIndividual=tamanho/(125000*C);
    es2_f2 = es2_f2 + pIndividual*tIndividual^2;
end

ro1 = lambda1/u1;
ro2 = lambda2/u2;

w1 = (lambda1 * es2_f1 + lambda2 * es2_f2)/( 2*(1-ro2)*(1-ro2-ro1)) + es_f1;
w2 = (lambda1 * es2_f1 + lambda2 * es2_f2)/( 2*(1-ro2))  +es_f2;
w1=w1*1000;
w2=w2*1000;
end

