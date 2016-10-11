Tpelt = [7.835,9.045,10.25,11.46,12.66];
Qbar =  [1.967,1.809,1.650,1.492,1.332];
x = polyfit(Tpelt,Qbar,1);
T = 0:0.1:15;
Q = x(1)*T + x(2);
plot(Tpelt,Qbar,'b');
hold on;
plot(T,Q,':r');
plot(T,3*ones(1,length(T)),'k');
grid on;
title('Andy Werchniak ps7-3 Plot');
ylabel('Qbar (W)');
xlabel('Tpelt (^oC)');
text(5.3,2.301,'Qbar = 2.9983(W)-0.1315(W/^oC)*Tpelt(^oC)');
text(5.3,2.95,'Qbar=3(W)');
axis([0,15,1.3,3.1]);
legend('Measured Qbar vs. Tpelt','Extrapolated Qbar vs. Tpelt','Ideal Qbar=Qpelt','Location','SouthWest');