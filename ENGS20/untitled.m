a=[5,7,8;0,1,9;4,3,6];
A(:,:,1)=a;
A(:,:,2)=a;
A(:,:,3)=a;
for i= 1:3
    for j= 1:3
        fprintf('%d', A(:,j,i))
        fprintf('\n');
    end
    fprintf('\n');
end