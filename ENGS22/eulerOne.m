function [x,y] = eulerOne(Xn,h)
% Returns x and y vectors containing Euler's method approximations to the
% differential equation f'(x,y)=2-e^(-4x)-2y and initial condition y(0)=1.
%
% Example: eulerOne(4,0.1) returns two 1x40 matrixes corresponding to the x
% and y values of an Euler's method approximations to the 2-e^(-4x)-2y
% function over the interval [0,4].
    
x(1)=0;
y(1)=1;
n=1;
while n<Xn/h
    x(n+1)=x(n)+h;
    y(n+1)=y(n)+(2-exp(-4*x(n))-2*y(n))*h;
    n=n+1;
end

end

