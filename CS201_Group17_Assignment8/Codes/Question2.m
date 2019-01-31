close all;
clear all;


%constants in AUs
R = 1;
v_init = 0.8*2*pi; %*0.72/0.62;
Me = 3.003*1e-6;
G = 4*(pi^2);
Ms = 1;

%time in years
tstart = 0;
tend = 5;
dt = .001;
npoints = (tend-tstart)/dt;

%arrays
x = zeros(npoints, 1);
y = zeros(npoints, 1);
vx = zeros(npoints, 1);
vy = zeros(npoints, 1);
r = zeros(npoints, 1);
time = zeros(npoints,1);
y(1) = R;
vx(1) = v_init;

for step=1:npoints
    r(step) = sqrt(x(step)^2+y(step)^2);
    vx(step+1) = vx(step) - (G*Ms*x(step)*dt)/(r(step)^3);
    x(step+1) = x(step) + vx(step+1)*dt;
    vy(step+1) = vy(step) - (G*Ms*y(step)*dt)/(r(step)^3);
    y(step+1) = y(step) + vy(step+1)*dt;
    time(step+1) = time(step)+dt;
end
max(x);
max(y);
plot(x, y);
title('Orbit of the earth around sun');
xlabel('x (AU)');
ylabel('y (AU)');
xlim([-3,3]);
ylim([-3,3]);

vel = sqrt(vx.^2+vy.^2);
pos = sqrt(x.^2+y.^2);

%Area
dtheta = atan(y./x);
t1=150;
t2=90;
%area covered between t1 and t2
meanx = (x(t2)+x(t1))/(t2-t1);
meany = (y(t2)+y(t1))/(t2-t1);
area = (dtheta(t2)-dtheta(t1))*(meanx^2+meany^2)



% figure();
% plot(time, vel);
% title('Velocity of planet around the sun');
% xlabel('time (years)');
% ylabel('vel (AU)');
% xlim([0 5]);
% 
% figure();
% plot(pos, vel);
% 
% KE = (0.5)*Me*(vx.^2+vy.^2);
% PE = -G*Me*Ms./(sqrt(x.^2+y.^2));
% 
% plot(time, KE*1e5, 'b');
% title('Kinetic Energy');
% xlabel('Time (in years)');
% ylabel('Energy (*1e-5) (in AU)');
% xlim([0, 5]);
% legend('Elliptical', 'Circular');


% figure();
% plot(time, PE*1e5, 'b');
% title('Potential Energy');
% xlabel('Time (in years)');
% ylabel('Energy (*1e-5) (in AU)');
% xlim([0, 5]);
% legend('Elliptical', 'Circular');

% 
% figure();
% plot(time, (KE+PE)*1e5, 'b');
% title('Total Energy');
% xlabel('Time (in years)');
% ylabel('Energy (*1e-5) (in AU)');
% xlim([0, 5]);
% ylim([-10,10]);
% xlim([0, 5]);
% legend('Elliptical', 'Circular');
% hold on;
