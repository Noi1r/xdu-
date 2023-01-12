clear;clc;

syms t w;           %声明两个变量
f = exp(-2*abs(t));  %f(t)=e^(-2|t|)
F = (w.^2+1)^(-1);       %F(w)=1/(1+w^2)

fw = fourier(f)    %求傅里叶变换
Ft = ifourier(F)   %求傅里叶逆变换

%fw = 4/(w^2 + 4)
%Ft = exp(-abs(x))/2

subplot(2,2,1)
fplot(f,[-5 5])
title('f(t)=e^{-2*|t|}')    

subplot(2,2,2)
fplot(fw,[-5 5])
title('f(w)=4/(w^{2}+4)')

subplot(2,2,3)
fplot(F,[-5 5])
title('F(w)=1/(w^{2}+1)')

subplot(2,2,4)
fplot(Ft,[-5 5])
title('F(t)=e^{-|t|}/2')
