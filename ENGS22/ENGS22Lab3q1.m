clear;

Qin = 2.604;
R = 4.570;
C = 5.425;
tau = R*C;

t=0:0.1:10*tau;
Td = Qin*R*(1-exp(-t/tau));

data = csvread('thermoLab.csv');
tData = data(:,1)' + 165;       %time offset
Tdata = data(:,2)' * (1/0.1); %Convert from volts to temp

plot(t,Td);
hold on;
plot(tData, Tdata);
axis([0,160,0,12]);
grid on;
title('Heat up Temperature of System vs. Time');
legend('Analytical Solution', 'Measured Data', 'Location', 'NorthWest');
xlabel('Time(s)');
ylabel('Temperature (C)');
