clear all;
close all;

%constants
mass_r = 62.5; % kg for height 175 cm
mass_c = 7; % mass of cycle

global mass;
mass = mass_r + mass_c;

width = .425; % shoulder broadness
height = .48; % average torso length 
ar = width .* height; %cross sectional area of body

global rho_air;
rho_air = 1.225; % average air density

%global drag_preq = rho_air .* area; 

%initial conditions
global v0;
v0= 12.5;
global P0;
P0 = 200;

res0 = P0;

arange = [(0.5)*ar:0.0001:ar]; %varying P w.r.t A ( 50% to 100% )

[area,res] = ode45(@cyclist,arange,res0);

plot(area,res);
xlabel('Area (50% to 100% of frontal area of rider at front) (m^2)');
ylabel('Power (W)');
title('Power vs frontal area of cyclist at v=12.5 m/s');

