clear;
N = 8;
M = 10;
k = 20;     %W/mdegC
H = 0.3;    %m
A = 1*H;    %m^2

y = 1:M;
x = 1:N;
ncont = length(x)-1;

%Initialize T matrix
T = ones(M,N);

%Type I BC
T(:,N) = 8*ones(M,1);

for l=1:500 %after 500 iterations, values are within 1/10000

    %algorithm developed in class
    for i=2:M-1
        for j=2:N-1
            T(i,j) = 0.25*(T(i+1,j)+T(i-1,j)+T(i,j+1)+T(i,j-1));
        end
    end
    
    %Insulated boundaries mean delT=0
    T(1,:) = T(2,:);
    T(M,:) = T(M-1,:);
    T(:,1) = T(:,2);
end

%round T to the nearest 1/10000
T = round(T,4);

pcolor(x,y,T); shading flat; axis square;
colorbar SouthOutside;
hold on;
% C = contour(x,y,T,ncont,'w');
% clabel(C,'Color','w');
xlabel('x(m)');
ylabel('y(m)');
title('Andy Werchniak PS8-1b Plot');
set(gca, 'YDir', 'reverse');