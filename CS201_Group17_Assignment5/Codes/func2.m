function F = func2(t,u)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
global L; global C; global Io; global Tperiod; global Vo; global f; global R;

F = zeros(2,1);
 
F(1,1) = u(2);    % dq/dt = i
F(2,1) = ((Vo*sin(2*pi*f*t))/L)-u(1)/(L*C)-(R*F(1,1))/L;  %di/dt = V/L-q/LC -(R/L)dq/dt


end
