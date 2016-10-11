T=input('Enter temperature: ');
v=input('Enter wind speed: ');
Tc=35.74+0.6215*T-35.75*v^0.16+0.4275*T*v^0.16;
disp('The wind chill temperature is ')
disp(Tc)