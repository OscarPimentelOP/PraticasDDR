clc
clear all

 % teste de escolha multipla
 % n respostas possiveis, 1 certa
 % estudou p da materia
 % escolhe a resposta certa quando sabe
 % quando nao sabe escolha uma ao calhas
 
 saber = 0.6;
 n = 4;
 % P(escolher a resposta certa)
 
 % P(Certa|sabendo a resposta)P(sabendo)+P(Certa|não sabendo)P(Nao sabendo)
 resp1=1*saber+(1/n)*(1-saber)
 
 saber=0.7
 n=5
 
 %P(saber|acertou)=P(acertou|saber)*P(saber)/P(acertar)
 resp2=1*saber/(1*saber+(1/n)*(1-saber))
 figure(1)
 
 pp=linspace(0,1,100);
 
 n=3;
 n1=1.*pp+(1/n)*(1.-pp);
 
 n=4;
 n2=1.*pp+(1/n)*(1.-pp);
 
 n=5;
 n3=1.*pp+(1/n)*(1.-pp);
 
plot(pp*100,n1*100,'-b',pp*100,n2*100,'--b',pp*100,n3*100,':b')
axis([0 100 0 100])

legend('n=3','n=4','n=5','location','northwest')
title("Probability of right answer (%)")
xlabel('p(%)')
grid on

figure(2)
pp=linspace(0,1,100);
 
n=3;
n1=1.*pp./(1.*pp+(1/n).*(1.-pp));
 
n=4;
n2=1.*pp./(1.*pp+(1/n).*(1.-pp));
 
n=5;
n3=1.*pp./(1.*pp+(1/n).*(1.-pp)); 

plot(pp*100,n1*100,'-b',pp*100,n2*100,'--b',pp*100,n3*100,':b')
axis([0 100 0 100])

legend('n=3','n=4','n=5','location','northwest')
title("Probability of knowing the answer (%)")
xlabel('p(%)')

grid on

% semilogx
% semilogy
% loglog
% logspace(0,3,1000)  x^0 a x^3


%% ex2
fprintf("ex2\n")
bytes = 100; %bytes to be received without errors when
p = 10^-2;
bits = bytes * 8;

n = bits
i = 0
p

% r=nchoosek(n,i).*p^i.*(1-p)^(n-i)
r=binomial(p,n,i);
% r=r*100;
fprintf("Determine the probability of a data packet of 100 Bytes to be received without errors when p = 10⁻²: %f%% \n", r*100)
% fprintf(r)
% fprintf("\n")




fprintf("Determine the probability of a data packet of 1000 Bytes to be received with exactly one error when p = 10⁻³: ")
fprintf("%f%%\n",100*binomial(10^-3,1000*8,1))


fprintf("Determine the probability of a data packet of 200 Bytes to be received with one or more errors when p = 10⁻⁴: ")
fprintf("%f%%\n", 100*(1-binomial(10^-4,200*8,0)))


figure(3)
xx=logspace(-8,-2,1000);
b1=binomial(xx,100*8,0);
b2=binomial(xx,200*8,0);
b3=binomial(xx,1000*8,0);
semilogx(xx,100*b1,'-b',xx,100*b2,'--b',xx,100*b3,':b')

legend('100 Bytes','200 Bytes','1000 Bytes','location','southwest')
title("Probability of packet reception without errors (%)")
xlabel('Bit Error Rate')

grid on


figure(4)
xx = linspace(64, 1518, 1000);
b1 = binomial(10^-4, xx.*8, 0);
b2 = binomial(10^-3, xx.*8, 0);
b3 = binomial(10^-2, xx.*8, 0);
plot(xx,100*b1,'-b',xx,100*b2,'--b',xx,100*b3,':b')

legend('ben=1e-4','ben=1e-3','ben=1e-2','location','southwest')
title("Probability of packet reception without errors")
xlabel('Packet size (Bytes)')

grid on