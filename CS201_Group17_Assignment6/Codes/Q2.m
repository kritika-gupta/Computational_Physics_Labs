clear all;
%close all;
clc

global m; global k; global c; global j; global eq_time;
eq_time = 5000;
k = 1;
m = 1;
c = [0; .8; 2; 5];
c = 2.2;
xo = 1;
vo = 0;

%Time
tStart=0;
tEnd=50
dt=0.01;
tstamp=[tStart:dt:tEnd];

%initial conditions array
u=zeros(2,1);
u(1,1) = xo;
u(2,1) = vo;


for j=1:1
    
omega = sqrt(k/m);
beta = c(j)/(2*m);
T = (2*pi)/sqrt(omega^2 - beta^2)
    
    
[t v] = ode45(@damped, tstamp, u);

pos(:,j) = v(:,1);
vel(:,j) = v(:,2);
end

ncycle = tEnd/T;
amp = [];
for x=1:ceil(T/dt):(tEnd/dt)-ceil(T/dt)
    xarray = pos(x:x+ceil(T/dt), 1);
    amp=[amp; max(xarray)]
end

plot(amp, 'g');
title('Maximum amplitude vs. number of cycles');
xlabel('No. of cycles');
ylabel('Max. amplitude');
legend('c = 0.2', 'c = 0.8', 'c = 2.2');
hold on;
% 
% figure;
% plot(t, pos);
% %legend(['c = ',num2str(c(1))], ['c = ',num2str(c(2))], ['c = ',num2str(c(3))], ['c = ',num2str(c(4))]);
% %legend('k=1, m=1', 'k=10, m=1');
% %legend('k=1, m=1', 'k=1, m=3');
% title('Position vs. time');
% xlabel('time (s)');
% ylabel('horizontal position (m)');
% grid on;
% %hold on;
% 
% figure;
% plot(t, vel);
% title('Velocity vs. time');
% legend(['c = ',num2str(c(1))], ['c = ',num2str(c(2))], ['c = ',num2str(c(3))], ['c = ',num2str(c(4))]);
% xlabel('time');
% ylabel('velocity (m/s)');
% grid on;
% 
% figure;
% plot(pos, vel);
% % hold on;
% % p = gradient(pos);
% % q = gradient(vel); 
% % quiver(pos(1:10:end), vel(1:10:end), p(1:10:end), q(1:10:end));
% title('Phase space trajectory');
% legend(['c = ',num2str(c(1))], ['c = ',num2str(c(2))], ['c = ',num2str(c(3))], ['c = ',num2str(c(4))]);
% xlabel('Position (m)');
% ylabel('Velocity (m/s)');
% grid on;
% 
% eq_time
