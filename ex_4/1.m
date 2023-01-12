clear;clc
[x,fs]=audioread("C:\Users\Noir\Desktop\test.wav");%并返回样本数据 y 以及该数据的采样率 fs
% sound(x,fs);%播放语言信号
% n=length(y);%信号长度
% t=(0:n-1)/fs;%时域范围
figure(1)
subplot(211);
plot(x)
xlabel('采样点');
ylabel('幅度');
title('初始信号48kHz波形');   %绘出时域波
grid on
y1=fft(x);       %快速傅里叶变换  做length(y)个点的
w1=fftshift(y1); %频率分量移到坐标中心
subplot(212)         %绘出频域频谱
plot(abs(w1))
title('初始信号48kHz频谱');
xlabel('频率');
ylabel('幅度');
grid on
% df=fs/length(pyr1);%计算谱线间隔
% f=0:df:(fs/2-df); %频谱范围，截取前半段（抽样频率高于最大频率的2倍）
% PyrF=abs(pyr1);%幅度响应
% PyrF=PyrF(1:length(PyrF)/2);
% plot(f,PyrF);


figure(2)
y2=resample(y1,1,2);%24kHz频域下的重采样
x2=real(ifft(y2)); %傅里叶反变化求出，并取实部，最大幅度保存信息
%sound(x2,fs/2);
subplot(211);
plot(x2)
xlabel('采样点');
ylabel('幅度');
title('24kHz信号波形');   %绘出时域波
grid on
subplot(212)         %绘出频域频谱
plot(abs(fftshift(y2)))
title('24kHz信号频谱');
xlabel('频率');
ylabel('幅度');
grid on

figure(3)
y3=resample(y1,1,4);%12kHz频域下的重采样
x3=real(ifft(y3)); %傅里叶反变化求出,并取实部，最大幅度保存信息
%sound(x3,fs/4);
subplot(211);
plot(x3)
xlabel('采样点');
ylabel('幅度');
title('12kHz信号波形');   %绘出时域波
grid on
subplot(212)         %绘出频域频谱
plot(abs(fftshift(y3)))
title('12kHz信号频谱');
xlabel('频率');
ylabel('幅度');
grid on
figure(4)
y4=resample(y1,1,8);%6kHz频域下的重采样
x4=real(ifft(y4)); %傅里叶反变化求出,并取实部，最大幅度保存信息
%sound(x4,fs/8);
subplot(211);
plot(x4)
xlabel('采样点');
ylabel('幅度');
title('6kHz信号波形');   %绘出时域波
grid on
subplot(212)         %绘出频域频谱
plot(abs(fftshift(y4)))
title('6kHz信号频谱');
xlabel('频率');
ylabel('幅度');
grid on

figure(5)
y5=resample(y1,1,16);%6kHz频域下的重采样
x5=real(ifft(y5)); %傅里叶反变化求出,并取实部，最大幅度保存信息
%sound(x5,fs/16);
subplot(211);
plot(x5)
xlabel('采样点');
ylabel('幅度');
title('3kHz信号波形');   %绘出时域波
grid on
subplot(212)         %绘出频域频谱
plot(abs(fftshift(y5)))
title('3kHz信号频谱');
xlabel('频率');
ylabel('幅度');
grid on

%%信号重构后的误差
figure(6)
subplot(2,1,1)
plot(t,x);
hold on
plot(t1,x2_1);
i = 1;
j = 1;
error = zeros(length(x2_1),1);
error = error(1,:);
%计算误差
while i <= length(x2_1)
    if abs(t1(1,i)-t(1,j))<0.0001
        e = abs(x2_1(i,1)-x1(j,1)); 
        error(1,i) = e';
        i=i+1
    end
     j=j+1;
end
error = abs(error(1,:));
subplot(2,1,2)
t3 = linspace(0,T,length(error));
plot(t3,error);
