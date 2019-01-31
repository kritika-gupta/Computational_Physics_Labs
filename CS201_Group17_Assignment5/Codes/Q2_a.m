clear all;
%close all;
clc;

% R-L circuit
R = 10;
L = 5;
tstart = 0;
tend = 2.5;
dt = 0.1;
V = 2;

n = (tend-tstart)/dt;

Vr = zeros(n,1);
Vl = zeros(n,1);
I = zeros(n,1);
time = zeros(n,1);

Vr(1) = 0;
Vl(1) = V;
I(1) = 0;
for step=1:n-1
    I(step+1) = I(step) + ((V - I(step)*R)/L)*dt;
    Vr(step+1) = Vr(step) + ((R/L)*(V - Vr(step)))*dt;
    Vl(step+1) = Vl(step) - ((R/L)*(V - Vr(step)))*dt;
    time(step+1) = time(step) + dt;
end

Vr_analytical = V.*(1 - exp(-(R.*time)./L));
Vl_analytical = V*exp(-(R.*time)./L);

I_analytical = Vr_analytical/R;
di_dt = Vl/L;


% figure;
plot(time, Vr, 'g');%, time, Vr_analytical, 'r');
title('Voltage across resistor in RL circuit, time step = .1s');
xlabel('Time (s)');
ylabel('Vr (V)');
% %legend('Computational', 'Analytical');
% %legend('R = 5 ohm', 'R = 10 ohm', 'R = 15 ohm');
% legend('L = 2.5 H', 'L = 5 H', 'L = 10 H');
legend('V = 0.5V', 'V = 1V', 'V = 2V');
hold on; 

% figure;
% plot(time, Vl, 'g');%, time, Vl_analytical, 'r');
% title('Voltage across inductor in RL circuit, , time step = .1s');
% xlabel('Time (s)');
% ylabel('Vl (V)');
% legend('Computational', 'Analytical');
% legend('R = 5 ohm', 'R = 10 ohm', 'R = 15 ohm');
% legend('L = 2.5 H', 'L = 5 H', 'L = 10 H');
% legend('V = 0.5V', 'V = 1V', 'V = 2V');
% hold on; 


% % figure;
% plot(time, I, 'g');%, time, I_analytical, 'r');
% title('Current in RL circuit, dt = .1s');
% xlabel('Time (s)');
% ylabel('I (Amp)');
% legend('Computational', 'Analytical');
% legend('R = 5 ohm', 'R = 10 ohm', 'R = 15 ohm');
% legend('L = 2.5 H', 'L = 5 H', 'L = 10 H');
% legend('V = 0.5V', 'V = 1V', 'V = 2V');
% hold on;

% plot(time, di_dt, 'g');
% title('di/dt in RL circuit, time step = .1s');
% xlabel('Time (s)');
% ylabel('I/s (Amp/s)');
% %legend('R = 5 ohm', 'R = 10 ohm', 'R = 15 ohm');
% %legend('L = 2.5 H', 'L = 5 H', 'L = 10 H');
% legend('V = 0.5V', 'V = 1V', 'V = 2V'); 
% hold on;

