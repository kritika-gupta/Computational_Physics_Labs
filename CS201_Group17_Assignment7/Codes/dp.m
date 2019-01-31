function F = dp(t,u)

global m1 m2 l1 l2;

th1 = u(1);
th2 = u(2);
om1 = u(3);
om2 = u(4);

g = 9.8;

a = (m1 + m2)*l1;
b = m2*l2*cos(th1 - th2);
c = m2*l1*cos(th1 - th2);
d = m2*l2;
e = -m2*l2*(om2*om2)*sin(th1 - th2) - g*(m1+m2)*sin(th1);
f = m2*l1*(om1*om1)*sin(th1 - th2) - g*m2*sin(th2);

F = zeros(4,1);

F(1) = u(3,1);    %d(th1)/dt = om1
F(2) = u(4,1);    %d(th2)/dt = om2
F(3) = (d*e - b*f)/(a*d - b*c);
F(4) = (a*f - c*e)/(a*d - c*b);