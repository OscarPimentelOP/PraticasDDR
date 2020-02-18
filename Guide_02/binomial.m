function [b] = binomial(p,n,i)
%BINOMIAL Summary of this function goes here
%   Detailed explanation goes here


[b]=nchoosek(n,i).*p.^i.*(1-p).^(n-i);

end

