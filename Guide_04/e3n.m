clc
clear
clear all

% Using Simulator1, develop  a  MATLAB  script  to run  10 simulations
% with  the stopping criteria P=1000for each  of the  cases  defined  
% in  TableI. In  the  script,  compute  90% confidence intervals and 
% present the resultsin the form a+-b

n_simulations = 10;
P = 100000;

% n_simulations = 1;
% P = 5;

in_L = [200 200 200 200 200 200 1000 1000 1000 1000 1000 1000];
in_C = [2 2 2 2 2 2 10 10 10 10 10 10];
in_F = [100000 100000 100000 10000 10000 10000 100000 100000 100000 10000 10000 10000];
in_N = [5 10 15 5 10 15 25 50 75 25 50 75];

fprintf('Lambda\tC\tf\tn\tmg1D\t\tmg1V\t\tAverageDelayD\t\tAverageDelayV\t\tMaxDelayD\t\tMaxDelayV\tTransm.Through.\n')
for ciclo=1:size(in_L,2)
% for ciclo=[6 12]
    lambda = in_L(ciclo);
    C = in_C(ciclo);
    f = in_F(ciclo);
    n = in_N(ciclo);

    PLs  = zeros(1,n_simulations);
    APDs = zeros(1,n_simulations);
    MPDs = zeros(1,n_simulations);
    PLVs  = zeros(1,n_simulations);
    APDVs = zeros(1,n_simulations);
    MPDVs = zeros(1,n_simulations);
    TTs  = zeros(1,n_simulations);

    for i = 1:n_simulations
        [PLs(i), PLVs(i), APDs(i), APDVs(i), MPDs(i), MPDVs(i), TTs(i)] = Simulator3(lambda,n,C,f,P);  
    end


    alfa= 0.1; %90% confidence interval%

    PL = mean(PLs);
    APD = mean(APDs);
    MPD = max(MPDs);
    PLV = mean(PLVs);
    APDV = mean(APDVs);
    MPDV = max(MPDVs);
    TT  = mean(TTs);

    term_PL = norminv(1-alfa/2)*sqrt(var(PLs)/n_simulations);
    term_APD = norminv(1-alfa/2)*sqrt(var(APDs)/n_simulations);
    term_MPD = norminv(1-alfa/2)*sqrt(var(MPDs)/n_simulations);
    term_PLV = norminv(1-alfa/2)*sqrt(var(PLVs)/n_simulations);
    term_APDV = norminv(1-alfa/2)*sqrt(var(APDVs)/n_simulations);
    term_MPDV = norminv(1-alfa/2)*sqrt(var(MPDVs)/n_simulations);
    term_TT = norminv(1-alfa/2)*sqrt(var(TTs)/n_simulations);
    
    [mg1data, mg1voip] = mg1_2filas(lambda,C,n);

    % fprintf('lambda = %.2d  C = %.2d  f = %.2d\n',lambda,C, f)

%         fprintf('Lambda\tC\tf\tPacketLoss\t\tAverageDelay\t\tMaximumDelay\t\tTransm.Through.\n')
    fprintf('%.2d\t%.2d\t%.2d\t%.2d\t%.2f\t\t%.2f\t\t%.2f +- %.3f\t\t%.2f +- %.3f\t\t%.2f +- %.3f\t\t%.2f +- %.3f\t%.2f +- %.4f\n',lambda,C, f,n,mg1data,mg1voip,APD,term_APD,APDV,term_APDV,MPD,term_MPD,MPDV,term_MPDV,TT,term_TT)
%            lamb    c     f     n     mg1D  mg1v        aver d      aver v            max d            thr
end
