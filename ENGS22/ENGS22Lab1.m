%Andy Werchniak 01/19/2016, Section Tuesday 5-8

frequency = [100,250,500,750,1000,1250,1500,2500,5000,10000,20000,100000];
ratio = [1.00,0.99,0.96,0.92,0.86,0.80,0.75,0.55,0.32,0.17,0.09,0.09];
phase = [-3.5,-9,-16.8,-24,-31,-37,-42,-56.2,-71,-80,-85,-89.4];

subplot(2,1,1);
hold on;
grid on;
set(gca,'xscale','log');
title('Magnitude Response');
xlabel('frequency (Hz)');
ylabel('Ratio Output/Input');
semilogx(frequency,ratio);
hold off;
subplot(2,1,2);
hold on;
grid on;
set(gca,'xscale','log');
title('Phase Response');
xlabel('frequency (Hz)');
ylabel('Phase');
semilogx(frequency,phase);
hold off;