function F = EM_func(t,u)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

global Bx;
global By;
global Bz;
global Ex;
global Ey;
global Ez;
global m
global q


F = zeros(6,1);
F(1,1) = u(4);    %vx
F(2,1) = u(5);    %vy
F(3,1) = u(6);    %vz
F(4,1) = (q/m)*(Ex+(F(2)*Bz - F(3)*By));   %ax
F(5,1) = -(q/m)*(Ey+(F(1)*Bz - F(3)*Bx));  %ay
F(6,1) = (q/m)*(Ez+(F(1)*By - F(2)*Bx));   %az

end

