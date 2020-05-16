%function [AvgAvail, MinAvail]= simulatorFunction(N,S,W,dlt,T,AP,pl)
% [AvgAvail, MinAvail]= simulatorFunction(N,AP,S,W,dlt,T,pl)
% Input parameters:
%  N -   no. of mobile nodes
%  S -   maximum absolute speed of mobile nodes (in km/h)
%  W -   radio range (in meters)
%  dlt - time slot duration (in seconds)
%  T -   no. of time slots of the simulation
%  AP -  matrix with one row per AP node and 2 columns where the
%        first column has the horizontal coordinates and the
%        second column has the vertical coordinates of the AP nodes
%  pl -  plot option: 0 - nothing;
%                     1 - nodes' movement;
%                     2 - nodes' movement and connectivity
% Output parameters:
%  AvgAvail - average availability among all mobile nodes
%  MinAvail - minimum availability among all mobile nodes

% Results with 1 AP:
% 
% N=60, S=3, W= 40, Average Availability = 24.5%, Minimum availability = 5.1%
% N=60, S=3, W= 60, Average Availability = 87.9%, Minimum availability = 72.2%
% 
% Results with 3 APs:
% 
% N=60, S=3, W= 40, Average Availability = 50.9%, Minimum availability = 27.1%
% N=60, S=3, W= 60, Average Availability = 97.3%, Minimum availability = 91.2%

clc
clear all

% N = 60;     % mobile nodes
% S = 3;      % speed of mobile nodes
% W = 60;     % radio range in meters
dlt = 1;   %  dlt - time slot duration (in seconds)
T = 7200;     %  T -   no. of time slots of the simulation
% AP = [50 50; 250 100; 450 150];   %  matrix with one row per AP node and 2 columns where the
                        %  first column has the horizontal coordinates and the
                        %  second column has the vertical coordinates of the AP nodes
% AP = [250 100];   %  matrix with one row per AP node and 2 columns where the
                        %  first column has the horizontal coordinates and the
                        %  second column has the vertical coordinates of the AP nodes
pl = 0;  

AP = [50 25; 50 125; 150 100; 250 50; 250 175; 350 100; 450 25; 450 125];

% N=60; 
% S=6;
% W=80;

% [AvgAvail, MinAvail]=simulatorFunction(N,S,W,dlt,T,AP,pl);

aveT=0;
minT=0;

vezes=2;
for W=[40 60]
S=3;

for N=[40 80]
    vezes = 10; %number of simulations
    averages = zeros(1,vezes); %vector with N simulation results
    minimuns = zeros(1,vezes);
    for it= 1:vezes
    [averages(it), minimuns(it)]= simulatorFunction(N,S,W,dlt,T,AP,pl);
    end

    alfa= 0.1; %90% confidence interval%
    ave = mean(averages);
    min = mean(minimuns);

    term_ave = norminv(1-alfa/2)*sqrt(var(averages)/vezes);
    term_min = norminv(1-alfa/2)*sqrt(var(minimuns)/vezes);

    fprintf('N = %.2d  S = %.2d  W = %.2d\n',N,S, W)
    fprintf('average = \n%.2f\n +- \n%.2f\n',100*ave,100*term_ave)
    fprintf('minumum = \n%.2f\n +- \n%.2f\n',100*min,100*term_min)
    
end

end