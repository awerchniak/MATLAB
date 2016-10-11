%Fluids Prelab
%ENGS 22
%Andy Werchniak 02/16/2016
clear;

wn = 1;
z = [0.15,0.20,0.30,0.40,0.50,0.60];
w = logspace(-1,1,100);

hold on;
grid on;

for i = 1:length(z)
    H = 1./sqrt((((wn^2-w.^2).^2)+(2*z(i)*wn.*w).^2));
    fprintf('z= %d\n', z(i));
    [maximum, index] = max(H);
    fprintf('Max Pout/Pin: %d\n', maximum);
    fprintf('wn/Resonant Frequency: %d\n\n', 1/w(index));
    loglog(w,H);
end

set(gca,'XScale','log');
set(gca,'YScale','log');
title('Magnitude Response of Fluid System');
xlabel('Frequency (rad/s)');
ylabel('Pressure Out/Pressure In');
legend('z=0.15','z=0.20','z=0.30','z=0.40','z=0.50','z=0.60');