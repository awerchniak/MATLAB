N=input('Enter dimensions of matrix: ');
a=input('Enter minimum value: ');
b=input('Enter maximum value: ');
fileName=input('Enter a file to print to: ', 's');
matrix=round(a+rand(N,N,N)*(b-a));

file= fopen(fileName, 'w');
for i= 1:N
    fprintf(file, 'matrix(:,:,%d)=\n', i);
    for j = 1:N
        for k = 1:N
            fprintf(file,'%d', matrix(j,k,i));
        end
        fprintf(file, '\n');
    end
    fprintf(file, '\n\n');
end
fclose(file);