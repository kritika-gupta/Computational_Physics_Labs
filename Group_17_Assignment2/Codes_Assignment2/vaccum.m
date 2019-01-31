% MOTION IN VACUUM

g = -9.8;
v_init = 50;
tstart = 0;
tend = 20;
dt = 0.09;
npoints = (tend-tstart)/dt;

% initialize empty arrays
height = zeros(npoints,1);
vel = zeros(npoints, 1);
time = zeros(npoints, 1);

height(1) = 0;  % object thrown from ground;
vel(1) = v_init;
time(1) = tstart;

for step=1:npoints-1
      height(step+1) = height(step) + vel(step)*dt;
      vel(step+1) = vel(step) + g*dt;
      time(step+1) = time(step) + dt;
      if(vel(step+1)<0)
            max_height=height(step);
            max_time = time(step);
            
      end
      if(height(step+1) < 0)
            break;
      end
end

height(step+1) = 2*height(step) - height(step-1);
vel(step+1) = 2*vel(step) - vel(step-1);
      
analytical_height = v_init*time + (.5*g*(time.^2));
analytical_vel = v_init + g*time;
figure;
plot(time(1:step+1), height(1:step+1), 'r.', time(1:step+1), analytical_height(1:step+1));     
xlabel('time (s)');
ylabel('height (m)');
legend('Computational', 'Analytical');
title('Height vs. time plot of body thrown vertically in vacuum');

figure;
plot(time(1:step+1), vel(1:step+1), 'r.', time(1:step+1), analytical_vel(1:step+1) , 'g');
xlabel('time (s)');
ylabel('velocity (m/s)');
legend('Computational', 'Analytical');
title('Velocity vs. time plot of body thrown vertically in vacuum');