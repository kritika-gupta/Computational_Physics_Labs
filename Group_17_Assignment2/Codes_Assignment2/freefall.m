clear all;
close all;
clear;

%g = -9.8;  %earth
g = -1.622; %moon
tstart = 0;
tend = 200;
dt = 0.05;
npoints = (tend-tstart)/dt;

%Initialize empty arrays 
time = zeros(npoints,1);
vel = zeros(npoints,1);
pos = zeros(npoints,1);

%Inital conditions
time(1) = 0;
vel(1) = 0;
pos(1) = 100;

for step=1:npoints-1
    pos(step+1) = pos(step) + vel(step)*dt;
    vel(step+1) = vel(step) + g*dt;
    time(step+1) = time(step) + dt;
    if(pos(step+1)<0)
      break;
    end
     
end

analytical_pos = pos(1)+ 0.5*(time.^2)*g;
analytical_vel = g.*time;

figure;
set(gca, "fontsize", 12);
plot(time(1:step+1),pos(1:step+1),'r.',time(1:step+1),analytical_pos(1:step+1));
title('Position vs. time graph for free falling body on moon');
xlabel('time (s)');
ylabel('position(m)');
legend('Computational', 'Analytical');

figure;
set(gca, "fontsize", 12);
plot(time(1:step+1),vel(1:step+1),'r.',time(1:step+1),analytical_vel(1:step+1));
title('Velocity vs. time graph for free falling body on moon');
xlabel('time (s)');
ylabel('velocity(m/s)');
legend('Computational', 'Analytical');




