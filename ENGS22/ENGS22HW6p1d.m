clear;

Rc=1.04;
Rb1=0.606;
Rb2=0.606;
Cc=9.878;
Cb1=8362;
Cb2=8362;
Tin=30;
x0=[2;2;20];
tmax= 60*60*8;

A= [-1/(Rc*Cc)-1/(Rb1*Cc)-1/(Cc*Rb2), 1/(Rb1*Cc), 1/(Rb2*Cc);
    1/(Cb1*Rb1), -1/(Cb1*Rb1), 0;
    1/(Cb2*Rb2), 0, -1/(Cb2*Rb2)];

B= [(1/(Rc*Cc)); 0; 0];

C = eye(3);

D= [];


t = 0:0.01:tmax;
u = Tin*ones(1,length(t));

sys = ss(A,B,C,D);
[y,t] = lsim(sys,u,t,x0);

plot(t,y(:,1));
axis([0,tmax,0,30]);
hold on;
plot(t,y(:,2));
plot(t,y(:,3));
grid on;
title('Temperature of the System over Eight Hours');
xlabel('Time (s)');
ylabel('Temperature (C)');
legend('Temp of air within cooler', 'Temp of water in bottle 1', 'Temp of water in bottle 2');