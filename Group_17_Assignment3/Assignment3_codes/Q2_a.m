clear all;
%close all;

%varying velocity w.r.t power

%constants
mass_r = 62.5; % kg for height 175 cm
mass_c = 7; % mass of cycle

global mass;
mass = mass_r + mass_c;

width = .425; % shoulder broadness
height = .48; % average torso length 
%global ar;
%ar = width .* height; %cross sectional area of body

global rho_air;
rho_air = 1.225; % average air density

%global drag_preq = rho_air .* area; 

%initial conditions
global v0;
v0= 5;
global P0;
P0 = 400;
%res0 = [P0 ; v0];
A0 = 0.20;
res0 = [A0; v0];

tstamp = [0:0.01:50]; 

[time,res] = ode45(@cyclist_a,tstamp,res0);

% %figure;
% plot(res(:,1),res(:,2));
% %xlabel('Power (Watts)');
% xlabel('Area (m/s^2)');
% ylabel('Velocity (m/s)');
% title('Velocity of cyclist vs. area graph');
%                  

figure;
plot(tstamp,res(:,2),'b');
xlabel('Time (s)');
ylabel('Velocity (m/s)');
title('Velocity of cyclist vs. time graph');
