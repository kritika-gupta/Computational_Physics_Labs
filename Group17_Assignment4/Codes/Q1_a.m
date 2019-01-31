% Lab 4 Q1
% Motion of charged particle under Electric field 
clear all;
close all;
clc;

global Ex;
global Ey;
global Ez;

global m;
global q;
q = 1.6e-19;
m = 9.1e-31;
tspan = [0: 1e-10: 1e-5];
% inital conditions array 
u = zeros(6,1);
%x,y,z,vx,vy,vz
Ex = 1; Ey = 0; Ez = 0;
vx = 1; vy= 0; vz = 0;
u(1)=1;
u(2)=1;
u(3)=1;
u(4)=vx;
u(5)=vy;
u(6)=vz;

[t v] = ode45(@E_func, tspan, u);

plot3(v(:,1), v(:,2), v(:,3));
grid on;
xlabel('Position along x');
ylabel('Position along y');
zlabel('Position along z');
title('vx = 1; vy= 0; vz = 0; Ex = 1; Ey = 0; Ez =0; Positive charge');