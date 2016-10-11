clear;

f = logspace(-2,3,5000);
w=2*pi*f;
s=j*w;

H=(4*pi*s)./(s.^2+6*pi*s+40*pi^2);

r = real(H);
i = imag(H);

trans = complex(r,i);

mag = abs(trans);
dB = mag2db(mag);
phase = (360/(2*pi))*angle(trans);

subplot(2,1,1);
semilogx(f,dB);
title('Magnitude Response');
xlabel('Frequency (Hz)');
ylabel('Magnitude Response (dB)');
grid on;
subplot(2,1,2);
semilogx(f,phase);
title('Phase Response');
xlabel('Frequency (Hz)');
ylabel('Phase Shift (degrees)');
grid on;