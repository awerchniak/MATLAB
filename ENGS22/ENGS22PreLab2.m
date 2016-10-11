clearvars;

x = 0:0.5:2.5;
deltT = [0.267,0.310,0.372,0.473,0.675];

sum = 0;
t(1)=0;
for i = 2:length(deltT)+1
    sum = sum + deltT(i-1);
    t(i) = sum;
end

for i = 1:length(deltT)
    tMean(i) = t(i)+(t(i+1)-t(i))/2;
end

for i = 1:length(tMean)
    v(i) = (x(i+1)-x(i))/(t(i+1)-t(i));
end

plot(tMean, v, 'xk');
axis([0,3,0,2]);
grid on;

C=0.5;T=2.5;vi=2;
t = 0:0.1:3;
vCompare = (vi + C)*exp(-t/T) - C;
hold on;
plot(t, vCompare, ':k');
legend('Measured Data', 'Model Data');
title('Velocity vs. Time');
xlabel('Time(sec)');
ylabel('Velocity(m/s)');
hold off;