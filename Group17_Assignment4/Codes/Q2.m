% Lab 4 Q2 
clear all;
close all;
clc;


global Bx;
global By;
global Bz;
global m;
global q;
global xo;
global yo;
global max;
global time;
xo= 0; yo = 0;
max = 0;
global g;
g = -9.8; 

q = 1.6e-19;
m = 9.1e-31;

T = 1000;
k = 1.38064852e-23;

tspan = [0: 1e-10: 5*1e-5];
% inital conditions array 
u = zeros(6,1);
%x,y,z,vx,vy,vz

vx = sqrt((k*T)/m); vy = 0; vz = 0;
Bx = 0; By = 0; Bz = 0.00005;

u(1)=xo;
u(2)=yo;
u(3)=300000;
u(4)=vx;
u(5)=vy;
u(6)=vz;

[t v] = ode45(@Bg_func, tspan, u);

plot3(v(:,1), v(:,2), v(:,3));
title('Motion under B field and gravity on Earth');
xlabel('Position along x');
ylabel('Position along y');
zlabel('Position along z');
grid on;

% figure;
% plot(t,v(:,1));

