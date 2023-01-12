
sum=0;
t=-10:0.01:10;%t=1:0.001:10;
for i=1:100
    sum=sum+sin(i*t)./i;
end
plot(t,sum);

plot(t,((pi-t)./2));


%%2
t = -1:0.01:1;
syms n
out1 = symsum(sin(n*t)/n,n,1,50);
out2 = symsum(sin(n*t)/n,n,1,100);
out3 = symsum(sin(n*t)/n,n,1,200);
max = symsum(sin(n*t) / n,n,1,999);%%%Inf运行太久了

plot(t,max);
hold on
plot(t,out1,'r');
hold on
plot(t,out2,'g');
hold on
plot(t,out3,'b');

t=-3:0.01:3;
sum1=0;sum2=0;sum3=0;
y1=0;y2=0;y3=0;

for n=1:1:50
	for i=1:1:n
		y1=y1 + sin(i.*t)./i;
	end;
	sum1=sum1+y1;
	y1=0;
end;

for n=1:1:100
	for i=1:1:n
		y2=y2 + sin(i.*t)./i;
	end;
	sum2=sum2+y2;
	y2=0;
end;

for n=1:1:200
	for i=1:1:n
		y3=y3 + sin(i.*t)./i;
	end;
	sum3=sum3+y3;
	y3=0;
end;
out1=sum1./50;
out2=sum2./100;
out3=sum3./200;
plot(t,out1,'r',t,out2,'b',t,out3,'g');