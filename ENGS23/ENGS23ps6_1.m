clear;
getCode;
P=10;
PS_6_1;

%3c

%Example of how I found m and b at each boundary for each value of P
%Here, P=10
% [m b] = polyfit(data(:,1), data(:,2),1);
% hold on;
% plot(x,4*x+4.4722);
% legend ('T vs. x', 'Tangent line for slope', 'Location', 'SouthEast');
% [m b] = polyfit(data2(:,1), data2(:,2),1);
% plot(x,-1.0083*x+7.0583);legend ('T vs. x', 'Tangent line for slope 1', 'Tangent line for slope 2', 'Location', 'SouthEast');

%3d
k = 20;     %w/mdegC
A = 0.1;    %m^2
figure;
%values found using method in 3c
q1 = -k*A*[4,4,4,4,4,4,4];
T1 = [-27.6753,-24.7528,-18.2583, -11.7639, -5.2694, 4.4722, 10.9667];

q2 = -k*A*[3.9499, 3.4992, 2.4975, 1.4958, 0.4952, -1.0083, -2.0100];
T2= [-27.6494, -24.4942, -17.4825, -10.4709, -3.4592, 7.0583, 14.0699];
plot(T1, q1, 'r', T2, q2, 'b');
title('Andy Werchniak ps5-1d Plot');
legend('Q vs T at x=0', 'Q vs T at x=1');
xlabel('T(^oC)');
grid on;
axis([-30,15,-10,6]);
ylabel('Q(W)');

%3e
dx = x(2)-x(1);     %this works because the x vector was created using even increments
dubPrime = diff(diff(T)/dx)/dx;
p = -k*dubPrime;
figure;
plot(x(2:length(x)-1),p, 'b')
grid on;
title('Andy Werchniak ps5-1e Plot');
xlabel('x(m)');
ylabel('p(x) (W/m^3)');
%p deduced using polyfit:
% polyfit(sample(:,1), sample (:,2), 1)
% 
% ans =
% 
%   133.1853  133.4073
hold on;
text(0.255,150,'p(x) = 133.1853(W/m^4)*x(m) + 133.4073(W/m^3)');
text(0.1,10,'p(x)=0 (W/m^3) on (0,0.25)');
text(0.8,10, 'p(x)=0 (W/m^3) on (0.75,1)');