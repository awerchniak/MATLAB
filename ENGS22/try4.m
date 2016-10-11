m0=500;
k0=0.05;
b0=50;
Vin=1;

A=[0,-1/m0;k0,-k0/b0];
B=[0;k0];
C=[1,0];
D=[];

StateSpace = ss(A,B,C,D);
step(StateSpace);
ylabel('v2 (m/s)');
xlabel('time');


