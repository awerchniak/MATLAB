clear;

%given
L = 0.22;       %m
D = 6.89e-5;    %m^2/s

%vectors and factors
dx=0.005;
x=0:dx:L;
dt=0.1;
t = 0:dt:1000;
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
To=10;
T0 = To*ones(1,length(t));
Tl = zeros(1,length(t));
U = zeros(m,length(t));
U(1,:) = 2*T0;
U(m,:) = 2*Tl;

%Euler's
for i=2:length(t)
    T(:,i) = T(:,i-1)+gamma*A*T(:,i-1)+gamma*U(:,i-1);
end

%x(23) = 0.11 (11cm), because x goes from 0-0.22 in increments of 0.005
plot(t,T(23,:), 'b');
hold on;
plot(t,T0, 'r');
ylabel('Temperature(^oC)');
xlabel('Time (s)');
title('Andy Werchniak ps8-3 Plot');
grid on;
legend('Temperature at x=0.11m', 'T_o (temp at x=0)');
text(50,3,['\gamma=' num2str(gamma)]);
axis([min(t),max(t),0,11]);

%69.6s to reach 25% the difference between air and To at x=11cm
% ans = find(T(23,:)-0.25*To(1)>0);
% t(ans(1))
% 
% ans =
% 
%    69.6000