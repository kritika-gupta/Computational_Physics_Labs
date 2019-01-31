clear all;
%close all;
clc;

%LC circuit
global L; global C; global Tperiod; global Io;

C = 1;
L = 1;
Qo = 4;
Io = 0;

tstart = 0;
tend = 20;
dt = 0.01;
tspan = [tstart:dt:tend];

%q, i
u = zeros(2,1);
u(1,1) = Qo;
u(2,1) = Io;

[t, v] = ode45(@func, tspan, u);
% [peaks, locs] = findpeak(v(:,1),t);
% timeperiod = locs(2)-locs(1);
% freq = 1/timeperiod


% 
% plot(t, v(:,1), 'r');
% title('Charge vs time');
% xlabel('Time (s)');
% ylabel('Charge on capacitor(F)');
% legend('Qo = 1C', 'Qo = 4C');
% hold on;


 plot(t, v(:,2), 'r');
 title('Current vs time');
 xlabel('Time (s)');
 ylabel('Current through inductor (A)');
 legend('Qo = 1C', 'Qo = 4C');
% legend('L = 1H, C = 1F', 'L = 0.8H, C = 5F');
 hold on;