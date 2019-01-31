function F = E_func(t,u)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

global Ex;
global Ey;
global Ez;
global m
global q


F = zeros(6,1);
F(1,1) = u(4);
F(2,1) = u(5);
F(3,1) = u(6);
F(4,1) = (q*Ex)/m;
F(5,1) = (q*Ey)/m;
F(6,1) = (q*Ez)/m;

end

