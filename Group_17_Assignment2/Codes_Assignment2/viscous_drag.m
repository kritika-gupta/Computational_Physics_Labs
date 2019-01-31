% EFFECT OF VISCOUS DRAG (water)

clear all;
close all;

g = 9.8;
tstart = 0;
tend = 1000;
dt = 0.01;
npoints = (tend-tstart)/dt;

r=0.01;
density_water=1000; %kg/m^3
density_object=2000; % glass
%density_object=7874; % iron
volume=(4*pi*r^3)/3;
mass=volume.*density_object;
eta=0.00089;


% Initialize empty arrays
time = zeros(npoints,1);
vel = zeros(npoints,1);
pos = zeros(npoints,1);

% Initial values
time(1) = 0;
vel(1) = 0;
pos(1) = 0;   % considering the dropping point as frame of reference


buoyant_force=density_water*g.*volume; 


for step=1:npoints-1
      stokes_force=6*pi*eta*r*vel(step);
      net_accn= g- (buoyant_force+stokes_force)/mass;
      pos(step+1) = pos(step) + vel(step)*dt;
      vel(step+1) = vel(step) + net_accn*dt;
      time(step+1) = time(step) + dt;
end      

%analytical_pos = 0.5 * time.^2 *net_accn;

figure;
plot(time,vel,'r.');
title('Velocity vs time graph for falling glass object in water (radius=0.01 m).'); 
xlabel('time (s)');
ylabel('velocity(m/s)');


