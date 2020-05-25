clc
clear
clear all

% Using Simulator1, develop  a  MATLAB  script  to run  10 simulations
% with  the stopping criteria P=1000for each  of the  cases  defined  
% in  TableI. In  the  script,  compute  90% confidence intervals and 
% present the resultsin the form a+-b

n_simulations = 10;

P = 100000;
% P=1000; %MAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAALLLLLLLLLLLLLLLLLLLLLLLLL

C= 10;
f= 10000;

n_simulations = 1;
p=1;
lambdas = [250 500 750 1000 1250 1350 1450 1550 1650 1750 2000 2250 2500];
lambdas_size = size(lambdas,2);

res_PL_F = zeros(1,lambdas_size);
res_APD_F = zeros(1,lambdas_size);
res_MPD_F = zeros(1,lambdas_size);
res_TT_F = zeros(1,lambdas_size);

res_term_PL_F = zeros(1,lambdas_size);
res_term_APD_F = zeros(1,lambdas_size);
res_term_MPD_F = zeros(1,lambdas_size);
res_term_TT_F = zeros(1,lambdas_size);



fprintf('Lambda\tC\tf\tPacketLoss\t\tAverageDelay\t\tMaximumDelay\t\tTransm.Through.\n')
for i=1:lambdas_size
    i
    lambda = lambdas(i);


    PLs  = zeros(1,n_simulations);
    APDs = zeros(1,n_simulations);
    MPDs = zeros(1,n_simulations);
    TTs  = zeros(1,n_simulations);

    for j = 1:n_simulations
        [PLs(j) , APDs(j) , MPDs(j) , TTs(j)] = Simulator1(lambda,C,f,P);  
    end


    alfa= 0.1; %90% confidence interval%

    res_PL_F(i) = mean(PLs);
    res_APD_F(i) = mean(APDs);
    res_MPD_F(i) = max(MPDs);
    res_TT_F(i)  = mean(TTs);

    res_term_PL_F(i) = norminv(1-alfa/2)*sqrt(var(PLs)/n_simulations);
    res_term_APD_F(i) = norminv(1-alfa/2)*sqrt(var(APDs)/n_simulations);
    res_term_MPD_F(i) = norminv(1-alfa/2)*sqrt(var(MPDs)/n_simulations);
    res_term_TT_F(i) = norminv(1-alfa/2)*sqrt(var(TTs)/n_simulations);

    % fprintf('lambda = %.2d  C = %.2d  f = %.2d\n',lambda,C, f)

%         fprintf('Lambda\tC\tf\tPacketLoss\t\tAverageDelay\t\tMaximumDelay\t\tTransm.Through.\n')
%     fprintf('%.2d\t%.2d\t%.2d\t%.2f +- %.4f\t\t%.2f +- %.3f\t\t%.2f +- %.3f\t\t%.2f +- %.4f\n',lambda,C, f,PL,term_PL,APD,term_APD,MPD,term_MPD,TT,term_TT)

end
fprintf('Lambda\tC\tf\tPacketLoss\t\tAverageDelay\t\tMaximumDelay\t\tTransm.Through.\n')
for i=1:lambdas_size

fprintf('%.2d\t%.2d\t%.2d\t%.2f +- %.4f\t\t%.2f +- %.3f\t\t%.2f +- %.3f\t\t%.2f +- %.4f\n',lambdas(i),C, f,res_PL_F(i),res_term_PL_F(i),res_APD_F(i),res_term_APD_F(i),res_MPD_F(i),res_term_MPD_F(i),res_TT_F(i),res_term_TT_F(i))
end













f=100000



res_PL_G = zeros(1,lambdas_size);
res_APD_G = zeros(1,lambdas_size);
res_MPD_G = zeros(1,lambdas_size);
res_TT_G = zeros(1,lambdas_size);

res_term_PL_G = zeros(1,lambdas_size);
res_term_APD_G = zeros(1,lambdas_size);
res_term_MPD_G = zeros(1,lambdas_size);
res_term_TT_G = zeros(1,lambdas_size);



% fprintf('Lambda\tC\tf\tPacketLoss\t\tAverageDelay\t\tMaximumDelay\t\tTransm.Through.\n')
for i=1:lambdas_size
    i
    lambda = lambdas(i);


    PLs  = zeros(1,n_simulations);
    APDs = zeros(1,n_simulations);
    MPDs = zeros(1,n_simulations);
    TTs  = zeros(1,n_simulations);

    for j = 1:n_simulations
        [PLs(j) , APDs(j) , MPDs(j) , TTs(j)] = Simulator1(lambda,C,f,P);  
    end


    alfa= 0.1; %90% confidence interval%

    res_PL_G(i) = mean(PLs);
    res_APD_G(i) = mean(APDs);
    res_MPD_G(i) = max(MPDs);
    res_TT_G(i)  = mean(TTs);

    res_term_PL_G(i) = norminv(1-alfa/2)*sqrt(var(PLs)/n_simulations);
    res_term_APD_G(i) = norminv(1-alfa/2)*sqrt(var(APDs)/n_simulations);
    res_term_MPD_G(i) = norminv(1-alfa/2)*sqrt(var(MPDs)/n_simulations);
    res_term_TT_G(i) = norminv(1-alfa/2)*sqrt(var(TTs)/n_simulations);

    % fprintf('lambda = %.2d  C = %.2d  f = %.2d\n',lambda,C, f)

%         fprintf('Lambda\tC\tf\tPacketLoss\t\tAverageDelay\t\tMaximumDelay\t\tTransm.Through.\n')
%     fprintf('%.2d\t%.2d\t%.2d\t%.2f +- %.4f\t\t%.2f +- %.3f\t\t%.2f +- %.3f\t\t%.2f +- %.4f\n',lambda,C, f,PL,term_PL,APD,term_APD,MPD,term_MPD,TT,term_TT)

end
fprintf('Lambda\tC\tf\tPacketLoss\t\tAverageDelay\t\tMaximumDelay\t\tTransm.Through.\n')
for i=1:lambdas_size

fprintf('%.2d\t%.2d\t%.2d\t%.2f +- %.4f\t\t%.2f +- %.3f\t\t%.2f +- %.3f\t\t%.2f +- %.4f\n',lambdas(i),C, f,res_PL_G(i),res_term_PL_G(i),res_APD_G(i),res_term_APD_G(i),res_MPD_G(i),res_term_MPD_G(i),res_TT_G(i),res_term_TT_G(i))
end














figure(1)
plot(lambdas, res_PL_F,'-b', lambdas, res_PL_G,'-r')
% axis([250 2500 0 30])
legend('Packet Loss f=10000 Bytes','Packet Loss f=100000 Bytes','location','northwest')
title("Packet Loss (%)")
xlabel('Packet Rate (pps)')
ylabel('Packet Loss (%)')
grid on
xlim([250, 2500]);
ylim([0, 30]);


figure(2)
plot(lambdas, res_APD_F,'-b',lambdas, res_MPD_F,'--b',lambdas, res_APD_G,'-r',lambdas, res_MPD_G,'--r')
% axis([250 2500 0 83])
legend('Average Packet Delay f=10000 Bytes','Maximum Packet Delay f=10000 Bytes','Average Packet Delay f=100000 Bytes','Maximum Packet Delay f=100000 Bytes','location','northwest')
title("Average and Maximum Packet Delay (ms)")
xlabel('Packet Rate (pps)')
ylabel('ms')
grid on
xlim([250, 2500]);
ylim([0, 83]);

figure(3)
plot(lambdas, res_TT_F, '-b',lambdas, res_TT_G, '-r')
% axis([250 2500 0 11])
legend('Transmitted Throughput f=10000 Bytes','Transmitted Throughput f=100000 Bytes','location','northwest')
title("Transmitted  Throughput (Mbps)")
xlabel('Packet Rate (pps)')
ylabel("Transmitted  Throughput (Mbps)")
grid on
xlim([250, 2500]);
ylim([0, 11]);
