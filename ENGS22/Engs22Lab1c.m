%Andy Werchniak 01/19/2016, Section Tuesday 5-8
% The graph is an oval (and not a circle) because the two curves are out of
%   phase. If they were perfectly 90° off, like the sine and cosine
%   functions, then the plot would make a circle. If they were perfectly in
%   phase, it would be a straight line. Since they are in between, we get
%   an oval. If the circuit had two resistors instead of a resistor and a
%   capacitor, then the two curves wouldn't be out of phase (the change in
%   phase being caused by the RC circuit varying voltage sinusoidally with
%   time), and so the plot would be a straight line.

data = csvread('scope_6.csv',2,0);

ch1=data(:,2);
ch2=data(:,3);

figure(1)
plot(ch1,ch2,'r','LineWidth',1.6);

grid on
axis equal
xlabel('Channel 1 Voltage (V)','FontSize',14)
ylabel('Channel 2 Voltage (V)','FontSize',14)
title('Scope Plot: Input and Output of RC Circuit','FontSize',14)
set(gca,'FontSize',11);