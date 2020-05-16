function APD = mg1(lambda,C)
%MM1 Summary of this function goes here
%   Detailed explanation goes here

% C in (Mbps)

p64 = 0.16;
p1518=0.22;
pResto = (1-p1518-p64);
pIndividual = pResto/(1517-65+1);


t64 = 64/(125000*C);
t1518 = 1518/(125000*C);
tEq = ((65+1517)/2)/(125000*C);

es = p64*t64+p1518*t1518+pResto*tEq;
es2 = p64*t64^2 + p1518*t1518^2;

for tamanho=65:1517
    tIndividual = tamanho/(125000*C);
    es2 = es2 + pIndividual*tIndividual^2;
end

APD=((lambda*es2)/(2*(1-lambda*es))) + es;
APD = APD *1000;

end

