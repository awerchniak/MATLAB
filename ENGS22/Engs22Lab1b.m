%Andy Werchniak 01/19/2016, Section Tuesday 5-8

data = csvread('scope_6.csv',2,0);

time=data(:,1);
ch1=data(:,2);
ch2=data(:,3);

figure(1)
plot(time,ch1,'b',time,ch2,'r','LineWidth',1.6);

axis([time(1),time(length(time)),-1.4,1.4])
grid on
xlabel('time (s)','FontSize',14)
ylabel('Voltage (V)','FontSize',14)
title('Scope Plot: Input and Output of RC Circuit','FontSize',14)
legend('Input - Ch1','Output - Ch2')
set(gca,'FontSize',11);