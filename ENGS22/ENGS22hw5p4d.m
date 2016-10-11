C = 5;
R = 10;

w = linspace(1e-3,10,10000);

mag = 1/C*(1./sqrt(w.^2+(1/R*C)^2));
phase = atan(-w*R*C);

subplot(2,1,1);
semilogx(w,mag);
title('Magnitude Response of the system');
grid on;
xlabel('Frequency w=2*pi*f');
ylabel('Gain');

subplot(2,1,2);
semilogx(w,phase);
title('Phase Response of the system');
grid on;
xlabel('Frequency w=2*pi*f');
ylabel('Phase shift');