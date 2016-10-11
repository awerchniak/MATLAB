clear;

%given
period = 120;
k = 100;
rho = 5000;
cp = 700;
L = 0.22;

%vectors and factors
dx=0.005;
x=0:dx:L;
dt=0.1;
t = 0:dt:1000;
D = k/(rho*cp);
gamma = D*dt/dx^2;
m=length(x);

%Create A Matrix (see page 70)
v1 = ones(1,m-1);
M1 = diag(v1,-1);
v2 = ones(1,m-1);
M2 = diag(v2,1);
v3 = -2*ones(1,m);
M3 = diag(v3);
A=M1+M2+M3;
A(1,1)=-3;
A(m,m)=-3;

%IC's are zero (T(x,0) = 0)
T(:,1) = zeros(m,1);

%BC's
w = 2*pi/period;
To=10;
T0 = To*sin(w*t);
Tl = zeros(1,length(t));
U = zeros(m,length(t));
U(1,:) = 2*T0;
U(m,:) = 2*Tl;

%Euler's
for i=2:length(t)
    T(:,i) = T(:,i-1)+gamma*A*T(:,i-1)+gamma*U(:,i-1);
end

%x(11) = 0.05 (5cm), because x goes from 0-0.22 in increments of 0.005
plot(t,T(11,:), 'b');
hold on;
plot(t,T0, 'r');
ylabel('Temperature(^oC)');
xlabel('Time (s)');
title('Andy Werchniak ps4-3c Plot');
grid on;
legend('Temperature at x=0.05m', 'Input Temperature at x=0');
text(50,3,['\gamma=' num2str(gamma)]);

%3f
ecks = [0, 0.05, 0.1, 0.15];
why = [10, 2.0419, 0.4521, 0.1018];
figure;
semilogy(ecks, why);
xlabel('Position (m)');
ylabel('Zero-to-Peak Temp. Excurcsion (^oC)');
title('Andy Werchniak ps4-3f Plot');
grid on;
hold on;
semilogy(0:0.01:0.15,0.05*10*ones(1,length([0:0.01:0.15])));
%semilogy(0:0.01:0.15, 10*exp(-31*[0:0.01:0.15]), ':r');

%3g
%peak of x=0.05 occurs at t=900.5s (found using paintbrush tool)
%peak of adjacent input occurs at t=869.0s (found using paintbrush tool)
%phase shift is a lag of 31.5s
%radians = 2pi/seconds = 0.1995radian
%degrees = 180/pi*radians = 11.43degrees