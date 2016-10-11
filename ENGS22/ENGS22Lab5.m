clear;

f = [750,1500,3000,6000,12000];
w=2*pi*f;
s=1j*w;

R1=6.20;
R2=6.20;
C1=4.427e-6;
C2=4.440e-6;
L1=635.9e-6;
L2=636.8e-6;

zW = 1/(2*R1)*sqrt(L1/C1);
zT = 1/(2*R2)*sqrt(L2/C2);

wnW = 1/sqrt(L1*C1);
wnT = 1/sqrt(L2*C2);

Hw = wnW^2./(s.^2+2*zW*wnW*s+wnW^2);
Ht = s.^2./(s.^2+2*zT*wnT*s+wnT^2);

rw = real(Hw);
iw = imag(Hw);

rt = real(Ht);
it = imag(Ht);

transw = complex(rw,iw);
transt = complex(rt,it);

magw = abs(transw);
dBw = mag2db(magw);
phasew = (360/(2*pi))*angle(transw);

magt = abs(transt);
dBt = mag2db(magt);
phaset = (360/(2*pi))*angle(transt);

magWoofer = [0.868,0.751,0.477,0.183,0.051];
dBWoofer = mag2db(magWoofer);
phaseWoofer = [-27,-51,-87,-124,-140];

magTweeter = [0.051,0.188,0.482,0.782,0.883];
dBTweeter = mag2db(magTweeter);
phaseTweeter = [140,124,89,52,30];

error1 = rms(magw, magWoofer);
error2 = rms(phasew, phaseWoofer);
error3 = rms(magt,magTweeter);
error4 = rms(phaset, phaseTweeter);

fprintf('Woofer Magnitude RMS Error: %f\n', error1);
fprintf('Woofer Phase RMS Error: %f\n', error2);
fprintf('Tweeter Magnitude RMS Error: %f\n', error3);
fprintf('Tweeter Phase RMS Error: %f\n', error4);

subplot(2,2,1);
semilogx(f,dBw);
hold on;
semilogx(f,dBWoofer);
legend('Theoretical', 'Measured');
title('Magnitude Response of Woofer');
xlabel('Frequency (Hz)');
ylabel('Magnitude Response (dB)');
grid on;

subplot(2,2,2);
semilogx(f,phasew);
hold on;
semilogx(f,phaseWoofer);
legend('Theoretical', 'Measured');
title('Phase Response of Woofer');
xlabel('Frequency (Hz)');
ylabel('Phase Shift (degrees)');
grid on;

subplot(2,2,3);
semilogx(f,dBt);
hold on;
semilogx(f,dBTweeter);
legend('Theoretical', 'Measured');
title('Magnitude Response of Tweeter');
xlabel('Frequency (Hz)');
ylabel('Magnitude Response (dB)');
grid on;

subplot(2,2,4);
semilogx(f,phaset);
hold on;
semilogx(f,phaseTweeter);
legend('Theoretical', 'Measured');
title('Phase Response of Tweeter');
xlabel('Frequency (Hz)');
ylabel('Phase Shift (degrees)');
grid on;