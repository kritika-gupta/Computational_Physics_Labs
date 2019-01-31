clear all;
close all;

%varying velocity w.r.t power
%constants
mass_r = 62.5; % kg, height 175 cm
mass_c = 7; % mass of cycle

global mass;
mass = mass_r + mass_c;

width = .425; % shoulder broadness
height = .48; % average torso length 
global ar;
ar = width .* height; %cross sectional area of body

global rho_air;
rho_air = 1.225; % average air density

%global drag_preq = rho_air .* area; 

%initial conditions
global v0;
v0= 0;
global P0;
P0 = 400;
v = 5;

global F0;
F0 = P0/v;

tstamp = [0:0.1:100];

[time,res] = ode45(@cyclist_d,tstamp,v0);

figure;
plot(tstamp,res(:,1));
xlabel('Time (s)');
ylabel('Velocity(m/s)');
title('Velocity vs time graph for cyclist');
