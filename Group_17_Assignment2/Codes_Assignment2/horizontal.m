% HORIZONTAL MOTION WITH CONSTANT VELOCITY

clear all;
close all;

v_init = 50;  %inital constant velocity
dt = 0.001;
tstart = 0;
tend = 1;
npoints=(tend-tstart)/dt;

%initialize empty arrays
time = zeros(npoints,1);
pos = zeros(npoints,1);

%initial values
time(1) = 0;
pos(1) = 0;

for step=1:npoints-1
    pos(step + 1) = pos(step) + v_init*dt;
    time(step +1) = time(step) + dt;
end

analytical = time * v_init;

figure;
plot(time,pos,'r.',time,analytical);
title(strcat(strcat('Position vs time plot for uniform motion (dt=',num2str(dt),')')));
xlabel('time(s)');
ylabel('distance(m)');
legend('computational distance','analytical distance');

