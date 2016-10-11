t=40:-10:-40;
T=[t;t;t;t;t;t];
v=[10:10:60]';
V=[v,v,v,v,v,v,v,v,v];
Tc=round(35.74+0.6215*T-35.75*V.^0.16+0.4275*T.*V.^0.16)

fprintf('\t\t\tTemperature (F)\n      ');
disp(t);
fprintf('Speed\n(mi/h)\n');
disp([v,Tc]);
