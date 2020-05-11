clc
clear
clear all

% Using Simulator1, develop  a  MATLAB  script  to run  10 simulations
% with  the stopping criteria P=1000for each  of the  cases  defined  
% in  TableI. In  the  script,  compute  90% confidence intervals and 
% present the resultsin the form a+-b


% P = 100000;
in_L = [100 200 100 200 500 1000 500 1000];
in_C = [2 2 2 2 10 10 10 10];



fprintf('Lambda\tC\tMM1\tMG1\n')
for ciclo=1:8
    lambda = in_L(ciclo);
    C = in_C(ciclo);
    

    
    [APD] = mm1(lambda,C);  
    [MG1] = mg1(lambda,C);

 
    fprintf('%.2d\t%.2d\t%.4f\t%.4f\n',lambda,C,APD, MG1)

end
