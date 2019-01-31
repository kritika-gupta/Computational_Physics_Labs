function F = cannon(t,u);
F = zeros(4,1);
global g_o;
global R;
height = u(2,1);
%g = g_o/((1+(height/R)).^2);
g = g_o;
F(1,1) = u(3,1); %dx/dt = vx
F(2,1) = u(4,1); %dy/dt = vy
F(3,1) = 0; % d(vx)/dt
F(4,1) = g; %d(vy)/dt


end