% Lab 4 Q1 
clear all;
%close all;
clc;

global Bx;
global By;
global Bz;
global Ex;
global Ey;
global Ez;
global m;
global q;
q = 3;
m = 10;

tspan = [0: 0.1: 100];
% inital conditions array 
u = zeros(6,1);
%x,y,z,vx,vy,vz;

vx = 1; vy = 0; vz = 0;
Ex = 0; Ey = 1; Ez = 0;
Bx = 0; By = 0; Bz = 1;

u(1)=0;
u(2)=0;
u(3)=0;
u(4)=vx;
u(5)=vy;
u(6)=vz;

[t v] = ode45(@EM_func, tspan, u);
plot3(v(:,1), v(:,2), v(:,3), 'r');
grid on;
xlabel('Position along x');
ylabel('Position along y');
zlabel('Position along z');
legend('mass = 5','mass = 10');
title('vx = 1; vy = 0; vz = 0; Ex = 0; Ey = 1; Ez = 0; Bx = 0; By = 0; Bz = 1;');
hold on;