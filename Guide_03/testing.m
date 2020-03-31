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



clc
clear all

N = 60;     % mobile nodes
S = 3;      % speed of mobile nodes
W = 60;     % radio range in meters
dlt = 1;   %  dlt - time slot duration (in seconds)
T = 7200;     %  T -   no. of time slots of the simulation
%AP = [50 50; 250 100; 450 150];   %  matrix with one row per AP node and 2 columns where the
                        %  first column has the horizontal coordinates and the
                        %  second column has the vertical coordinates of the AP nodes
AP = [250 100];   %  matrix with one row per AP node and 2 columns where the
                        %  first column has the horizontal coordinates and the
                        %  second column has the vertical coordinates of the AP nodes
pl = 0;  




[AvgAvail, MinAvail]=simulatorFunction(N,S,W,dlt,T,AP,pl)


% clc
% clear all
% [AvgAvail, MinAvail]= simulatorFunction(20,20,100,60,10,[250,100],2)
% 
% 
% 
% clc
% clear all
% [AvgAvail, MinAvail]= simulatorFunction(20,20,100,60,10,[50,50;250,100],2)


