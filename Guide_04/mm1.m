function APD = mm1(lambda,C)
%MM1 Summary of this function goes here
%   Detailed explanation goes here

p64 = 0.16;
p1518=0.22;
pEq = (1-0.22-0.16);

media_pacote = 64*p64+1518*p1518 + pEq*(65+1517)/2; % bytes
media_pacote = media_pacote / 125000; % Megabit

u=C/media_pacote;


APD=1000/(u-lambda);
end

