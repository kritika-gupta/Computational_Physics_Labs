% Lab 4 Q1 
clear all;
close all;
clc;

global Bx;
global By;
global Bz;
global m;
global q;
q = 3;
m = 5;


tspan = [0: 0.1: 100];
% inital conditions array 
u = zeros(6,1);
%x,y,z,vx,vy,vz

vx = 0; vy = 1; vz = 1;
Bx = 1; By = 1; Bz = 0;

u(1)=0;
u(2)=0;
u(3)=0;
u(4)=vx;
u(5)=vy;
u(6)=vz;

[t v] = ode45(@B_func, tspan, u);

plot3(v(:,1), v(:,2), v(:,3));
grid on;
xlabel('Position along x');
ylabel('Position along y');
zlabel('Position along z');
title('vx = 0; vy = 1; vz = 1; Bx= 1; By = 1; Bz = 0;');
