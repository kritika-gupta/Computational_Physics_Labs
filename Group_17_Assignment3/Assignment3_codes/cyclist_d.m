function der = cyclist_d(time,res);

der = zeros(1,1);

global rho_air;
global mass;
global ar;
global F0;
global P0;

if(P0>=F0*res(1))

      der(1) = F0./mass;


else
 
     der(1) = P0./(mass .* res(1)) - (rho_air .* ar .* res(1).^2)./(2*mass);    %dv/dt  = P/mv - .5*rho*a*v.^2
end
end
