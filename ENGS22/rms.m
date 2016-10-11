function err = rms(a,b) % function err = rms(a,b) % compute the rms difference between two vectors, a and b % a and b must be the same length
    
    err = sqrt(mean((a-b).^2)); 
    
return