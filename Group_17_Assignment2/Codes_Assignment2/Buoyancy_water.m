% EFFECT OF BUOYANCY (water)

clear all;
close all;

g = 9.8;
tstart = 0;
tend = 1;
dt = 0.01;
npoints = (tend-tstart)/dt;

r=0.01;
density_water=1000; %kg/m^3
density_air=1.225; %kg/m^3
%density_object=2000; % glass
density_object=7874; % iron
volume=(4*pi*r^3)/3;
mass=volume.*density_object;


% Initialize empty arrays
time = zeros(npoints,1);
vel = zeros(npoints,2);
pos = zeros(npoints,2);

% Initial values
time(1) = 0;
vel(1,:) = 0;
pos(1,:) = 0;   % considering the dropping point as frame of reference
net_accn=zeros(1,2);
buoyant_force_water=density_water*g.*volume;
net_accn(1,1)= g- (buoyant_force_water)./mass;

buoyant_force_air=density_air*g.*volume;
net_accn(1,2)= g- (buoyant_force_air)./mass;

for step=1:npoints-1
      pos(step+1,1) = pos(step,1) + vel(step,1)*dt;
      vel(step+1,1) = vel(step,1) + net_accn(1,1)*dt;
      time(step+1) = time(step) + dt;
      pos(step+1,2) = pos(step,2) + vel(step,2)*dt;
      vel(step+1,2) = vel(step,2) + net_accn(1,2)*dt;
      time(step+1) = time(step) + dt;
end      

figure;
plot(time,pos(:,1),'r.',time, pos(:,2));
title('Position vs time graph for falling object in water and air.'); 
xlabel('time (s)');
ylabel('position(m)');
legend('Water', 'Air');
