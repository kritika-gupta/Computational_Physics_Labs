clear all;

% sliding block on an inclined plane, withour friction
global g;
g = 9.8;

global mu_s;
mu_s = 0.4;
global mu_k;
mu_k = 0.3;
 
tstart=0;
tend=1000;
dt=0.01;
npoints=(tend-tstart)/dt;

global theta;
theta = pi/6;   % angle of inclination 
len = 100;      % length on inclined plane 

global a_stat;
a_stat= g.*sin(theta) - mu_s.*g.*cos(theta);    % static acceleration
global a_kin;
a_kin= g.*sin(theta) - mu_k.*g.*cos(theta);     % kinetic acceleration 

u = zeros(2,1);
u(1) = 0;   %x
u(2) = a_stat.*dt;   %vx
[t,v]=ode45(@block_4, [tstart:dt:tend], u);

for step=1:npoints-1
    if(v(step,1)>=len)
        break;
    end
end

 figure;
 plot(t(1:step-1),v(1:step-1,1), 'r');
 title('Position down the inclined plane vs. time');
 xlabel('Time (s)');
 ylabel('Position (m)');
% legend('Frictionless plane', 'With static and kinetic friction');

figure;
plot(t(1:step-1),v(1:step-1,2),'r');
title('Velocity down the inclined plane vs. time');
xlabel('Time (s)');
ylabel('Velocity (m/s)');
%legend('Frictionless plane', 'With static and kinetic friction');