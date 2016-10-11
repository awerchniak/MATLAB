%clearvars;

Me = 2;             %mass in kg
Fc = 0.4;           %force in N

deltT = 28.2e-6;    %elapsed time between individual counts
N=40;               %optical targets per revolution
D=2.7;              %value in inches
T = 28.2e-6;        %seconds between each count
r = D/2;
inPerM = 39.3701;   %inches per meter

deltX = (2*pi*(r/inPerM))/N;            %get the distance traveled between ticks

deltT = load('PracticeTM2data.txt')';
deltT = T*deltT;                        %convert deltT to seconds

%create x vector
x(1)=0;
for i = 1:length(deltT);
    x(i+1)=x(i)+deltX;
end

%create t vector
sum = 0;
t(1)=0;
for i = 2:length(deltT)+1
    sum = sum + deltT(i-1);
    t(i) = sum;
end

%create tMean vector
for i = 1:length(deltT)
    tMean(i) = t(i)+(t(i+1)-t(i))/2;
end

%create velocity vector
for i = 1:length(tMean)
    v(i) = (x(i+1)-x(i))/(t(i+1)-t(i));
end

%plot function
plot(tMean, v, 'k');
axis([0,2,0,1]);
grid on;
title('Velocity vs Time from "PracticeTM2data.txt"');
xlabel('time (s)');
ylabel('velocity(m/s)');

%estimate B
p_fit = polyfit(acc(:,1),acc(:,2),1);
B = p_fit(1)*Me
