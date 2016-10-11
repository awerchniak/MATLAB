clear;
getCode;
PS_7_1;

k = 40;         %W/mdegC
H = 0.05;       %m
delx = 1;       %m
dely = delx;    %m
A = delx*H;     %m^2
ncont = 20;
ngrad = ncont/2;

x = 1:delx:21;
y = 1:dely:19;
dxg=max(x)/(ngrad);
[gux,guy] = gradient(T, dxg);
qx = -k*A*gux;
qy = -k*A*guy;

pcolor(x,y,T); shading flat; axis square;
colorbar SouthOutside;
hold on;
contour(x,y,T,ncont,'k');
title('Andy Werchniak ps7-1 Plot');
quiver(qx,qy,'w');
xlabel('x(m)');
ylabel('y(m)');
hold off;
set(gca, 'YDir', 'reverse');

%1e: Compute heatflux by Q = -kAdelT
top = T(1,:)-T(2,:);
bottom = T(length(y),:)-T(length(y)-1,:);
left = T(:,1)-T(:,2);
right = T(:,length(x))-T(:,length(x)-1);

Q = -k*A*(sum(top)+sum(bottom)+sum(left)+sum(right));
fprintf('Q=%f\n', Q);
%output(in watts):
% Q=43.822597

%1g
[qx,qy] = gradient(T);
sum(sum(divergence(qx,qy)));
%output(should be watts, but error):
% ans =
% 
%   -21.7311