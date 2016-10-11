function [x,y] = eulerMid(Xn,h,c)
%Solves Euler's method using the midpoint variation.

if(c==1)
    x(1)=0;
    y(1)=1;
    n=1;
    while n<Xn/h
        x(n+1)=x(n)+h;
        y(n+1)=y(n)+h*(2-exp(-4*(x(n)+h/2)-2*(y(n)+(h/2)*(2-exp(-4*x(n))-2*y(n)))));
        n=n+1;
    end
end


end

