%v' = 1/M * (Fin - Bv);

w=2*pi;
M=30;
B=12;

v(1) = 0;
T = 2*pi/w;
dt = T/100;
t = 0:dt:100*T;

Fin = sin(w*t);

for i = 2:length(t)
    v(i) = v(i-1) + (1/M*(Fin(i-1)-B*v(i-1)))*dt;
end

plot(t,v);
hold on;
xlabel('t (sec)');
ylabel('v (m/s)');
text(0.51,0.009605, 'Tstep = 0.01', 'FontSize', 14);
A = -min(v)
