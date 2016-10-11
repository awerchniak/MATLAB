a = input('Enter the plot min: ');
b = input('Enter the plot max: ');
h = input('Enter the spacing of points: ');

w = input('Enter the width of the pulse: ');
amp = input('Enter the amplitude of the pulse: ');

x = (a:h:b);
mid = ((a+b)/2);
lim = (w/2);

y = (x<mid+lim & x>mid-lim).*(amp);

xlabel('Time (s)f');
ylabel('Amplitude');
plot(x,y, 'b', 'linewidth', 2)
axis([a b -1 amp*2])