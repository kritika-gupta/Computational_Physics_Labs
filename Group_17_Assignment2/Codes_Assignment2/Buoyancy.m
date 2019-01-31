% EFFECT OF BUOYANCY (air)

clear all;
close all;

g = -9.8; % g is taken with negative sign
tstart = 0;
tend = 1;
dt = 0.01;
npoints = (tend-tstart)/dt;

r=[0.01; 50; 100];
density_air=1.225; %kg/m^3
%density_object=2000; % glass
density_object=7874; % iron
volume=(4*pi*r.^3)/3;
mass=volume.*density_object;


% Initialize empty arrays
time = zeros(npoints,1);
vel = zeros(npoints,3);
pos = zeros(npoints,3);

% Initial values
time(1) = 0;
vel(1,:) = 0;
pos(1,:) = 0;   % considering the dropping point as frame of reference

buoyant_force=density_air*g.*volume;
net_accn= g+ (buoyant_force)./mass;
size(net_accn)
size(vel)

for step=1:npoints-1
    for j=1:3
      pos(step+1,j) = pos(step,j) + vel(step,j)*dt;
      vel(step+1,j) = vel(step,j) + net_accn(j)*dt;
      time(step+1) = time(step) + dt;
    end
end      

analytical_pos = 0.5 * time.^2 *(g + (density_air*4*pi*r(1)^3*g)/(3*mass(1)));
%analytical_vel = (g - (density*4*pi*r^3*g)/(3*mass)) * time;

figure;
plot(time,pos(:,1),'r.',time, analytical_pos);
title('Position vs time graph for free falling object');
xlabel('time (s)');
ylabel('position(m)');
legend('Computational', 'Analytical');

figure;
plot(time, pos(:,1), 'r.', time, pos(:, 2), 'g+', time, pos(:,3), 'b');
title('Position vs time graph for free falling object of different radii.');
legend('R=0.05', 'R=0.5', 'R=1');
xlabel('time (s)');
ylabel('position(m)');

net_accn
