clear;
getCode;
PS_8_2;

X = 1:length(Vx);
Y = 1:length(Vy);

%2b: plot on streamslice
figure;
streamslice(X,Y,Vx,Vy);
title('Andy Werchniak ps8-2b Plot');
grid on;
xlabel('x(m)');
ylabel('y(m)');
set(gca,'YDir','reverse');

%2c
%compute average x value
sum=0;
for i=1:length(Vx(:,1))
    for j = 1:length(Vx(1,:))
        sum = sum + Vx(i,j);
    end
end
avgx = sum/(i*j);

%compute average y value
sum=0;
for i=1:length(Vy(:,1))
    for j = 1:length(Vy(1,:))
        sum = sum + Vy(i,j);
    end
end
avgy = sum/(i*j);

%subtract average value from velocity vectors
Vx = Vx-avgx;
Vy = Vy-avgy;

%plot original plot again
figure;
quiver(X,Y,Vx,Vy);
set(gca,'YDir','reverse');
grid on;
title('Andy Werchniak ps8-2c Plot');
xlabel('x(m)');
ylabel('y(m)');

%plot again
figure;
streamslice(X,Y,Vx,Vy);
set(gca,'YDir','reverse');
title('Andy Werchniak ps8-2c Plot');
grid on;
xlabel('x(m)');
ylabel('y(m)');

%2d calculate circulation source
%get vectors at 4 points surrounding source
v1 = [Vx(8),Vy(6)];
v2 = [Vx(9),Vy(6)];
v3 = [Vx(9),Vy(5)];
v4 = [Vx(8),Vy(5)];

%get their magnitudes
v1 = sqrt(v1(1)^2+v1(2)^2);
v2 = sqrt(v2(1)^2+v2(2)^2);
v3 = sqrt(v3(1)^2+v3(2)^2);
v4 = sqrt(v4(1)^2+v4(2)^2);

%avg magnitude
v = mean([v1,v2,v3,v4]);
%calculate gamma
gamma = 2*pi*(sqrt(2)/2)*v
%output:
% gamma =
% 
%     0.7517

%2e calculate line flux source
%get vectors at 4 points surrounding
v1 = [Vx(8),Vy(9)];
v2 = [Vx(9),Vy(9)];
v3 = [Vx(9),Vy(8)];
v4 = [Vx(8),Vy(8)];

%get their magnitudes
v1 = sqrt(v1(1)^2+v1(2)^2);
v2 = sqrt(v2(1)^2+v2(2)^2);
v3 = sqrt(v3(1)^2+v3(2)^2);
v4 = sqrt(v4(1)^2+v4(2)^2);

%avg magnitude
v = mean([v1,v2,v3,v4]);
%calculate Fprime
Fprime = -2*pi*(sqrt(2)/2)*v        %negative because vectors point inwards
%output:
% Fprime =
% 
%     0.6391