clear;

%Define system input
t = 0:2000;                                     %time between 0 and 2000s
F1 = ones(1,2001);                              %F1=u(t);
F2 = [zeros(1,500),ones(1,500),zeros(1,1001)];  %F2=u(t-500) ? u(t-1000);
u=[F2;F1];

%define constants
m1 = 10;
m2 = 10;
k1 = 1;
k2 = 1;
b1 = 1;
b2 = 1;

%Create state space matrices
A=[-(b1+b2)/m1, -(k1+k2)/m1, b2/m1, k2/m1;
    1, 0, 0, 0;
    b2/m2, k2/m2, -b2/m2, -k2/m2;
    0, 0, 1, 0];

B = [1/m1, 0;
        0, 0;
        0, -1/m2;
        0, 0];

C=eye(4);

D = zeros(4,2);

%Create state space model
sys = ss(A,B,C,D);

%Plot model
[y,t] = lsim(sys,u,t);

subplot(2,2,1);
plot(t,y(:,1));
title('Velocity of M1 vs. time');
xlabel('time (s)');
ylabel('V1 (m/s)');

subplot(2,2,2);
plot(t,y(:,2));
title('Position of M1 vs. time');
xlabel('time (s)');
ylabel('X1 (m)');

subplot(2,2,3);
plot(t,y(:,3));
title('Velocity of M2 vs. time');
xlabel('time (s)');
ylabel('V2 (m/s)');

subplot(2,2,4);
plot(t,y(:,4));
title('Position of M2 vs. time');
xlabel('time (s)');
ylabel('X2 (m)');

