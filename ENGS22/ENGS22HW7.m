clear;

f = logspace(-2,3,5000);
w=2*pi*f;
s=1j*w;

H1 = 2./(s+2);
H2 = (s+6)./(s+60);
H3 = (s+1)./((s+10).*(s+60));

trans1 = complex(real(H1),imag(H1));
trans2 = complex(real(H2),imag(H2));
trans3 = complex(real(H3),imag(H3));

mag1 = abs(trans1);
dB1 = mag2db(mag1);
phase1 = (360/(2*pi))*angle(trans1);

mag2 = abs(trans2);
dB2 = mag2db(mag2);
phase2 = (360/(2*pi))*angle(trans2);

mag3 = abs(trans3);
dB3 = mag2db(mag3);
phase3 = (360/(2*pi))*angle(trans3);

subplot(3,2,1);
semilogx(f,dB1);
title('Magnitude Response of H1');
xlabel('Frequency (Hz)');
ylabel('Magnitude Response (dB)');
grid on;
subplot(3,2,2);
semilogx(f,phase1);
title('Phase Response of H1');
xlabel('Frequency (Hz)');
ylabel('Phase Shift (degrees)');
grid on;
subplot(3,2,3);
semilogx(f,dB2);
title('Magnitude Response of H2');
xlabel('Frequency (Hz)');
ylabel('Magnitude Response (dB)');
grid on;
subplot(3,2,4);
semilogx(f,phase2);
title('Phase Response of H2');
xlabel('Frequency (Hz)');
ylabel('Phase Shift (degrees)');
grid on;
subplot(3,2,5);
semilogx(f,dB3);
title('Magnitude Response of H3');
xlabel('Frequency (Hz)');
ylabel('Magnitude Response (dB)');
grid on;
subplot(3,2,6);
semilogx(f,phase3);
title('Phase Response of H3');
xlabel('Frequency (Hz)');
ylabel('Phase Shift (degrees)');
grid on;