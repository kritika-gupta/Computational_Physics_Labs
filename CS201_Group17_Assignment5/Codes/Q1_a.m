clear all;
close all;


%Charging a capacitor
Qo = 0;
%R = [2.5, 5, 10];
R = 5;
%C = [0.05, 0.1, 0.2];
C = 0.1;
V = [1,2,4];

tstart = 0;
tend = 2.5;
dt = 0.05;
n = (tend - tstart)/dt;

Q = zeros(n,3);
I = zeros(n,3);
time = zeros(n,3);

for k=1:3

Q(1, k) = Qo;
I(1, k) = V(k)/R;
%Euler method:
for step=1:n-1
    
    Q(step+1,k) = Q(step,k) - ((Q(step,k)-(V(k)*C))/(R*C))*dt;
    I(step+1,k) = I(step,k) - (I(step,k)/(R*C))*dt;
    time(step+1,k) = time(step,k)+ dt;
end

%Q_analytical = C*V*(1-exp(-time./(R.*C)));
%I_analytical = (V/R)*(exp(-time./(R.*C)));

end

figure;
plot(time, Q);%, time, Q_analytical, 'r');
title('Charge on capacitor in charging RC circuit, dt=.05');
xlabel('Time (t)');
ylabel('Charge (F)');
% legend('R=2.5 ohm', 'R=5 ohm', 'R=10 ohm');
%legend('C=0.05 F', 'C=0.1 F', 'C=0.2 F'); 
legend('V = 1V','V = 2V', 'V = 4V');
% legend('Computational', 'Analytical');
% hold on;

figure;
plot(time, I);%, time, I_analytical, 'r');
title('Current through RC circuit, dt=.05');
xlabel('Time (s)');
ylabel('Current (A)');
%legend('R=2.5 ohm', 'R=5 ohm', 'R=10 ohm');
%legend('C=0.05 F', 'C=0.1 F', 'C=0.2 F'); 
legend('V = 1V','V = 2V', 'V = 4V');
% legend('Computational', 'Analytical');
% hold on;
