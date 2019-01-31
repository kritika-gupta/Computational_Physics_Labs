clear all

#constants
a = 10;  
b = 1;

#initial values
tstart = 0;
tend = 15;
v_init = 0;
dt = 0.1;
npoints = 150;

#declaring arrays
time = zeros(150,1);
velocity = zeros(150,1);
accl = zeros(150,1);
position = zeros(150,1);
accl(1,1) = 10;

for step = 1:npoints-1
    velocity(step+1) = velocity(step) + accl(step)*dt;       # acceleration also differs here
    position(step+1) = position(step) + velocity(step).*dt;
    accl(step+1) = a - b*velocity(step+1);                   # change in acceleration 
    time(step+1) = time(step) + dt;
end

analytical_velocity = (a*(1 - exp(-1*b.*time)))/b;
analytical_position = ( (a*time)/b + (a * exp(-1*b*time))/b.^2 - a/b.^2);

plot(time,velocity,'r',time,analytical_velocity,'b');
xlabel('time (s)');
ylabel('velocity (m/s)');
title(' Velocity of a person using parachute ');
legend(' Computational Velocity ',' Analytical Velocity ');

figure;
plot(time,position,'r',time,analytical_position);
xlabel('time (s)');
ylabel('distance covered (m)');
title(' Distance covered using the parachute ');
legend(' Computational position ',' Analytical Position ');
