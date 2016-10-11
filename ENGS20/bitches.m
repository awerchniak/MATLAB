H=50; h = 130;
x=30:0.5:300;
theta = atan((H+h)./x)-atan(h./x);
[d,n]= max(theta);
Max = x(n)
plot(x,theta)