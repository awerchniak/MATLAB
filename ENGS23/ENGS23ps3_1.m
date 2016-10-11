clear;

%given
m=10;       %kg
K=1000;     %N/m
Kp=7500;    %N/m

%A Matrix. wo^2 not factored out for simplicity purposes
A = [-(K+Kp)/m, Kp/m;
    Kp/m, -(K+Kp)/m];

%check values to ensure they line up with written solution
[vec,val] = eig(A);

%arbitrary non-eigenvector IC's, with initial velocity = 0
x1(1) = 2.5;    %m
v1(1) = 0;      %m/s

x2(1) = -2;     %m
v2(1) = 0;      %m/s

%define t vector and second values of x
dt = 0.0001;    %s
t = 0:dt:2;     %s   
x1(2) = x1(1) + v1(1)*dt;
x2(2) = x2(1) + v2(1)*dt;

%Euler method for x'' = [A]x : x(i)=A(x-1)*dt^2+2x(i-1)+x(i-2)
for i=3:length(t)
    x = A*[x1(i-1);x2(i-1)]*dt^2 + 2*[x1(i-1);x2(i-1)] - [x1(i-2);x2(i-2)];
    x1(i) = x(1);
    x2(i) = x(2);
end

%plot results
plot(t,x1,'r',t,x2,'b');
title('Andy Werchniak PS3-1c&d Plot');
grid on;
legend('x1','x2');
xlabel('t(s)');
ylabel('x(m)');

%%%1f
t=0; x1=0;x2=0;
%set IC's to eigenvector corresponding to larger eigenfrequency,
%   with initial velocity = 0
x1(1) = 1;      %m
v1(1) = 0;      %m/s

x2(1) = -1;     %m
v2(1) = 0;      %m/s

%define t vector and second values of x
dt = 0.0001;    %s
t = 0:dt:0.5;   %s
x1(2) = x1(1) + v1(1)*dt;
x2(2) = x2(1) + v2(1)*dt;

%Euler method for x'' = [A]x : x(i)=A(x-1)*dt^2+2x(i-1)+x(i-2)
for i=3:length(t)
    x = A*[x1(i-1);x2(i-1)]*dt^2 + 2*[x1(i-1);x2(i-1)] - [x1(i-2);x2(i-2)];
    x1(i) = x(1);
    x2(i) = x(2);
end

%plot results
figure;
plot(t,x1,'r',t,x2,'b');
title('Andy Werchniak PS3-1f Plot');
grid on;
axis([min(t),max(t),min(x1),max(x2)]);
legend('x1','x2');
xlabel('t(s)');
ylabel('x(m)');

%1g
searching = find(x1-1<0.00001 & x1-1>-0.00001);
%MATLAB & Euler's give approximations, so adjacent points often indicate
%   the same cycle, and not a separate peak. Therefore, we must inspect the 
%   "searching" vector by hand, at which point it is apparent that separate
%   peaks occur at t(1), t(1572), t(3142), t(4713), and so on.

%Searching vector:
%searching =
%  Columns 1 through 8
%           1           2        1572        1573        3142        3143        3144        4713
%  Columns 9 through 10
 %       4714        4715

T = t(1572)-t(1);
w = 2*pi/T