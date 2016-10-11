clearvars;

Mcar = 3.3534;      %measured mass
Me = Mcar + 0.3;    %mass in kg
Fc = 0.415;         %o-ring resistance calculated
Fp = 3.9359;        %propellor force in N
B = 3.190;          %damping coefficient calculated

deltT = 28.2e-6;    %elapsed time between individual counts
N=40;               %optical targets per revolution
D=2.802;            %value in inches
T = 28.2e-6;        %seconds between each count
r = D/2;
inPerM = 39.3701;   %inches per meter

deltX = (2*pi*(r/inPerM))/N;            %get the distance traveled between ticks

deltT = load('TESTMODE2A.TXT')';
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
axis([3,6.5,0,1]);
grid on;
title('Test Mode 2: Velocity vs. Time');
xlabel('time (s)');
ylabel('velocity(m/s)');
hold on;

%Compare our data to the model equation from prelab
vertShift = 0.9177;
horizShift = 3.8249;
vComp = (-Fc/B)*(1-exp((-B/Me)*(t-horizShift)))+vertShift*exp((-B/Me)*(t-horizShift));     %shift t over by 2s to fit
plot(t,vComp, '--b');
legend('Test Data', 'Modeled graph', 'Location', 'NorthEast');
hold off;

% %estimate B:
%To estimate B I first plotted my testmode data in matlab. Then, on the
%   graph I used the paint tool, selected a portion of it that didn't seem
%   too noisy, and created a new matrix of it called data (this has the
%   first column of t values and the second column of v values). The
%   derivative of this graph is acceleration, and I approximated that
%   derivative using the polyfit function. This gave me a vector of
%   acceleration values, and I arbitrarily chose the first one for my
%   value. Next I used the formula from the prelab B=-(Mev'+Fc)/v to solve
%   for v'.
%acceleration= polyfit(data(:,1),data(:,2),1);
%B = -(Me*acceleration(1)+Fc)/mean(data(:,2))
