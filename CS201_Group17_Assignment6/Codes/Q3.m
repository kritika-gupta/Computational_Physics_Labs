clear all;
close all;
clc;

global m; global k; global c; global w;
%w = [0.8: 0.5: 3]; %driving freq
w = 0.1;
k = 1;
m = 1;
c = 1;
xo = 1;
vo = 1;
tstamp = [0: 0.1: 150];

amp=[];
%initial conditions array
u=zeros(2,1);
u(1,1) = xo;
u(2,1) = vo;

[t v] = ode45(@driven, tstamp, u);

pos = v(:,1);
vel = v(:,2);
%amp = [amp;max(pos)];


V = .5*k*(pos.^2);
T = .5*m*(vel.^2);

figure;
plot(t, pos, 'b', t, vel, 'r');
title(['Position and velocity vs. time, driving freq = ', num2str(w), ' rad/s']);
xlabel('time (s)');
ylabel('position (blue), velocity (red)');
legend('Position', 'Velocity');

figure;
plot(pos, vel);
title(['Phase space trajectory, driving freq = ', num2str(w), ' rad/s']);
xlabel('Position (m)');
ylabel('Velocity (m/s)');

figure;
plot(t, T, t, V, 'g');
title(['Kinetic and Potential Energy, driving freq = ', num2str(w), ' rad/s']);
legend('Kinetic Energy', 'Potential Energy');
xlabel('energy (J)');
ylabel('Time (s)');
% 
% plot([0: 0.01: 3], amp);
% title('Maximum aplitude vs. driving freq');
% xlabel('omega (rad/s)');
% ylabel('Max. amplitude (m)');

