clear;

%2a
z = 23;
n = 10+z;
r=1;    %ohms
c=1;    %Farads

%Create A Matrix
v1 = ones(1,n-1);
M1 = diag(v1,-1);
v2 = ones(1,n-1);
M2 = diag(v2,1);
v3 = -2*ones(1,n);
M3 = diag(v3);
A=M1+M2+M3;
A(1,1)=-3;
A(n,n)=-3;
A = A*r*c;

%2b: Find eigenvectors and eigenvalues, plot vector w/ smallest value
[vec,val] = eig(A);

k = 1:n;
eigenvector = vec(:,n)';        %the smallest value is the last one
eigenvector = eigenvector/eigenvector(1);   %Set cleaner magnitudes
eigenvalue = val(n,n);          %eigenvalue corresponding with eigenvector
plot(k,eigenvector,'b.', 'MarkerSize',12);
grid on;
title('Andy Werchniak PS3-2: Eigenvector Plot');
xlabel('Node, k');
ylabel('Eigenvector Values');

%add label
x1 = 1;
y1 = eigenvector(x1);
txt1 = ['   \lambda = ' num2str(eigenvalue)];
text(x1,y1,txt1);
