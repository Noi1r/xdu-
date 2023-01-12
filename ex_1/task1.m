
t1 = [-10:0.01:10];
t2 = [0:0.01:10];
k = [-2:1:10];

f1 = 2*t1>=0;

f2 = 4*exp(-2*t2).*cos(pi*t2);

g2 = ((heaviside(t1+1))-(heaviside(t1-1)));
g6 = ((heaviside(t1+3))-(heaviside(t1-3)));

f3 = g2+g6;

f4 = (heaviside(k+3)) - (heaviside(k-2));

f5 = 5*(0.4).^k.*cos(1.2*pi*k);

f6 = 2*sin(t1./2)./t1;

subplot(2,3,1)
plot(t1,f1);
title('f_1 = \epsilon(2*t)')
grid on;

subplot(2,3,2)
plot(t2,f2);
title('f_2 = 4*e^{-2t}*cos(pi*t)')
grid on;

subplot(2,3,3)
plot(t1,f3);
title('f_3 = g_2(t) + g_6(t)')
grid on;

subplot(2,3,4)
plot(k,f4,'x');
title('f_4 = \epsilon(k+3) - \epsilon(k-2)')
grid on;

subplot(2,3,5)
plot(k,f5,'x');
title('f_5 = 5*(0.4)^k*cos(1.2*pi*k)')
grid on;

subplot(2,3,6)
plot(t1,f6);
title('f_6 = 2*sin(t/2)/t')
grid on;
