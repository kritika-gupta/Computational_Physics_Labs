clear all;
close all;

g = 9.8;
range= 1000;
height=[-2000:1:2000];

firing_vel=zeros(length(height),1);
for i=1:length(height)
    v_min=1e7;
    firing_vel(i)=v_min;
   
    phi = 1;
    for theta=(1:0.01:89).*pi/180
        if(tan(theta)>(height(i)/range))
            vel=sqrt((g*(range.^2))/((range*sin(2*theta))-(2*height(i)*cos(theta)*cos(theta))));
        end
        if(vel<v_min)
            v_min=vel;
        end
    end
    firing_vel(i)=v_min;
end


plot(height,firing_vel);
xlabel('Altitude of target(m)');
ylabel('Minimum firing velocity(m/s)');
title('Variation of minimum firing velocity with altitude of target');