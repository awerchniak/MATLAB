% Compute magnetic field in one plane around dipole 
% with known radius, a, and magnetization, M.
% Dipole is aligned with y axis, where theta defined as zero.
% Display centers of square grid elements.

clear

format short

Mag = 11e5;             % magnetization of rare earth magnet, amps/meter
a = (0.75/2) / 39.37;   % magnet radius, meters
mu_0 = 4*pi*1e-7;       % permeability of vacuum, farads/meter
S = 2 / 39.37;          % Physical side length of each square, meters
N_0 = 5;                % Number of squares in the half-side length of calculation domain
F = 16;                 % Fineness factor: number of points calculated along each square
                        % side length; make > 1 for smooth plot.
N =   1 + 2*F*N_0;      % Number of calculation squares, odd, in array
dx = S/F;               % Physical step size in calculated grid: small for smoothness; needed for gradient calculation

XC = 1 + (N-1)/2;
YC = 1 + (N-1)/2;

%location of first magnet
Xshift1 = 2*S;
Yshift1 = 0*S;

%set Xdist & Ydist
[Xdist, Ydist] = meshgrid(1:N, 1:N);
Xdist = dx*(Xdist-XC);
Ydist = dx*(Ydist-YC);

%Shift first magnet appropriately
Xdist = Xdist+Xshift1;
Ydist = Ydist+Yshift1;

%calculate angle of first magnet
rho1 = ((Xdist.^2) + (Ydist.^2)).^0.5;
Theta1 = atan2(Ydist, Xdist);
Theta1 = Theta1-pi/2;

% Potential of 3-D dipole, SFW, p 350,
% with p = 4*pi * a^3 * Mag / 3
% Phi = cos(Theta);
% Phi = Phi  ./ rho .^2;
% Phi = Phi  * 4*pi * Mag * a^3 / 3;
% Phi = Phi  / (4*pi);
Phi1 = cos(Theta1)*Mag*a^3./(3*rho1.^2);   %Calculate potential, condensed into one line

%shift location of second magnet
Xshift2 = 1*S;
Yshift2 = -1*S;

%reset Xdist & Ydist
[Xdist, Ydist] = meshgrid(1:N, 1:N);
Xdist = dx*(Xdist-XC);
Ydist = dx*(Ydist-YC);

%shift magnet 2
Xdist = Xdist+Xshift2;
Ydist = Ydist+Yshift2;

%calculate angle of second magnet
rho2 = ((Xdist.^2) + (Ydist.^2)).^0.5;
Theta2 = atan2(Ydist, Xdist);
Theta2 = Theta2-pi/2; % Put theta = 0 along vertical axis (y axis).

%calculate potential
Phi2 = cos(Theta2)*Mag*a^3./(3*rho2.^2);   %condensed into one line

%location of third magnet
Xshift3 = 0*S;
Yshift3 = -2*S;

%reset Xdist & Ydist
[Xdist, Ydist] = meshgrid(1:N, 1:N);
Xdist = dx*(Xdist-XC);
Ydist = dx*(Ydist-YC);

%Shift third magnet appropriately
Xdist = Xdist+Xshift3;
Ydist = Ydist+Yshift3;

%calculate angle of first magnet
rho3 = ((Xdist.^2) + (Ydist.^2)).^0.5;
Theta3 = atan2(Ydist, Xdist);
Theta3 = Theta3-pi/2; % Put theta = 0 along vertical axis (y axis).

% Potential of 3-D dipole, SFW, p 350,
% with p = 4*pi * a^3 * Mag / 3
% Phi = cos(Theta);
% Phi = Phi  ./ rho .^2;
% Phi = Phi  * 4*pi * Mag * a^3 / 3;
% Phi = Phi  / (4*pi);
Phi3 = cos(Theta3)*Mag*a^3./(3*rho3.^2);   %Calculate potential, condensed into one line

%location of fourth magnet
Xshift4 = -1*S;
Yshift4 = -3*S;

%reset Xdist & Ydist
[Xdist, Ydist] = meshgrid(1:N, 1:N);
Xdist = dx*(Xdist-XC);
Ydist = dx*(Ydist-YC);

%Shift fourth magnet appropriately
Xdist = Xdist+Xshift4;
Ydist = Ydist+Yshift4;

%calculate angle of fourth magnet
rho4 = ((Xdist.^2) + (Ydist.^2)).^0.5;
Theta4 = atan2(Ydist, Xdist);
Theta4 = Theta4 - pi/2; 

% Potential of 3-D dipole, SFW, p 350,
% with p = 4*pi * a^3 * Mag / 3
% Phi = cos(Theta);
% Phi = Phi  ./ rho .^2;
% Phi = Phi  * 4*pi * Mag * a^3 / 3;
% Phi = Phi  / (4*pi);
Phi4 = cos(Theta4)*Mag*a^3./(3*rho4.^2);   %Calculate potential, condensed into one line

%total potential is sum of the magnets!
Phi = Phi1+Phi2+Phi3+Phi4;

% Labels for axes of contour plot, meters
X = 1:N;
X = X - floor(N/2) - 1;
X = dx * X;
Y = X;

Levels = 20:20:200;    % Levels to be labeled in potential contour plot
q = length(Levels);
Levels(q+1:2*q) = -Levels;      % Include symmetric negative levels

figure(1)
[C, H] = contour(X, Y, Phi, Levels);
clabel(C, H, Levels)
xlabel('X-axis: Relative location, meters;  magnet at red arrow')
ylabel('Y-axis: Relative location, meters;  magnet at red arrow')
grid off
axis equal
hold on
plot([0 0],[0 max(Y)], '--')
% Plot an 'X' at center of each square on playing grid
q = (N-1)/(2*F);
for i=(-q+1):1:(q-1)
    for j=(-q):1:(q)
        plot(dx*F*(i), dx*F*(j),'X');
    end
end
hold off
% Draw arrow at location of magnet.
% Add offset to X and Y vectors to shift arrow to new location.
hold on
plot(-Xshift1, -Yshift1, '*r', 'LineWidth',1.5);
plot(-Xshift2, -Yshift2, '*r', 'LineWidth',1.5);
plot(-Xshift3, -Yshift3, '*r', 'LineWidth',1.5);
plot(-Xshift4, -Yshift4, '*r', 'LineWidth',1.5);
hold off
title('Potential Phi;  X denotes center of each square')
text(S/4, 0.55*max(Y), 'Theta=0: orientation of dipole')
text(S/4, 0.50*max(Y), 'Positive theta is CCW, as usual')
figure(gcf)
axis([-0.24 0.24 -0.01 0.24])
orient portrait

% Take gradient of potential to find fields:
[B_x, B_y] = gradient(Phi, dx);
B_x = - B_x;
B_y = - B_y;
B_x = mu_0 * 1000 * B_x;  % Convert to B, then to milliTesla
B_x = abs(B_x);
B_y = mu_0 * 1000 * B_y;  % Convert to B, then to milliTesla
B_y = abs(B_y);

Levels = [ 0.5 1 4];    % Levels to be labeled in field contour plot
q = length(Levels);
Levels(q+1:2*q) = -Levels;      % Include symmetric negative levels

figure(2)
[C, H] = contour(X, Y, B_y, Levels);
clabel(C, H, Levels)
xlabel('X-axis: Relative location, meters;  magnet at red arrow')
ylabel('Y-axis: Relative location, meters;  magnet at red arrow')
grid off
axis equal
hold on
plot([0 0],[0 max(Y)], '--')
% Plot an 'X' at center of each square on playing grid
q = (N-1)/(2*F);
for i=(-q+1):1:(q-1)
    for j=(-q):1:(q)
        plot(dx*F*(i), dx*F*(j),'X');
    end
end
hold off
% Draw arrow at location of magnet.
% Add offset to X and Y vectors to shift arrow to new location.
hold on
plot(-Xshift1, -Yshift1, '*r', 'LineWidth',1.5);
plot(-Xshift2, -Yshift2, '*r', 'LineWidth',1.5);
plot(-Xshift3, -Yshift3, '*r', 'LineWidth',1.5);
plot(-Xshift4, -Yshift4, '*r', 'LineWidth',1.5);
hold off
title('Absolute Value of Y-directed B field, in milliTesla;  X denotes center of each square')
text(S/4, 0.85*max(Y), 'Theta=0: orientation of dipole')
text(S/4, 0.80*max(Y), 'Positive theta is CCW, as usual')
text(-0.23, 0.85*max(Y), 'Array design by <YOUR NAME>')
figure(gcf)
axis([-0.24 0.24 -0.01 0.24])
orient portrait

figure(3)
[C, H] = contour(X, Y, B_x, Levels);
clabel(C, H, Levels)
xlabel('X-axis: Relative location, meters;  magnet at red arrow')
ylabel('Y-axis: Relative location, meters;  magnet at red arrow')
grid off
axis equal
hold on
plot([0 0],[0 max(Y)], '--')
% Plot an 'X' at center of each square on playing grid
q = (N-1)/(2*F);
for i=(-q+1):1:(q-1)
    for j=(-q):1:(q)
        plot(dx*F*(i), dx*F*(j),'X');
    end
end
hold off
% Draw arrow at location of magnet.
% Add offset to X and Y vectors to shift arrow to new location.
hold on
plot(-Xshift1, -Yshift1, '*r', 'LineWidth',1.5);
plot(-Xshift2, -Yshift2, '*r', 'LineWidth',1.5);
plot(-Xshift3, -Yshift3, '*r', 'LineWidth',1.5);
plot(-Xshift4, -Yshift4, '*r', 'LineWidth',1.5);
hold off
title('Absolute Value of X-directed B field, in milliTesla;  X denotes center of each square')
text(S/4, 0.85*max(Y), 'Theta=0: orientation of dipole')
text(S/4, 0.80*max(Y), 'Positive theta is CCW, as usual')
text(-0.23, 0.85*max(Y), 'Array design by <YOUR NAME>')
figure(gcf)
axis([-0.24 0.24 -0.01 0.24])
orient portrait