%code for 2e

clear;

A = 0.00064807;  %m^2
k = 142;         %W/(m degC)
D = 5e-05;       %m^2/sec
L = 3;           %m

xo = 18;         %degC
xL = 8;          %degC
m2 = 1.6667;     %degC/m
b2 = 12;         %degC

%Set position we would like to view
x = 0;

%code from ps3_3
n = 100;                        %How many terms of the series?
t = linspace(0,3e5,1000);       %Create a position vector between 0 and L=3
sequence = zeros(k,length(t));  %Preallocate sequence matrix for speed

%Create vector for each term in series from 1 to k
for i = 1:n
    sequence(i,:) = (-6/pi)*(3*(-1)^i+2)/i*sin(i*pi*x/3) .* exp(-i^2*pi^2*D/L^2*t);
end

%Sum the terms of the sequence to get the series
series = 0;
for i=1:n
    series = series + sequence(i,:);
end

%Series is a graph of Temperature vs. position at the above specified t
%   for the homogeneous case. Must at the Steady State solution to this
%   for the full inhomogeneous solution
Tss = xo + (xL-xo)/L*x;
T = series+Tss;
figure;
plot(t,T);
hold on;
xlabel('Time(s)');
ylabel('Temperature(^oC)');
title('Andy Werchniak ps5-2e Plot');
legend(['Temperature vs. Time at x=', num2str(x),'m']);
axis([0,max(t),17,19]);
grid on;