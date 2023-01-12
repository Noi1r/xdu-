
sys=tf([2,1],[1,4,3]);
t=-10:0.01:10;
ht=impulse(sys,t);
k=floor(length(t)/2)+1;
k=linspace(t(1),t(end),k);
subplot(1,3,1);
plot(k,ht)

%%阶跃响应
gt=step(sys,t);
subplot(1,3,2);
plot(k,gt)

%%对普通信号f(t)
t=0:0.001:10;
ft=4*sin(2*pi*t).*heaviside(t);
out=lsim(sys,ft,t);
subplot(1,3,3)
plot(t,out)