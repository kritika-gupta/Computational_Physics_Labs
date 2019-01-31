close all;
clear all;


%constants in AUs
R = 1;
v_init = 2*pi; %*0.72/0.62;
Me = 3.003*1e-6;
G = 4*(pi^2);
Ms =1;
%time in years
tstart = 0;
tend = 1;
dt = .001;
npoints = (tend-tstart)/dt;

for n=3:3
    k = [0.6; 0.8; 1; sqrt(2)];
%arrays
x = zeros(npoints, 1);
y = zeros(npoints, 1);
vx = zeros(npoints, 1);
vy = zeros(npoints, 1);
r = zeros(npoints, 1);
time = zeros(npoints, 1);
x(1) = R;
vy(1) = k(n)*v_init;

for step=1:npoints
    r(step) = sqrt(x(step)^2+y(step)^2);
    vx(step+1) = vx(step) - (v_init^2*x(step)*dt)/(r(step)^3);
    x(step+1) = x(step) + vx(step+1)*dt;
    vy(step+1) = vy(step) - (v_init^2*y(step)*dt)/(r(step)^3);
    y(step+1) = y(step) + vy(step+1)*dt;
    time(step+1)=time(step)+dt;
end

if(max(x)>max(y))
    a=max(x);
    b=max(y);

else
    a=max(y);
    b=max(x);
end

e = sqrt(1-(b*b/a*a))
KE = (0.5)*Me*(vx.^2+vy.^2);
PE = -G*Me*Ms./(sqrt(x.^2+y.^2));
% 
plot(x, y);
title('Orbit of the earth around sun, dt = 0.001');
xlabel('x (AU)');
ylabel('y (AU)');
% legend('v init = 0.2*v init_{circular}','v init = 0.8*v init_{circular}','v init = 1*v init_{circular}','v init = 1.5*v init_{circular}');
% hold on
% % xlim([-1,1]);
% % ylim([-1,1]);


% plot(time, KE+PE);
% title('Total Energy');
% xlabel('Time (in years)');
% ylabel('Energy (in AU)');
% legend('v init = 0.6*v init_{circular}','v init = 0.8*v init_{circular}','v init = 1*v init_{circular}','v init = 1.5*v init_{circular}');
% hold on
end



    