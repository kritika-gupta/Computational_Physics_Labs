function F = func(t,u)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
global L; global C; global Io; global Tperiod;

F = zeros(2,1);
 
F(1,1) = u(2);    % dq/dt = i
F(2,1) = -u(1)/(L*C);  %di/dt = -q/LC



end

