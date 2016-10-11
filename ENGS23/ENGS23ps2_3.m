clear;

%set A matrix
A = [-3,1,0;
     1,-2,1;
     0,1,-3];
 
 %3c: let Matlab do the math to find the eigenvectors/eigenvalues
 [vec,val] = eig(A);
 
 %3d: print out magnitude of the three vectors
 %round to avoid annoying gratuitous decimal places
 fprintf('mag1=%d\n', round(norm(vec(:,1))));     %1.0
 fprintf('mag2=%d\n', norm(vec(:,2)));     %1.0
 fprintf('mag3=%d\n', norm(vec(:,3)));     %1.0
 
 %3e: Make the vectors have normal looking values
 for i = 0:2
     vec(:,3-i) = vec(:,3-i)./vec(1,3-i);
 end

 %print intermediate value and vector
 %round to avoid annoying gratuitous decimal places
 fprintf('Intermediate Eigenvalue: %d\n', val(2,2));
 fprintf('Associated Eigenvector: [%d;%d;%d]\n', round(vec(1,2)), round(vec(2,2)), round(vec(3,2)));