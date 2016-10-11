clear;
N = 8;
M = 10;
k = 20;         %W/mdegC
H = 0.3;        %m
A = 1*H;        %m^2
Q = 67.271538;  %W

y = 1:M;
x = 1:N;
ncont = 50;

%Initialize T matrix
T = ones(M,N);

%Type I BC
T(:,N) = 8*ones(M,1);

for l=1:100 %after 50 iterations, less than 1% change (found empirically)

    %algorithm developed in class
    for i=2:M-1
        for j=2:N-1
            T(i,j) = 0.25*(T(i+1,j)+T(i-1,j)+T(i,j+1)+T(i,j-1));
        end
    end
    
    %Insulated boundaries mean delT=0
    T(1,2:N) = T(2,2:N);
    T(M,:) = T(M-1,:);
    T(2:M,1) = T(2:M,2);
    
    %Type II boundary at T(1,1)
    T(2,1) = T(1,1)-Q/(-2*k*A);
    T(1,2) = T(1,1)-Q/(-2*k*A);
end
v = [3, 5, 6.5, 6.70, 6.9, 7.04, 7.18, 7.31, 7.45, 7.59, 7.73, 7.86];
pcolor(x,y,T); shading flat; axis square;
colorbar SouthOutside;
hold on;
C = contour(x,y,T,v,'k');
clabel(C,'Color','k');
xlabel('x(m)');
ylabel('y(m)');
title('Andy Werchniak PS8-1c Plot');
set(gca, 'YDir', 'reverse');

%Only heat flux leaving is at T(1,1)
%Q = -kAdelT
delT = sum([T(1,1)-T(2,1),T(1,1)-T(1,2)]);
Q = -k*A*delT;
fprintf('Q=%fW\n', Q);
