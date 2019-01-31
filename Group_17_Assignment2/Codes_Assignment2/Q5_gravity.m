% VARIATION OF g WITH HEIGHT

clear all;
close all;

tstart = 0;
tend = 100;
dt = 0.01;
npoints = (tend-tstart)/dt;

r=1;
R=6400000; 
density_air=1.225; %kg/m^3
%density_object=2000; % glass
density_object=7874; % iron
volume=(4*pi*r^3)/3;
%mass=volume*density_object;
mass=100;
g0=9.8;

% Initialize empty arrays
time = zeros(npoints,1);
vel = zeros(npoints,1);
pos = zeros(npoints,1);
pos_const_g = zeros(npoints,1);
vel_const_g = zeros(npoints,1);

% Initial values
time(1) = 0;
vel(1) = 0;
pos(1) = 20000;   %object is dropped from a height of 20km
pos_const_g(1) = 20000;

for step=1:npoints-1
      g=g0/(1+(pos(step)/R)).^2;
      
      buoyant_force_const_g=density_air*volume.*g0;
      buoyant_force=density_air*volume.*g;
      net_accn= g-(buoyant_force)./mass;
      
      pos(step+1) = pos(step) - vel(step)*dt;
      vel(step+1) = vel(step) + net_accn*dt;
      time(step+1) = time(step) + dt;
      
      pos_const_g(step+1) = pos_const_g(step) - vel_const_g(step)*dt;
      vel_const_g(step+1) = vel_const_g(step) + (g0-((buoyant_force_const_g)./mass))*dt;
      vel_const_g(step+1) = vel_const_g(step) + g0*dt;
            
      if(pos(step+1)<0)
        break;
      end;
end      


figure;
plot(time(1:step+1),pos(1:step+1),'r',time(1:step+1), pos_const_g(1:step+1));
title('Position vs time graph for free falling object');
xlabel('time (s)');
ylabel('position(m)');
legend('Varying g', 'constant g');
%legend('Computational', 'Analytical');
