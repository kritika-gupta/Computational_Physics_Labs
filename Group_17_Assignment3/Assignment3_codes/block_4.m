function F = block(t,u)
F = zeros(2,1);
global g;
global theta;
global a_kin

F(1) = u(2); % dx/dt = vx
F(2) = a_kin; % d(vx)/dt 

end