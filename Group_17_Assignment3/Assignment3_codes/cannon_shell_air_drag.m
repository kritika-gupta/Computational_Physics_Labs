clear all;
close all;
% Cannon shell problem with air drag and reduced air density

global g_o;
global R;

g_o = -9.8;
R = 6400000;
tstart=0;
tend=180;
dt=0.01;
npoints=(tend-tstart)/dt;
v_init = 750;
%theta = [pi/12:2*pi/45:(5*pi)/12];
theta = pi/3;
max_range = 0;
max_angle = 0;

% for each theta
for i=1:length(theta)
    u_init = zeros(4,1);
    u_init(1,1) = 0; % x_o
    u_init(2,1) = 0; % y_o
    u_init(3,1) = v_init*cos(theta(i)); % vx_o
    u_init(4,1) = v_init*sin(theta(i)); % vy_o
    [t,u]=ode45(@cannon_air_drag, [tstart:dt:tend], u_init);
    
    for step=1:npoints-1
          if(u(step,2)<0)
            break;
        end
    end
    range = u(step,1);  % x coordinate 
    if range>max_range
        max_range = range;
        max_angle = theta(i);
    end
    
    x = u(1:step-1,1);
    y = u(1:step-1,2);

    plot(x,y);
    ax = gca;
    ax.YAxis.Exponent = 0;
    ax.XAxis.Exponent = 0;
    grid on;
    xlabel('Position along x (m)');
    ylabel('Position along y (m)');
    title('Position along y vs position along x');
    %legend('Without air drag and air density variation', 'With air drag and air density variation');
    %legend('15','23', '31', '39', '47', '55', '63', '71');

%    hold on;
end

max_range
max_angle*(180/pi)

figure;
%subplot(2,2,2);
plot(t(1:step-1,1), u(1:step-1, 3));
grid on;
xlabel('Time (s)');
ylabel('Velocity along x (m/s)');
title('Velocity along x vs time');

figure;
%subplot(2,2,3);
plot(t(1:step-1),u(1:step-1, 4));
grid on;
xlabel('Time (s)');
ylabel('Velocity along x(m/s)');
title('Velocity along y vs time');
