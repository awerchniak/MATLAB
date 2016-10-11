m0=500;
k0=0.05;
b0=50;
Vin=1;

A=[k0/m0,-k0/m0,0;k0/b0,-k0/b0,0;0,0,1];
B=[0;1;0];
C=[0,0,1];
D=[Vin];

StateSpace = ss(A,B,C,D);
step(StateSpace);
ylabel('x2 (m/s)');
xlabel('time');


