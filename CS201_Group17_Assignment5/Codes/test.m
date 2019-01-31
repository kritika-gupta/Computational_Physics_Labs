clear all;
close all;


%Charging a capacitor
Qo = 0;
R = 5;
C = 0.1;
V = 2;

tstart = 0;
tend = 2.5;
dt = 0.1;
n = (tend - tstart)/dt;

Q = zeros(n,1);
I = zeros(n,1);
time = zeros(n,1);

Q(1) = Qo;
I(1) = V/R;
%Euler method:
for step=1:n-1
    Q(step+1) = Q(step) - ((Q(step)-(V*C))/(R*C))*dt;
    I(step+1) = I(step) - (I(step)/(R*C))*dt;
    time(step+1) = time(step)+ dt;
end

figure;
plot(time, Q);
title('Charge on capacitor in charging RC circuit');
xlabel('Time (t)');
ylabel('Charge (F)');
hold on;

figure;
plot(time, I);
title('Current through RC circuit');
xlabel('Time (s)');
ylabel('Current (A)');
hold on;