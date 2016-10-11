%   Euler's method approximation of a differential equation over the interval
%   [0,10] with a deltaT of 0.1
%       Use with dxdt.m
%
%   Written by Andy Werchniak, 1/12/2016

tstep = 0.1;
t = 0:tstep:10;
x(1)=5;

for i=2:length(t)
    x(i)=x(i-1) + dxdt(x(i-1))*tstep;
end

hold on;
plot(t,x);
xlabel('Time');
ylabel('Position');
title('Euler''s method solution to dx/dt = -x/3');
hold off;
