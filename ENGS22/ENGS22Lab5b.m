%Crossover Post Lab Question 
% Andy Werchniak 29 February 2016
clear;

%Create f and s vectors
f = logspace(1,6,4000);
w=2*pi*f;
s=1j*w;

%ideal values of R,L,C
Rexp = 6;
Cexp = 4.421e-6;
Lexp = 636.6e-6;

%Adjust values to demonstrate deviation
R1 = 1.2*Rexp;
C1 = 0.8*Cexp;
L1 = 1.2*Lexp;

R2 = 0.8*Rexp;
C2 = 1.2*Cexp;
L2 = 0.8*Lexp;

%create zetas
z1 = 1/(2*R1)*sqrt(L1/C1);
z2 = 1/(2*R2)*sqrt(L2/C2);

%create omega-ns
wn1 = 1/sqrt(L1*C1);
wn2 = 1/sqrt(L2*C2);

%First and second systems based on omega-ns and zetas
Hw1 = wn1^2./(s.^2+2*z1*wn1*s+wn1^2);
Ht1 = s.^2./(s.^2+2*z1*wn1*s+wn1^2);
H1 = Hw1-Ht1;

Hw2 = wn2^2./(s.^2+2*z2*wn2*s+wn2^2);
Ht2 = s.^2./(s.^2+2*z2*wn2*s+wn2^2);
H2 = Hw2-Ht2;

%Split into real and imaginary parts
r1 = real(H1);
i1 = imag(H1);

r2 = real(H2);
i2 = imag(H2);

%two transfer functions
trans1 = complex(r1,i1);
trans2 = complex(r2,i2);

%two magnitude responses expressed in decibels
mag1 = abs(trans1);
dB1 = mag2db(mag1);
mag2 = abs(trans2);
dB2 = mag2db(mag2);

%plot the responses
subplot(2,1,1);
semilogx(f,dB1);
title('Magnitude Response of 1.2R, 0.8C, 1.2L');
xlabel('Frequency (Hz)');
ylabel('Magnitude Response (dB)');
grid on;

subplot(2,1,2);
semilogx(f,dB2);
title('Magnitude Response of 0.8R, 1.2C, 0.8L');
xlabel('Frequency (Hz)');
ylabel('Magnitude Response (dB)');
grid on;