clear all;

% Cannon shell problem 

global g_o;
global R;

g_o = -9.8;
R = 6400000;
tstart=0;
tend=180;
dt=0.01;
npoints=(tend-tstart)/dt;
v_init = 750;
theta = pi/3;

u_init = zeros(4,1);
u_init(1,1) = 0; % x_o
u_init(2,1) = 0; % y_o
u_init(3,1) = v_init*cos(theta); % vx_o
u_init(4,1) = v_init*sin(theta); % vy_o
[t,u]=ode45(@cannon, [tstart:dt:tend], u_init);


% for step=1:npoints-1
%     if(u(step,2)<0)
%         break;
%     end
% end

x = u(:,1);
y = u(:,2);

%x_analytical = v_init*cos(theta)*t(1:step-1,1);
%y_analytical = v_init*sin(theta)* t(1:step-1,1) + .5*g_o* t(1:step-1,1).^2;

%subplot(2,2,1);

%plot(t(1:step-1),y,'r');
plot(x,y,'b');
grid on;
ax = gca;
ax.YAxis.Exponent = 0;
ax.XAxis.Exponent = 0;
xlabel('Time (s)');
ylabel('Position along y (m)');
title('Projectile motion with variation in gravitational acceleration.');
%legend('With variation in g', 'Constant g');
%hold on;

%legend('Without air drag and air density variation', 'With air drag and air density variation');
%hold on;

% figure;
% subplot(2,2,2);
% plot(t(1:step-1,1), y, 'r.', t(1:step-1,1), y_analytical);
% grid on;
% xlabel('Time (s)');
% ylabel('Position along y (m)');
% title('Posiiton along y vs time');
% 
% figure;
% subplot(2,2,3);
% plot(t(1:step-1),x);
% grid on;
% xlabel('Time (s)');
% ylabel('Position along x(m)');
% title('Position along x vs time');


