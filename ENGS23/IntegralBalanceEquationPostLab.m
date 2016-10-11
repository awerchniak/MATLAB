clear;

data = csvread('lab_dat.csv');
t = data(:,1);
C = data(:,2);
T1 = data(:,3);
T2 = data(:,4);

plot(t,T1,'r',t,T2,'k',t,30.86*ones(1,length(t)),'b');
hold on;
plot(t,(34.32-9.36*exp(-1/275*(t-4400))),':b');
axis([4400,5879,16,36]);
grid on;
title('Andy Werchniak Integral Balance Equation Plot');
legend('Measured Value of T','Measured Value of Tin','63% total change','Modeled Value of T','Location','SouthWest');
xlabel('t(s)');
ylabel('T(^oC)');

% Just for checking my work on the differential equation!
% v(1) = 24.96
% t1 = [1439:length(t)] + 2961;
% for i = 2:length(t1)
%     v(i) = (1/275*(34.32-v(i-1)))*1+v(i-1);
% end
% plot(t1,v);