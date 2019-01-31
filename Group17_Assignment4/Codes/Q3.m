% Lab 4 Q3
clear all;
close all;
clc;

global m;
global q;

global Bx;
global By;
global Bz;
global Ex;
global Ey;
global Ez;

q = 3;
m = 5;

tspan = [0: 0.01: 50];

% inital conditions array 
u = zeros(6,1);
%x,y,z,vx,vy,vz

vx = 0; vy = 1; vz = 0;
Ex = 0; Ey = 0; Ez = 0;
Bx = 0; By = 0; Bz = 1;

u(1)=0;
u(2)=0;
u(3)=0;
u(4)=vx;
u(5)=vy;
u(6)=vz;

[t v] = ode45(@E_func2, tspan, u);

plot3(v(:,1), v(:,2), v(:,3), 'b');
grid on;
xlabel('Position along x');
ylabel('Position along y');
zlabel('Position along z');
title('vx = 0; vy = 1; vz = 0; Ex = 200*sin((q/m)*t); Ey = 0; Ez = 0;Bx = 0; By = 0; Bz = 1');

% 
% figure;
% plot(t, v(:,1));
% title('Position along x');
% 
% figure;
% plot(t, v(:,2));
% title('Position along y');
% 
% figure;
% plot(t, v(:,4));
% title('Velocity along x');
%  
