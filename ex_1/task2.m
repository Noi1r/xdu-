t1 = [-10:0.01:10];
t2 = 0.5*t1;
t3 = 2-2*t1;
g2 = ((heaviside(t1+1))-(heaviside(t1-1)));
g6 = ((heaviside(t1+3))-(heaviside(t1-3)));

f3_1 = g2+g6;

g2_2 =  ((heaviside(t2+1))-(heaviside(t2-1)));
g6_2 =  ((heaviside(t2+3))-(heaviside(t2-3)));


g2_3 =  ((heaviside(t3+1))-(heaviside(t3-1)));
g6_3 =  ((heaviside(t3+3))-(heaviside(t3-3)));

f3_2 = g2_2 + g6_2;
f3_3 = g2_3 + g6_3;

subplot(2,2,1);
plot(t1,f3_1);
title('f_3(t)')
grid on;

subplot(2,2,2);
plot(t1,f3_2);
title('f_3(0.5*t)')
grid on;

subplot(2,2,3);
plot(t1,f3_3);
title('f_3(2-2*t)')
grid on;

subplot(2,2,4);
f3_4 = diff(f3_3);
plot(t1(:,[1:2000]),f3_4);
title("f_3'(2-2*t)")
grid on;
