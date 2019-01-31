function F = orbit_fn(t,u)

global Ms G 
global x_init y_init dist axis temp_t

F = zeros(4,1);
F(1) = u(3);    %dx/dt
F(2) = u(4);    %dy/dt
R = sqrt(u(1)^2 + u(2)^2);
F(3) = (-G*Ms/R^3)*u(1);
F(4) = (-G*Ms/R^3)*u(2);

x=u(1);
y=u(2);

d = sqrt((x-x_init)^2 + (y-y_init)^2);
maj = 2*axis;

dist=[dist d];
if(abs(d-maj)<0.1)
    temp_t = [temp_t t*2];
end


