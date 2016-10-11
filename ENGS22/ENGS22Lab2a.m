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

deltT = load('TESTMODE1A.TXT')';
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
plot(tMean, v);
axis([0,8,0,1.2]);
grid on;
title('Test Mode 1: Velocity vs. Time');
xlabel('time (s)');
ylabel('velocity(m/s)');
hold on;

% REPEAT FOR SECOND GRAPH

deltT = load('TESTMODE1B.TXT')';
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
plot(tMean, v);


%Compare our data to the model equation from prelab
shift = 0.7875;
v0 = max(v);
vComp = (-Fc/Me)*(t-shift)+v0;     %shift over and up to fit

plot(t,vComp, '--k');
legend('Test Data 1', 'Test Data 2', 'Modeled graph', 'Location', 'NorthWest');
hold off;

% %estimate Fc:
%To estimate Fc I first plotted my testmode data in matlab. Then, on the
%   graph I used the paint tool, selected a portion of it that didn't seem
%   too noisy, and created a new matrix of it called data (this has the
%   first column of t values and the second column of v values). The
%   derivative of this graph is acceleration, and I approximated that
%   derivative using the polyfit function. This gave me a vector of
%   acceleration values, and I arbitrarily chose the first one for my
%   value. Now that I had v', I could use the simple formula Fc = -v'*Me
%   (given in the lab handout) to estimate Fc.
%Code:
%   acceleration= polyfit(data(:,1),data(:,2),1);
%   Fc = -acceleration(1)*Me

