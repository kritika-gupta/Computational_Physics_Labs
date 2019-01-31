function F = cannon_air_drag(t,u);
F = zeros(4,1);
global g_o;
global R;
height = u(2,1);
yo = 1000;
%g = g_o/((1+(height/R)).^2);
g = g_o;
Bm = -4e-5;
v = sqrt( u(3,1)^2 + u(4,1)^2 );

F(1,1) = u(3,1); %dx/dt = vx
F(2,1) = u(4,1); %dy/dt = vy
F(3,1) = Bm*u(3,1)*v*exp(-height/yo); % d(vx)/dt
F(4,1) = g + Bm*u(4,1)*v*exp(-height/yo); %d(vy)/dt
end