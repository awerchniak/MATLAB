clear;
N = 8;
M = 10;
k = 20;     %W/mdegC
H = 0.3;    %m
A = 1*H;    %m^2

y = 1:M;
x = 1:N;
ncont = length(x)-1;

%2a
%Initialize T matrix
T = ones(M,N);

%Type I BC's
T(:,1) = zeros(M,1);
T(:,N) = 8*ones(M,1);

l = 1;
while(l<50) %after 50 iterations, less than 1% change (found empirically)

    %Insulated boundaries mean delT=0
    T(1,:) = T(2,:);
    T(M,:) = T(M-1,:);
    for i=2:M-1
        for j=2:N-1
            T(i,j) = 0.25*(T(i+1,j)+T(i-1,j)+T(i,j+1)+T(i,j-1));
        end
    end
    l = l+1;
end

%2b
pcolor(x,y,T); shading flat; axis square;
colorbar SouthOutside;
hold on;
C = contour(x,y,T,ncont,'w');
clabel(C,'Color','w');
xlabel('x(m)');
ylabel('y(m)');
title('Andy Werchniak PS7-2 Plot');
set(gca, 'YDir', 'reverse');

%2c: noninsulated w/ lowest temperature at x=0 (T(:,1))
%Q = -kAdelT
delT = sum(T(:,1)-T(:,2));
Q = -k*A*delT;
fprintf('Q=%fW\n', Q);
% %output:
% Q=67.27155W