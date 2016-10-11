input=load('ssn.txt');
x=input(:,1);
y=input(:,2);

subplot(2,2, 1:2);
plot(x,y);
title('Andy Werchniak');
xlabel('Date');
ylabel('# of sunspots');
grid on;

max_x= (y == max(y)).*x;
min_x= (y == min(y)).*x;
maxx=max(max_x);
minx=max(min_x);

max_y=max(y);
min_y=min(y);

subplot(2,2,3);
plot(maxx, max_y, 'x');
grid on;
title('Maximum # of sunspots');
xlabel('Date');
ylabel('# of sunspots');

subplot(2,2,4);
plot(minx, min_y, 'o');
grid on;
title('Minimum # of sunspots');
xlabel('Date');
ylabel('# of sunspots');