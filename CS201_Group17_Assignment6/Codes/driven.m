function F= driven( t, u )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

global k; global m; global c; global j; global w;

F = zeros(2,1);
F(1,1) = u(2,1);
F(2,1) = (-k/m)*u(1,1) + (-c/m)*u(2,1) + (1/m)*1*sin(w*t); 

end