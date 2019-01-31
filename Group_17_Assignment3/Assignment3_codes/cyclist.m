function der = cyclist(time,res);

global rho_air;
global mass;
global v0;

der = [ rho_air .* mass .* v0.^3 ];