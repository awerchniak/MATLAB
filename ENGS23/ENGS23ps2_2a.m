%PS_2_2a
clear;

%define constants and initial conditions
B=4; D=7; E=5; F=6; G=3; r=1; c=1;
v1(1) = -2.5;
v2(1) = 2;

%define A matrix
A = 1/(r*c)*[-(B*D+D*E),D*E;E*F,-(E*F+F*G)];

%set tstep and t vector for Euler's
dt = 0.0001;
t = 0:dt:0.25;

%Perform Euler's method. v(i+1) = v(i) + A*v(i)*dt
for i = 2:length(t)
    v = [v1(i-1);v2(i-1)] + A*[v1(i-1);v2(i-1)]*dt;
    v1(i) = v(1);
    v2(i) = v(2);
end

%plot results
plot(t,v1,'r',t,v2,'b');
title('Andy Werchniak PS2-2a Plot');
grid on;
axis([min(t),max(t),min(v1),max(v2)]);
legend('v1','v2');
xlabel('t(s)');
ylabel('v(m/s)');