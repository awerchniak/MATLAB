clear;

A = 0.00064807;  %m^2
k = 142;         %W/(m degC)
D = 5e-05;       %m^2/sec
L = 3;           %m

xo = 18;         %degC
xL = 8;          %degC
m2 = 1.6667;     %degC/m
b2 = 12;         %degC

%2b
%Set t, so that we get a response for all of x at this value of time
t = 2000;

%code from ps3_3
n = 100;                         %How many terms of the series?
x = linspace(0,3,100);          %Create a position vector between 0 and L=3
sequence = zeros(k,length(x));  %Preallocate sequence matrix for speed

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
T = series + Tss;
plot(x,T, 'b');
xlabel('Postion (m)');
ylabel('Temperature(^oC)');
title('Andy Werchniak ps5-2b Plot');
grid on;
hold on;
plot(x,m2*x+b2, '--r');
plot(x,Tss, '--k');
legend(['Distribution at t=', num2str(t),'s'],'Initial Condition', 'Steady State');
hold off;

%2c
%Now, let's obtain a graph at a set x for all t
clear x; clear t; clear  sequence; clear series; clear T;

%Set position we would like to view
x = 1.5;

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
T = series;      %Don't add Tss so we get a decaying exponential (same tau)
y = 0.05*(0.007938)*ones(1,length(t));      %T=0.007938 at t = 1e5 (extracted
                                            %with paintbrush. This is when
                                            %graph is sufficiently straight)
figure;
semilogy(t,T);
hold on;
semilogy(t,y);
xlabel('Time(s)');
ylabel('Temperature(^oC)');
title('Andy Werchniak ps5-2c Plot');
legend(['Temperature vs. Time at x=', num2str(x),'m'], 'T=5% initial value');
grid on;

%3c code for finding tau
v = find((T-y)<0);
threeTau = t(v(1))-1e5;
tau = threeTau/3;
fprintf('tau approximately equals %f\n', tau);

%output:
%tau approximately equals 18218.2182181

%The figures for 3d/f were  produced by entering t=0 or t=5tau,respectively,
%   at the top of this code