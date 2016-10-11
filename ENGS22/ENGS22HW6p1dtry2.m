clear;

Rc=1.04;
R1=0.606;
R2=0.606;
C1=8362;
C2=8362;
Tin=30;
x0=[2;20];
tmax= 60*60*8;

a=1/(C1*Rc+C1*R1+(C1*R1*Rc)/R2);
b=(Rc+R2)/(C1*Rc*R2+C1*R1*R2+C1*R1*Rc);
c=1/(C1*R2+(C1*R1*R2)/Rc+C1*R1);
d=1/(C2*R2+(C2*R2^2)/Rc+(C2*R2^2)/R1);
e=(R1+Rc)/(C2*Rc*R1+C2*R1*R2+C2*Rc*R2);
f=1/(C2*R1+(C2*R1*R2)/Rc+C2*R2);

A= [b,c;
    e,f];

B= [a;d];

C = eye(2);

D= [];


t = 0:0.01:tmax;
u = Tin*ones(1,length(t));

sys = ss(A,B,C,D);
[y,t] = lsim(sys,u,t,x0);

plot(t,y(:,1));
%axis([0,tmax,0,30]);
hold on;
plot(t,y(:,2));
grid on;
title('Temperature of the System over Eight Hours');
xlabel('Time (s)');
ylabel('Temperature (C)');
legend('Temp of water in bottle 1', 'Temp of water in bottle 2');