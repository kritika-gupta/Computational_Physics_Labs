clear all;
%close all;
clc;

global m; global k; global j; global i;
% k = [0.2; 1; 6];
% m = [0.2; 1; 6];
k = 1;
m = 1;
xo = 0;
vo = 1;

tstamp = [0: 1: 25];
n = 25/0.1;
% pos = zeros(n, 3);
% vel = zeros(n, 3);

%initial conditions array
u=zeros(2,1);

u(1,1) = xo;
u(2,1) = vo;

j = 2;
i = 2;
[t v] = ode45(@oscillator, tstamp, u);

pos = v(:,1);
vel = v(:,2);

% [a b]=findpeaks(pos);
% t(b);
% a;
% time = [0:0.0001:25];


% figure;
%plot(t, pos, 'g');%, time, sin(time), 'r');
%title('Position vs. time, dt = 0.1');
%xlabel('time (s)');
%ylabel('horizontal position (m)');
%legend('m = 0.2 kg', 'm = 1 kg', 'm = 6 kg');
%legend('k = 0.2 ', 'k = 1', 'k = 6');
% legend('xo = 0, vo = 1', 'xo = 1, vo = 1', 'xo = 1, vo = 0');


% %figure;
% plot(t, vel, 'g');%,time, cos(time), 'g');
% title('Velocity vs. time, dt = 0.1');
% xlabel('time');
% ylabel('velocity (m/s)');
%legend('m = 0.2 kg', 'm = 1 kg', 'm = 6 kg'); 
%legend('Position', 'Velocity');
%legend('k = 0.2 ', 'k = 1', 'k = 6');
% legend('xo = 0, vo = 1', 'xo = 1, vo = 1', 'xo = 1, vo = 0');

% plot(pos, vel, 'g');
% hold on;
% p = gradient(pos);
% q = gradient(vel); 
% quiver(pos(1:100:end), vel(1:100:end), p(1:100:end), q(1:100:end), 0, 'r');
% title('Phase space trajectory, xo = 1, vo = 1');
% xlabel('Position (m)');
% ylabel('Velocity (m/s)');
% %legend('m = 0.2 kg', 'm = 1 kg', 'm = 6 kg');
% %legend('k = 0.2 ', 'k = 1', 'k = 6');
% hold on; 


Eo = 0.5*m*(vo^2)  + 0.5*k*(xo^2);
E = 0.5*m*(vel.^2)  + 0.5*k*(pos.^2);
E_error = (E-Eo)/Eo;

plot(t, E_error, 'b');
title('Error fraction in energy');
xlabel('time');
ylabel('Error fraction in energy');  
legend('dt = 0.1', 'dt = 1');

hold on;
