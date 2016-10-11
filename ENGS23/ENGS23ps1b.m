%PS_1 method b. Andy Werchniak 30 March 2016

%clear workspace and import data
clear;
code = 476535;
PS_1;

%find the maximum of T_rod (should be the first point, but there is noise)
maximum = max(T_rod);

%find the value when 63% of the change has occurred
value = (1-0.63)*(maximum-mean(T_air))+mean(T_air);

%find the indices at which T_rod is less than this value
v = find(T_rod<value);

%tau will occur at the first index when T_rod<0.63T_rod(0)
tau = t(v(1))