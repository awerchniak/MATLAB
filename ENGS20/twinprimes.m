num=input('Enter a number: ');
a = primes(num);
b = a+2;
locations = isprime(b);
twins=a(locations);
partners=twins+2;
pairs=[twins' partners']