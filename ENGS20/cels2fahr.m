choice=input('Enter 1 to convert Celsius to Farenheit\nEnter 2 to convert Farenheit to Celsius\n');
min = input('Enter the minimum value: ');
max = input('Enter the maximum value: ');
n = input('Enter the number of values you would like to display: ');
file=fopen('output.txt','w');
if (choice==1)
    array = [linspace(min,max,n);(linspace(min,max,n).*9/5+32)];
    fprintf('Celsius Farenheit\n');
    fprintf('%6.2f %6.2f\n', array);
    fprintf(file, 'Celsius, Farenheit\n');
    fprintf(file, '%.2f, %.2f\n', array);
elseif(choice==2)
    array = [(linspace(min,max,n)-32).*5/9;linspace(min,max,n)];
    fprintf('Farenheit Celsius\n');
    fprintf('%6.2f %6.2f\n', array);
    fprintf(file, 'Farenheit, Celsius\n');
    fprintf(file, '%.2f, %.2f\n', array);
end
fclose(file);
    
    
    