function [difeq] = odefun2(x,y)
%Returns the first differential equation for input in the ode45 function.

difeq=y-0.5*exp(x/2)*sin(5*x)+5*exp(x/2)*cos(5*x);

end

