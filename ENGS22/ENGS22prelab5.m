clear;

f = logspace(0,6,1000);
w=2*pi*f;
s=1j*w;

z = 1;
wn=6000*pi;

Hw = wn^2./(s.^2+2*z*wn*s+wn^2);
Ht = s.^2./(s.^2+2*z*wn*s+wn^2);
H = Hw-Ht;

rw = real(Hw);
iw = imag(Hw);

rt = real(Ht);
it = imag(Ht);

r = real(H);
i = imag(H);

transw = complex(rw,iw);
transt = complex(rt,it);
trans = complex(r,i);

magw = abs(transw);
dBw = mag2db(magw);
phasew = (360/(2*pi))*angle(transw);

magt = abs(transt);
dBt = mag2db(magt);
phaset = (360/(2*pi))*angle(transt);

mag = abs(trans);
dB = mag2db(mag);
phase = (360/(2*pi))*angle(trans);

subplot(3,2,1);
semilogx(f,dBw);
title('Magnitude Response of Hw');
xlabel('Frequency (Hz)');
ylabel('Magnitude Response (dB)');
grid on;
subplot(3,2,2);
semilogx(f,phasew);
title('Phase Response of Hw');
xlabel('Frequency (Hz)');
ylabel('Phase Shift (degrees)');
grid on;
subplot(3,2,3);
semilogx(f,dBt);
title('Magnitude Response of Ht');
xlabel('Frequency (Hz)');
ylabel('Magnitude Response (dB)');
grid on;
subplot(3,2,4);
semilogx(f,phaset);
title('Phase Response of Ht');
xlabel('Frequency (Hz)');
ylabel('Phase Shift (degrees)');
grid on;
subplot(3,2,5);
semilogx(f,dB);
title('Magnitude Response of Hw-Ht');
axis([1e0,1e6,-1,1]);
xlabel('Frequency (Hz)');
ylabel('Magnitude Response (dB)');
grid on;
subplot(3,2,6);
semilogx(f,phase);
title('Phase Response of Hw-Ht');
xlabel('Frequency (Hz)');
ylabel('Phase Shift (degrees)');
grid on;

