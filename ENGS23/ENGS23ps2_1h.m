clear;

%Define constants and inital conditions
B=4; D=7; E=5; F=6; G=3; r=1; c=1;
v1(1) = -2.5;
v2(1) = 2;

%define A matrix
A = 1/(r*c)*[-(B*D+D*E),D*E;E*F,-(E*F+F*G)];

%let matlab do the math to get eigenvalues, eigenvectors, and constants
[vec,val] = eig(A);
c = vec^-1*[v1(1);v2(1)];

%define t vector for plotting
t = 0:0.001:0.25;
 
%set equations based on constants, eigenvalues, and eigenvectors
v1 = c(1)*vec(1,1)*exp(val(1,1)*t) + c(2)*vec(1,2)*exp(val(2,2)*t);
v2 = c(1)*vec(2,1)*exp(val(1,1)*t) + c(2)*vec(2,2)*exp(val(2,2)*t);

% compare values found by hand and verify that it's the same plot
% v1 = 0.085*exp(-22.240*t)-2.587*exp(-88.760*t);
% v2 = 0.085*1.164*exp(-22.240*t)-2.587*-0.736*exp(-88.760*t);

%plot results
plot(t,v1,'b',t,v2,'r');
title('Andy Werchniak PS2-1h Plot');
grid on;
axis([min(t),max(t),min(v1),max(v2)]);
legend('v1','v2');
xlabel('t(s)');
ylabel('v(m/s)');