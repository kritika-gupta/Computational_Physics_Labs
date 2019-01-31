clear all;
close all;
clc;

%LC circuit
global L; global C; global Tperiod; global Io; global Qo; global R;
global Vo; global f;
tstart = 0;
tend = 60;
dt = 0.1;
tspan = [tstart:dt:tend];

C = 1;
L = 1;
R = 0.2;
Vo = 1;
%f = 0.05;
%f = 0.1592;
f = 6;
Qo = 0;
Io = 0;


%q, i
u = zeros(2,1);
u(1,1) = Qo;
u(2,1) = Io;

[t, v] = ode45(@func2, tspan, u);
% [peaks, locs] = findpeaks(v(:,1),t);



figure;
plot(t, v(:,1));
title('Charge vs time in RLC circuit');
xlabel('Time (s)');
ylabel('Charge on capacitor (F)');

figure;
plot(t, v(:,2));
title('Current vs time in RLC circuit');
xlabel('Time (s)');
ylabel('Current through circuit(A)');
