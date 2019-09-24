
n = [1,1,0,1,1,0,0,1,0,0,0];

for ii=1:length(n)
    
    if n(ii)==1;
        nn(ii) = -3;
    else 
        nn(ii) = 3;
    end
end

i=1;
t=0:0.01:length(n);

for j=1:length(t)
    y(j)=nn(i);
    if t(j)>i;
        i=i+1;
    end
end

plot(t, y, 'b-');
axis([0 length(n) -5 5]);

i=1;
for j=1:length(t)
    if t(j)>i
        if y(j)==-3
            ans(i)=1
            i=i+1;
        else
            ans(i)=0
            i=i+1;
        end
    end
end