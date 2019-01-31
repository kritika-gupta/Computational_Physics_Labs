function der = cyclist_a(time,res);

der = zeros(2,1);

global rho_air;
global P0;
global mass;

der(1) = 0.01;     %dA/dt
der(2) = P0./(mass .* res(2)) - (rho_air .* res(1) .* res(2).^2)./(2*mass);    %dv/dt  = P/mv - .5*rho*a*v.^2