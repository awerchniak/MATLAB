clear;

rgmax = 1e+6;
Krc= 0.1e-3;
ksat = 5e+5;
kd = 0.1;

%steady state fish population: R = rgmax/(kd^2*Krc*C)-ksat
%total catch = kd^2*Krc*R*C

C = 1:4e6;
R= rgmax./(kd^2*Krc*C)-ksat*ones(1,length(C));

dt = 1/(length(C)-1);
t = 0:dt:1;
totalCatch(1)=0;
for i = 1:length(t)-1
    totalCatch(i+1) = totalCatch(i) + kd^2*Krc*R(i).*C(i)*dt;
end

plot(C,R);
axis([0,length(C),0,1e7]);
title('Number of Fishing Boats vs. Steady State Fish Population');
grid on;
xlabel('Number of Boats');
ylabel('Fish Population');

figure;
plot(C,totalCatch);
grid on;
title('Number of Fishing Boats vs. Total Annual Fish Caught');
xlabel('Number of Boats');
ylabel('Total Fish Caught');

[value, index] = max(totalCatch);

fprintf('The maximum total annual catch is %d. It occurs at %d boats\n' , value, index);