%   ODE_Solver.m
%   By: Lynd, TWP, Levey (1/05)
%   Rev. Ray (1/10)
%   Rev. Ryan Halter (1/12)
%   Description: Calls ODE45 to solve the differential equations defined in dXdt1.m 

% The vector xi defines the initial conditions used in the differential equations
xi(1) = 0;          % Initial position at t=0
xi(2) = 1;          % Initial Velocity at t=0
TSPAN = [0 20];     % Time span of the numerical simulation, (from 0 to 20 seconds)

% The next statement calls ODE45
% The numerical solution is placed in the vector T (time values) and the matrix Y (state variables).
% Each column of Y represents one state variable, each row one time. 
% The state variable equations are defined in function 'dxdt1.m' as a function of t and x.
% The time span of the simulation starts at TSPAN(1) and stops at TSPAN(2). 
% The initial conditions are specified in the vector xi. 
% All other optional parameters of ODE45 will use the default values.

[T,Y]=ode45(@dXdt1,TSPAN,xi);    

% The next statement plots the results, 


plot(T,Y(:,1),T,Y(:,2));

% Note that this is the same as plot(T,Y). 
% Individual vectors aren't the only arguments that plot( ) will accept

% Axis Labels and legend

xlabel ('Time (s)');
ylabel ('Position and Velocity');
legend ('Position','Velocity');

% The legend function helps to identify individual data curves












