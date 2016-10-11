%Andy Werchniak, 02/02/2016, Section Tuesday 5-8

clear;

data = csvread('andycsv1.csv',2,0);

t = data(:,1);
input = data(:,2);
output = data(:,3);

A=2.5;
f=20000;
w = 2*pi*f;

B=1.125;
phi=-1.0996;

AnalyticalInput = A*sin(w*t);
AnalyticalOutput=B*sin(w*t+phi);

subplot(1,2,1);
plot(t,input);
hold on;
plot(t,output);
legend('Meas. Input (Ch1)', 'Meas. Output (Ch2)');
title('Measured Input and Output');
xlabel('time(s)');
ylabel('Voltage(V)');
grid on;
hold off;
subplot(1,2,2);
plot(t,AnalyticalInput);
hold on;
plot(t,AnalyticalOutput);
axis([-1e-4,1e-4,-3,3]);
legend('Calc. Input (Ch1)', 'Calc. Output (Ch2)');
title('Calculated Input and Output');
xlabel('time(s)');
ylabel('Voltage(V)');
grid on;
hold off;
