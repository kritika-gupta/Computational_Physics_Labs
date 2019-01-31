function F= damped( t, u )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

global k; global m; global c; global j; global eq_time;

F = zeros(2,1);
F(1,1) = u(2,1); %velocity
F(2,1) = (-k/m)*u(1,1) + (-c(j)/m)*u(2,1); %accn
if( t < eq_time)
    if(abs(F(2,1)) < 0.0001)
        eq_time = t;
    end
end

end

