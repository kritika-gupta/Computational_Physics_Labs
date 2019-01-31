function F = block(t,u)
F = zeros(2,1);
global g;
global theta;

F(1) = u(2); % dx/dt = vx

F(2) = g*sin(theta);  % d(vx)/dt = ax = gsin(theta)

end