function output = dydt(t,y)
    m0=500;
    k0=0.05;
    b0=50;
    Vin=1;

    output = [y(2); k0/b0*y(2) - k0/m0];