x=-4:0.001:5;
y=x.^2-1;
plot(x,y)

x=-2:0.001:2;
y=x.^5-3.*x.^4-19.75.*x.^3+51.*x.^2+51.75.*x-81;
plot(x,y)

x=0:0.001:10;
y=x.*exp(-x)
plot(x,y)

x=-10:0.001:10;
y=1.5.*x./(x-4)
plot(x,y)