%%第一题1
t=[-5:0.01:5];
f1=heaviside(t)-heaviside(t-1);
f2=2*t.*(heaviside(t)-heaviside(t-1));
k=2*length(t)-1;
k=linspace(t(1),t(end),k);

out1=conv(f1,f2)*0.01;
subplot(2,1,1)
plot(k,out1);
xlabel("t");
grid on

f1_2=cos(30*t).*(heaviside(t+2.5)-heaviside(t-2.5));
f2_2=heaviside(t)-heaviside(t-4);
out2=conv(f1_2,f2_2)*0.01;
subplot(2,1,2)
plot(k,out2);
xlabel("t");
grid on