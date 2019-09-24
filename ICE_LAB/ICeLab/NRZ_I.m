clear

bits = [0,1,1,0,1,0,1,0,1,1,1,1];
bits
temp=2; 

promt=('Enter Voltage level');
vl=input(promt); 

amplitude(1)=vl;
for i = 2:length(bits)
    if(bits(i)==1) 
        if(amplitude(i-1)==vl)
            amplitude(i) = -vl;
            temp=-vl;
        else 
            amplitude(i) = vl;
            temp=vl;
        end
    else
        amplitude(i) = amplitude(i-1);  
    end
    
end

amplitude

plot(amplitude);


