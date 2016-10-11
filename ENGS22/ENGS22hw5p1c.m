%Code to test different C values to find one that results in a max Vc JUST
%   below 250 (brute force method)

clear;

L=100*1e-6;
R=100;
V1=150;

%input different numbers here until something close
%   smaller C = bigger max(at least in this range)
%   started around 1x10^-9 because it's right in the middle of the range
%   given in e)
C=5.127e-9;
%based on empirical testing this is a good time range
t=0:1e-8:1e-5;
%line at V=250 for comparison
y=250*ones(1,length(t));

%based on equations 24 & 27a of laplace table
w=1/sqrt(L*C);
z=R/2*sqrt(C/L);

%split into parts to avoid errors
Vc1=1.5./C.*(exp(-z.*w.*t)./(w.*sqrt(1-z.^2)).*sin(w.*sqrt(1-z.^2).*t));
Vc2=V1./(L.*C).*(1./w.^2-exp(-z.*w.*t)/(w.^2.*sqrt(1-z.^2)).*sin(w.*sqrt(1-z.^2).*t+acos(z)));

%compute Vc
Vc = Vc1+Vc2;

%plot to compare
plot(t,Vc);
hold on;
plot(t,y);
%window good for seeing graph. Can zoom in on the max (max t changes when
%   max c changes)
axis([min(t),max(t),0,300]);