%1a code
clear;
getCode;
xt = [0.05,2000];
PS_4_1;
hold on;

%choose the point at T=1e-1 for starting point (graph sufficiently
%straight)
x = 0:2:2000;
y = 0.05*1e-1*ones(1,length(x));
hold on;
plot(x,y);
title('Andy Werchniak PS4-1a Plot');
xlabel('Time (s)');
ylabel('Temperature (^oC)');

%'data' is the blue data given on the graph, extracted with the paintbrush
%tool
% v=find((data(:,2)'-y)<0);
% x(v(1))% = 998
% v = find((data(:,2)'-y)<1e-1);
% x(v(1))% = 340

%(998-340)/3 = tau = 219.333
%D = L^2/(pi^2*tau) = 0.6^2/(pi^2*219.3333)
%D = 1.663e-4

%1b code:
%polyfit(data(:,1),data(:,2),1);
%first value gives slope ([m b])