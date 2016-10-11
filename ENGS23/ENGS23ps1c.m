%PS_1 method c. Andy Werchniak 30 March 2016

%clear workspace and import dataclear;
code = 476535;
PS_1;

%normalize the data using the equation given
T = (T_rod-T_air)/(T_rod(1)-T_air(1));

%create a line of y=0.05*(the initial normalized value)
final = 0.05*T(1);
y = final*ones(1,length(T));

%plot for visualization
figure;
semilogy(t,T);
hold on;
semilogy(t,y);
xlabel('t (min)');
ylabel('Normalized T (unitless)');

%find the indices where the data crosses the final line
v = find(T<final);

%%tau will occur at 1/3 the value of the first index
tau = t(v(1))/3
