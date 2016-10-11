clear;

% System parameters
m = 2000;               %Mass of the empty carts (kg)
mw = 336.24;            %Difference in mass due to added water (kg)
m1 = m + mw;            %mass of cart 1 (kg)
m2 = m;                 %mass of cart 2 (kg)
B = 200;                %Linear friction coefficient of carts' wheels (Ns/m)
Br = 20;                %Rotational friction of pulley (Nms/rad)
d = 1.5;                %diameter of pulley (m)
J = 250;                %Moment of inertia of pulley (kgm^2)
k = 78*1000;            %spring constant (N/m)
k1 = k; k2 = k;
g = 9.8;                %gravitational constant (m/s^2)
theta = atan(25/100);   %Incline angle (rad)

% System input
dt = 0.01;
t = 0:dt:100;
u = ones(1,length(t))*g*sin(theta);

% Matrices
A = [-B/m1 0 0 -1/m1 0;
      0 -B/m2 0 0 1/m2;
      0 0 -Br/J d/(2*J) -d/(2*J);
      k1 0 -k1*d/2 0 0;
      0 -k2 k2*d/2 0 0];
  
B = [1;-1;0;0;0];

C = eye(5);

D = 0;

%Create state space model
sys = ss(A,B,C,D);

%Plot model
[y,t] = lsim(sys,u,t);

%Plot
subplot(5,1,1);
plot(t,y(:,1));
title('Velocity of Cart 1 vs. time');
xlabel('time (s)');
ylabel('V1 (m/s)');
grid on;

subplot(5,1,2);
plot(t,y(:,2));
title('Velocity of Cart 2 vs. time');
xlabel('time (s)');
ylabel('V2 (m)');
grid on;

subplot(5,1,3);
plot(t,y(:,3));
title('Angular Velocity of Pulley vs. time');
xlabel('time (s)');
ylabel('w (rad/s)');
grid on;

subplot(5,1,4);
plot(t,y(:,4));
title('Force on Spring 1 vs. time');
xlabel('time (s)');
ylabel('Fk1 (N)');
grid on;

subplot(5,1,5);
plot(t,y(:,5));
title('Force on Spring 2 vs. time');
xlabel('time (s)');
ylabel('Fk2 (N)');
grid on;

fprintf('Maximum tension in Cable: %fN\n', max(y(:,4)));