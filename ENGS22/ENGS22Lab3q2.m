clear;

Qin = 2.604;
R = 4.570;
C = 5.425;
tau = R*C;

%Theoretical data
t=0:0.1:10*tau;
Td = Qin*R*(exp(-t/tau));

%Measured data
data = [1.18,0.66,0.384,0.224,0.126,0.069,0.036,0.015,0.007,0.001] * (1/0.1);
t2 = 0:15:(length(data)-1)*15;

semilogy(t,Td);
hold on;
semilogy(t2,data);
axis([0,(length(data)-1)*15,0,12]);
title('Cool Down Temperature of System vs. Time');
legend('Analytical Solution', 'Measured Data', 'Location', 'NorthEast');
xlabel('Time(s)');
ylabel('Temperature (C)');