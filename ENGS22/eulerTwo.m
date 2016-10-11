function [x,y] = eulerTwo(Xn,h)
% Returns x and y vectors containing Euler's method approximations to the
% differential equation f'(x,y)=y-0.5e^(x/2)sin(5x)+5e^(x/2)cos(5x) and 
% initial condition y(0)=0.
%
% Example: eulerTwo(4,0.1) returns two 1x40 matrixes corresponding to the x
% and y values of an Euler's method approximation to the 
% y-0.5e^(x/2)sin(5x)+5e^(x/2)cos(5x) function over the interval [0,4].

x(1)=0;
y(1)=0;
n=1;
while n<Xn/h
    x(n+1)=x(n)+h;
    y(n+1)=y(n)+(y(n)-0.5*exp(x(n)/2)*sin(5*x(n))+5*exp(x(n)/2)*cos(5*x(n)))*h;
    n=n+1;
end

end

