syms t w;   %声明变量
f_1 = 1/2 * exp(-2*abs(t)) * heaviside(t) %f1
f_2 = 1/2 * exp(-2*abs(t-1)) * heaviside(t-1) %f2

f_1_w = fourier(f_1) %f1傅里叶变换
f_2_w = fourier(f_2) %f2傅里叶变换

margin1 = abs(f_1_w) %f1幅度谱
% margin1 = 1/(2*abs(2 + w*1i))
margin2 = abs(f_2_w) %f2幅度谱
% margin2 = exp(imag(w))/(2*abs(2 + w*1i))

angle1 = angle(f_1_w) %f1相位谱
%angle1 = angle(1/(2 + w*1i))
angle2 = angle(f_2_w) %f2相位谱
%angle2 = angle(exp(-w*1i)/(2 + w*1i))

%作图
subplot(2,2,1)
fplot(margin1)
title("f_1(t)的幅度谱");

subplot(2,2,2)
fplot(margin2)
title("f_2(t)的幅度谱");

subplot(2,2,3)
fplot(angle1)
title("f_1(t)的相位谱");

subplot(2,2,4)
fplot(angle2)
title("f_2(t)的相位谱");