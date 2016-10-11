clear;

k = 30;                         %How many terms of the series?
x = linspace(0,3,100);          %Create a position vector between 0 and L=3
sequence = zeros(k,length(x));  %Preallocate sequence matrix for speed

%Create vector for each term in series from 1 to k
for i = 1:k
    sequence(i,:) = (-6/pi)*(3*(-1)^i+2)/i*sin(i*pi*x/3);
end

%Sum the terms of the sequence to get the series
series = 0;
for i=1:k
    series = series + sequence(i,:);
end

%Plot results against given
plot(x,5*x-6,'--r');
hold on;
plot(x,series, 'b');
grid on;
xlabel('x(m)');
ylabel('Temp (degC)');
legend('f(x)', ['Series Approximation for n=' num2str(k)], 'Location', 'NorthWest');
title('Andy Werchniak PS3-3 Plot');
