clc
clear
clear all

% Using Simulator1, develop  a  MATLAB  script  to run  10 simulations
% with  the stopping criteria P=1000for each  of the  cases  defined  
% in  TableI. In  the  script,  compute  90% confidence intervals and 
% present the resultsin the form a+-b

n_simulations = 10;

P = 1000;
P = 100000;
in_L = [100 200 100 200 500 1000 500 1000];
in_C = [2 2 2 2 10 10 10 10];
in_F = [100000 100000 10000 10000 100000 100000 10000 10000];


fprintf('Lambda\tC\tf\tPacketLoss\t\tAverageDelay\t\tMaximumDelay\t\tTransm.Through.\n')
for ciclo=1:8
    lambda = in_L(ciclo);
    C = in_C(ciclo);
    f = in_F(ciclo);



    PLs  = zeros(1,n_simulations);
    APDs = zeros(1,n_simulations);
    MPDs = zeros(1,n_simulations);
    TTs  = zeros(1,n_simulations);

    for i = 1:n_simulations
        [PLs(i) , APDs(i) , MPDs(i) , TTs(i)] = Simulator1(lambda,C,f,P);  
    end


    alfa= 0.1; %90% confidence interval%

    PL = mean(PLs);
    APD = mean(APDs);
    MPD = max(MPDs);
    TT  = mean(TTs);

    term_PL = norminv(1-alfa/2)*sqrt(var(PLs)/n_simulations);
    term_APD = norminv(1-alfa/2)*sqrt(var(APDs)/n_simulations);
    term_MPD = norminv(1-alfa/2)*sqrt(var(MPDs)/n_simulations);
    term_TT = norminv(1-alfa/2)*sqrt(var(TTs)/n_simulations);

    % fprintf('lambda = %.2d  C = %.2d  f = %.2d\n',lambda,C, f)

%         fprintf('Lambda\tC\tf\tPacketLoss\t\tAverageDelay\t\tMaximumDelay\t\tTransm.Through.\n')
    fprintf('%.2d\t%.2d\t%.2d\t%.2f +- %.2f\t\t%.2f +- %.2f\t\t%.2f +- %.2f\t\t%.2f +- %.2f\n',lambda,C, f,PL,term_PL,APD,term_APD,MPD,term_MPD,TT,term_TT)

end
