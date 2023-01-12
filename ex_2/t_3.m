
noise=wgn(1,1000,0);%生成1000*1个高斯白噪声，功率为0dbW
subplot(2,1,1)
plot(noise)
h=xcorr(noise,"coeff");
subplot(2,1,2)
plot(h)