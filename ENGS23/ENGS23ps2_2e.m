clear;

%define constants, A matrix, and initial conditions
B=4; D=7; E=5; F=6; G=3; r=1; c=1;
A = 1/(r*c)*[-(B*D+D*E),D*E;E*F,-(E*F+F*G)];
v1(1) = 1;
v2(1) = 1.164;

%define tstep and t vector for Euler's
dt = 0.001;
t = 0:dt:1;

%Euler's method. v(i+1) = v(i) + A*v(i)*dt
for i = 2:length(t)
    v = [v1(i-1);v2(i-1)] + A*[v1(i-1);v2(i-1)]*dt;
    v1(i) = v(1);
    v2(i) = v(2);
end

%plot results against each other
plot(abs(v1),abs(v2));
xlabel('v1(m/s)');
ylabel('v2(m/s)');