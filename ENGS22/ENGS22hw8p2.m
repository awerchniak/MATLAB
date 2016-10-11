clear;

%input parameters
m = 2000;
mw = 336.24;
B = 200;
vf = 2;
g = 9.8;
theta = atan(25/100);

%time vector
dt = 0.0001;
t = 0:dt:100;

%initial velocity is zero
v(1)=0;

%Euler's method to calculate velocity from dv/dt=(-2Bv+mwgsin(theta))/(2m+mw)
for i = 1:length(t)-1;
    v(i+1) = v(i) + ((-2*B*v(i)+mw*g*sin(theta))/(2*m+mw))*dt;
end

%plot solution
plot(t,v);
axis([0,max(t),0,3]);
title('Velocity of cart vs time');
xlabel('time (s)');
ylabel('velocity (m/s)');
grid on;

%print velocity
fprintf('System reaches 90%% terminal velocity at %fs\n', t(find(v>0.9*vf, 1)));

%calculate Tension and plot
T = 2*g*sin(theta)/(1/m+1/(m+mw))+B*v*(1/m-1/(m+mw))/(1/m+1/(m+mw));
figure;
plot(t,T);
title('Tension in cable vs. time');
xlabel('time (s)');
ylabel('tension (N)');
grid on;

