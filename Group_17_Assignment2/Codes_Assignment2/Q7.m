clear all;

%consts 
g = 9.8;
rho_b = [ 0.1664; 0.0899; 1.250; 1.429; 1.977; ];   # densities of different gases
#          He        H      N      O2    CO2

rho_a = 1.29; # density of air 

vis_a = 0.000081; % Viscosity of air, very less so can be ignored.

rad_b = [ 0.05; 0.15; 0.25; 0.6; 1; ];   % Radii of balloon

tstart = 0;
tend = 10;
dt = 0.1;
npoints = 100;

rho = rho_b(1);
vol = 4 * pi * rad_b.^3/3; # volume of balloon
F_buo = vol.*rho_a.*g; # Buoyant Force

mass = vol .* rho; # mass of balloon
acc_b = F_buo./mass; # buoyant acceleration
acc = acc_b - g; # Net Acceleration

#declaring arrays
time = zeros(npoints,1);
position = zeros(npoints,5);
velocity = zeros(npoints,5);

for step = 1:npoints-1
   velocity(step+1,1) = velocity(step,1) + acc(1,1).*dt;
   position(step+1,1) = position(step,1) + velocity(step,1).*dt;
   velocity(step+1,2) = velocity(step,2) + acc(2,1).*dt;
   position(step+1,2) = position(step,2) + velocity(step,2).*dt;
   velocity(step+1,3) = velocity(step,3) + acc(3,1).*dt;
   position(step+1,3) = position(step,3) + velocity(step,3).*dt;
   velocity(step+1,4) = velocity(step,4) + acc(4,1).*dt;
   position(step+1,4) = position(step,4) + velocity(step,4).*dt;
   velocity(step+1,5) = velocity(step,5) + acc(5,1).*dt;
   position(step+1,5) = position(step,5) + velocity(step,5).*dt;
   time(step+1) = time(step) + dt;
end;

analytical_position = 0.5 * acc(3,1) * time.^2; # distance covered analytically 

# Computational vs Analytical Plot
plot(time,position(:,3),time,analytical_position,'r');
xlabel('time (s)');
ylabel('distance covered (m)');
title(' Analytical vs Computational Distance ( R = 25cm ) ');
legend(' Computational position ',' Analytical Position ');

# Graph of balloons with different Radii
figure;
plot(time,position(:,1),time,position(:,2),'r',time,position(:,3),'y',time,position(:,4),'k',time,position(:,5),'g');
xlabel('time (s)');
ylabel('distance covered (m)');
title(' Distance covered by balloons of different radii ( with Helium gas ) ');
legend(' R = 5 cm ',' R = 15 cm ',' R = 25 cm ','R = 60 cm',' R = 1 m');

%for different gases
vol = 4 * pi * rad_b(2).^3/3;
F_buo = vol.*rho_a.*g;

mass = vol .* rho_b;
acc_b = F_buo./mass;
acc_g = acc_b - g;  

time_g = zeros(npoints,1);
position_g = zeros(npoints,5);
velocity_g = zeros(npoints,5);

for step = 1:npoints-1
   velocity_g(step+1,1) = velocity_g(step,1) + acc_g(1,1).*dt;
   position_g(step+1,1) = position_g(step,1) + velocity_g(step,1).*dt;
   velocity_g(step+1,2) = velocity_g(step,2) + acc_g(2,1).*dt;
   position_g(step+1,2) = position_g(step,2) + velocity_g(step,2).*dt;
   velocity_g(step+1,3) = velocity_g(step,3) + acc_g(3,1).*dt;
   position_g(step+1,3) = position_g(step,3) + velocity_g(step,3).*dt;
   velocity_g(step+1,4) = velocity_g(step,4) + acc_g(4,1).*dt;
   position_g(step+1,4) = position_g(step,4) + velocity_g(step,4).*dt;
   velocity_g(step+1,5) = velocity_g(step,5) + acc_g(5,1).*dt;
   position_g(step+1,5) = position_g(step,5) + velocity_g(step,5).*dt;
   time_g(step+1) = time_g(step) + dt;
end;

# Plots of different gases with constant radius
figure;
plot(time_g,position_g(:,1),time_g,position_g(:,2),'r',time_g,position_g(:,3),'y',time_g,position_g(:,4),'k',time_g,position_g(:,5),'g');
xlabel('time (s)');
ylabel('distance covered (m)');
title(' Distance covered by balloons with different gases ( R = 25cm ) ');
legend(' Helium ',' Hydrogen ',' Nitrogen ',' Oxygen ',' Carbon Dioxide ');
