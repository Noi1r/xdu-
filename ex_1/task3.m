t = [0:4*pi/1000:4*pi];
n = 200;
f = [0:4*pi/1000:0];
for k=1:n
    f = f+sin((2*k-1)*t)/(2*k-1);
end

plot(t,f)