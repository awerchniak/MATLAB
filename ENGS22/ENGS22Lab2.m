clearvars;

Mcar = 3.3534;      %measured mass
Me = Mcar + 0.3;    %mass in kg
Fc = 0.415;         %o-ring resistance calculated
Fp = 3.9359;        %propellor force in N, measured
B = 3.190;          %damping coefficient calculated

deltT = 28.2e-6;    %elapsed time between individual counts
N=40;               %optical targets per revolution
D=2.802;            %value in inches
T = 28.2e-6;        %seconds between each count
r = D/2;
inPerM = 39.3701;   %inches per meter

deltX = (2*pi*(r/inPerM))/N;            %get the distance traveled between ticks

deltT = load('OPMODEA.TXT')';
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
axis([0,8,0,1.2]);
grid on;
title('Operational Mode: Velocity vs. Time');
xlabel('time (s)');
ylabel('velocity(m/s)');
hold on;

%Compare our data to the model equation from prelab
vComp = (Fp/B-Fc/B)*(1-exp((-B/Me)*(tMean-2)));     %shift t over by 2s to fit
plot(tMean,vComp, '--b');
legend('Test Data', 'Analytical Model', 'Location', 'NorthWest');
hold off;

% Calculate rms error and print to command window
%   using the command find((vComp-v) >0), I found that 13 is the index
%   of the time vector where the two intersect. As both functions are
%   shifted and in reality multiplied by a factor of u(t-2), this give a 
%   more accurate reading. For the 5% and 95% versions, I used a similar
%   tactic: to find the correct indices, I did find(v>0.95*steadyState),
%   find(vComp>0.95%steadyState), find(v<0.05*steadyState), and
%   find(vComp<0.05*steadyState).
error = rms(v(13:length(v)),vComp(13:length(vComp)));
steadyState = (Fp/B-Fc/B);
error1 = rms(v(399),vComp(473));    %95% error
error2 = rms(v(13), vComp(13));     %5% error
fprintf('5%% Steady State RMS Error: %f%%\n', 100*error2);
fprintf('95%% SteadyState RMS Error: %f%%\n', 100*error1);
fprintf('Overall RMS Error: %f%%\n', 100*error);
%Calculated Overall RMS Error is 1.715%

% Part 4c of Postlab deliverables:
%   As you can see, the overall RMS Error of our graph is only 1.7%, which 
%   is quite good. This is likely almost entirely a result of noise from 
%   the cart oscillating slightly and going over the slight bumps in the 
%   track, and from the plot and model not being perfectly aligned at first
%   (we didn't release the cart EXACTLY 2s after starting data collection).
