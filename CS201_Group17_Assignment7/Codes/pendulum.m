close all;
clear all;

global l1; global l2; global m1; global m2;

l1 = 1; 
l2 = 2;
m1 = 2;
m2 = 1;

tstamp = [0:0.01:100];
u = zeros(4,1);

u1 = [pi/12; pi/6; pi/4; pi/3; pi/2]; %theta1
u2 = [pi/12; pi/6; pi/4; pi/3; pi/2]; %theta2

u(1,1) = pi/2; %theta1
u(2,1) = pi/2; %theta2
u(3,1) = 0; %omega1
u(4,1) = 0.0; %omega2
options = odeset('RelTol', 1.0e-6);
[t,v] = ode45(@dp,tstamp,u, options);

t1 = v(:,1);
t2 = v(:,2);
w1 = v(:,3);
w2 = v(:,4);

x1 = l1*sin(v(:,1));
y1 = -l1*cos(v(:,1));
x2 = l1*sin(v(:,1)) + l2*sin(v(:,2));
y2 = -l1*cos(v(:,1)) - l2*cos(v(:,2));
% 
% g = 9.8;
% T = 0.5*m1*(l1^2)*(w1.^2) + (0.5)*m2*((l1^2)*(w1.^2) + (l2^2)*(w2.^2) + 2*(l1*l2*(w1.*w2).*cos(t1-t2)));
% V = -(m1+m2)*g*l1*cos(t1) - m2*g*l2*cos(t2);
% E = T+V;
% 
% T1 = 0.5*m1*(l1^2)*(w1.^2);
% V1 = -m1*9.8*l1*cos(t1);
% E1 = T1+ V1;
% 
% figure();
% plot(t, T+V); ylim([-70 10]);
% title(['Total energy of the system, theta1 = ',num2str(u(1,1)),'rad, theta2 = ', num2str(u(2,1)),'rad']);
% xlabel('Time (s)');
% ylabel('Energy (Joules)');
% 
% 
% figure();
% plot(x1, y1);
% title(['x-y space of Pendulum 1, theta1 = ',num2str(u(1,1)),'rad, theta2 = ', num2str(u(2,1)),'rad']); 
% xlabel('x (m)'); ylabel('y (m)');
% 

figure();
plot(x2,y2);
title(['x-y space of pendulum 2, theta1 = ',num2str(u(1,1)),'rad, theta2 = ', num2str(u(2,1)),'rad']);
xlabel('x (m)'); ylabel('y (m)');



% figure();
% title('px-y space of endulum 2'); xlabel('x (m)'); ylabel('y (m)');
% h2 = animatedline;
% h1 = animatedline;
% for k = 1:length(x2);
%     addpoints(h2,x2(k),y2(k));
%     %addpoints(h1,x1(k),y1(k));
%     drawnow
% end    

figure();
plot(t, t1); title('Angular displacement of first pendulum vs. Time'); xlabel('Time (s)'); ylabel('Theta1 (rad)');

figure();
plot(t, t2); title('Angular displacement of second pendulum vs. Time'); xlabel('Time (s)'); ylabel('Theta2 (rad)');
