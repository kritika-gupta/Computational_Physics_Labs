clear all;
close all;
% sliding block on an inclined plane, withour friction
global g;
g = 9.8;

tstart=0;
tend=1000;
dt=0.03;
npoints=(tend-tstart)/dt;

global theta;
theta = pi/6;   % angle of inclination 
len = 100;      % length on inclined plane 

u = zeros(2,1); % initial values
u(1) = 0;   %x
u(2) = 0;   %vx
[t,v]=ode45(@block, [tstart:dt:tend], u);

for step=1:npoints-1
    if(v(step,1)>=len)  % block reaches the end of inclined plane
        break;
    end
end

x_analytical = u(1) + .5*g*sin(theta)*t(1:step-1).^2;
%v_analytical = u(2) + g*sin(theta)*t(1:step-1);
v_analytical = sqrt(2*g*sin(theta)*v(1:step-1,1));  % v= sqrt(2gsin(theta)x)
% figure;
% plot(t(1:step-1),v(1:step-1,1));
% title('Position down the inclined plane vs. time');
% xlabel('Time (s)');
% ylabel('Position (m)');


figure;
plot(t(1:step-1),v(1:step-1,2));
title('Velocity down the inclined plane vs. time');
xlabel('Time (s)');
ylabel('Velocity (m/s)');
hold on;
%legend('Computational', 'Analytic');


