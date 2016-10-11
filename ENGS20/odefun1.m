function [difeq] = odefun1(x,y)
%Returns the first differential equation for input in the ode45 function.

difeq=2-exp(-4*x)-2*y;

end

