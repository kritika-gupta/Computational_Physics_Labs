clear all;
close all;
clc;

%Charging a capacitor
Qo = 0;
Ro = 5;
C = 0.1;
V = 2;

tstart = 0;
tend = 2.5;
dt = 0.1;
n = (tend - tstart)/dt;

Q = zeros(n,1);
R = zeros(n,1);
I = zeros(n,1);
time = zeros(n,1);

Q(1) = Qo;
I(1) = V/Ro;
R(1) = Ro;
%Euler method:
for step=1:n-1
    R(step+1) = R(step) + 2*Ro*.1*I(step)*(I(step)/(Ro*(1+.1*I(step).^2)*C))*dt;
    Q(step+1) = Q(step) - ((Q(step)-(V*C))/(R(step)*C))*dt;
    I(step+1) = I(step) - (I(step)/(R(step)*C))*dt;
    time(step+1) = time(step)+ dt;
end

figure;
plot(time, Q, 'r');
title('Charge on capacitor in charging RC circuit');
xlabel('Time (t)');
ylabel('Charge (F)');


figure;
plot(time, I, 'r');
title('Current through RC circuit');
xlabel('Time (s)');
ylabel('Current (A)');

figure;
plot(time, R);