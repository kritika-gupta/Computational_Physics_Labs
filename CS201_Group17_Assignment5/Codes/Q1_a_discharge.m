clear all;
close all;
clc;

%Discharging a capacitor
Qo = 1;
R = 1;
C = 0.2;
V = 0;

tstart = 0;
tend = 2;
dt = 0.05;
n = (tend - tstart)/dt;

Q = zeros(n,1);
I = zeros(n,1);
time = zeros(n,1);

Q(1) = Qo;

Io = -Qo/(R*C);
I(1) = Io;

%Euler method:
for step=1:n-1
    Q(step+1) = Q(step) + (-Q(step)/(R*C))*dt;
    I(step+1) = I(step) + (-I(step)/(R*C))*dt;
    time(step+1) = time(step)+ dt;
end

%Analytical solution
Q_analytical = Qo*exp(-time./(R*C));
I_analytical = Io*exp(-time./(R*C));
figure;
plot(time, Q, time, Q_analytical, 'r');
title('Charge on capacitor in discharging RC circuit, dt=.05');
xlabel('Time (t)');
ylabel('Charge (F)');
legend('Computational', 'Analytical');


figure;
plot(time, I, time, I_analytical, 'r');
title('Current through discharging RC circuit, dt=.05');
xlabel('Time (s)');
ylabel('Current (A)');
legend('Computational', 'Analytical');
