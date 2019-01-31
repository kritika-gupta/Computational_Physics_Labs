close all
clear all

%clc

global Ms G R;
G = 4*(pi^2);
Ms = 1;

R_arr = [0.723; 1; 1.524; 5.203; 9.529; 19.19; 30.06];
T_arr = [0.62; 1; 1.88; 11.86; 29.46; 84.0; 164.79];

global x_init y_init dist axis temp_t
dist = [];
T_calc = [];
a_calc=[];
e=[];
for i=1:7
    temp_t=[];
    axis = R_arr(i);
    x_init = 0; 
    y_init = R_arr(i); 
    vx_init = sqrt(G*Ms/R_arr(i));
    vy_init = 0;
   
    tspan = [0: T_arr(i)/1000000: T_arr(i)];
   % R = R_arr(i);
    
    u=zeros(4,1);
    u(1) = x_init;
    u(2) = y_init;
    u(3) = vx_init;
    u(4) = vy_init;
    
    [t, y] = ode45(@orbit_fn, tspan, u);
    
    a = (max(y(:,1))-min(y(:,1)))/2;
    b = (max(y(:,2))-min(y(:,2)))/2;
  
    timeper = mean(temp_t);
    
    a_calc = [a_calc max(dist)/2];
    T_calc = [T_calc timeper];
    
    e = [e sqrt(1-(a*a/b*b))];
    
    
    %pause();
    plot(y(:,1), y(:,2));
    hold on;
end
%
legend('Venus', 'Earth', 'Mars', 'Jupiter', 'Saturn', 'Uranus', 'Neptune');
title('Solar system');
xlabel('x (in AU)');
ylabel('y (in AU)');


keplarratio = (T_calc.^2)./(a_calc.^3)
figure();
plot(keplarratio);

ylim([-10, 10]);
title('Ratio of T^2/a^3 for all planets');
ylabel('T^2/a^3');
