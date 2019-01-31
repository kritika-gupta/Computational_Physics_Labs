function F= oscillator( t, u )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

global k; global m; global i; global j;

F = zeros(2,1);
F(1,1) = u(2,1);
F(2,1) = (-k/m)*u(1,1);

end

