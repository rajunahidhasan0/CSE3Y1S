clc;
clear;

data = [1 1 0 1 1 0 1 0 0 0 0 1 0];
k=1;
t=0;
voltageLevel=5;
samplesize = 100000;
bitrate = 5;
for j=1:length(data)
      
        if data(j)==1
            for i=0:1/samplesize:(bitrate/2) 
             result(k)=-voltageLevel;
             time(k)=t;
             k=k+1;
             t=t+1;
            end;
             for l=i:1/samplesize:bitrate
                result(k)=voltageLevel;
                time(k)=t;
                k=k+1;
                t=t+1;     
             end;
            
        else
             for i=0:1/samplesize:(bitrate/2) 
             result(k)=voltageLevel;
             time(k)=t;
             k=k+1;
             t=t+1;
            end;
             for l=i:1/samplesize:bitrate
                result(k)=-voltageLevel;
                time(k)=t;
                k=k+1;
                t=t+1;     
             end;
         end;
   end;
     
plot(time,result);
