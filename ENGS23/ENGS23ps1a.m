%PS_1 method a. Andy Werchniak 30 March 2016

%clear workspace and import data
clear;
code = 476535;
PS_1;

%get a sample set of the the first few values to extrapolate a tangent line
sample = T_rod(1:10);
t2 = t(1:10);

%use polyfit to approximate a line tangent to the curve at t=0
m = polyfit(t2, sample, 1);
line1 = m(1)*t+m(2)*ones(1,length(t));

%use polyfit to find a best fit line for the noisy Tair value
m = polyfit(t,T_air,1);
line2 = m(1)*t+m(2)*ones(1,length(t));

%find the index where line2 crosses line1
temp = find(line2-line1>0);

%tau will occur at the first index where the tangent line is less than Tair
tau = t(temp(1))

%plot the lines
hold on;
plot(t,line1, 'g');
plot(t,line2, 'k');