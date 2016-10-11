m0=500;
k0=0.05;
b0=50;
Vin=1;

v2(1)=0;
Fk(1)=0;

%using the equations we derived in class, with state variables v2 and Fk0
%(d/dt)(vars)=A*vars+[0;k0]*Vin;
v = [v2;Fk];
A = [0,-1/m0;k0,-k0/b0];
B = [0;k0]*Vin;

tstep = 0.1;
t = 0:tstep:10;

%euler's method
for i=2:length(t)
    v(i)=v(i-1) + dxdt(A,v(i-1),B).*tstep;
end

x = ndiff(v(:,2));

hold on;
plot(t,x);
xlabel('Time');
ylabel('Position');
title('Euler''s method solution to time vs. displacement of the system');
hold off;