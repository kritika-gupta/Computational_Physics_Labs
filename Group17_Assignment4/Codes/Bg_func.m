function F = Bg_func(t,u)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

global Bx;
global By;
global Bz;
global m
global q
global g;
global xo;
global yo;
global time;
global max;

F = zeros(6,1);
F(1,1) = u(4);    %vx
F(2,1) = u(5);    %vy
F(3,1) = u(6);    %vz
F(4,1) = (q/m)*(F(2)*Bz - F(3)*By);   %ax
F(5,1) = g -(q/m)*(F(1)*Bz - F(3)*Bx);  %ay
F(6,1) = (q/m)*(F(1)*By - F(2)*Bx);   %az

x = (u(1)- xo).^2;
y = (u(2) - yo).^2;
z = u(3);

dist = sqrt(x+y);
%dist
if max<dist
   max = dist;
   time = t;
end

end

