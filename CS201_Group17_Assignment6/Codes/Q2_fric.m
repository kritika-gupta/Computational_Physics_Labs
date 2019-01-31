clear all;
%close all;
clc;

global m; global k; global c; global omega; global beta; global f;
%f =0;
f = 0.1*9.8;

k = 1;
m = 1;
c = 0.2;
xo = 0;
vo = 10;

omega=sqrt(k/m);
beta=c/(2*m);
timePeriod=2*pi/omega

%Time
tStart=0;
tEnd=10*timePeriod;

dt=timePeriod/100;
tSpan=[tStart:dt:tEnd];

%initial conditions array
u=zeros(2,1);
u(1,1) = xo;
u(2,1) = vo;

options = odeset('RelTol', 1e-8);
[t v] = ode15s(@fric, tSpan, u);

pos = v(:,1);
vel = v(:,2);
grid on;


plot(t, pos);
title('Position vs. time');
xlabel('time (s)');
ylabel('horizontal position (m)');
legend('No damping, with friction', 'Damping and friction');
hold on;
 
% figure;
% plot(t, vel);
% title('Velocity vs. time');
% xlabel('time');
% ylabel('velocity (m/s)');
% legend('No damping, no friction', 'No damping, with friction', 'Damping and friction');
% 
% figure;
% plot(pos, vel);
% title('Phase space trajectory');
% xlabel('Position (m)');
% ylabel('Velocity (m/s)');
% legend('No damping, no friction', 'No damping, with friction', 'Damping and friction');