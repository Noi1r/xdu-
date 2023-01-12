clear
clc
I1=imread('liudehua.jpg');%图片1
g1=rgb2gray(I1);
g1 = imresize(g1,[2698 1927]);
s=fftshift(fft2(g1));
[M,N]=size(s);
n1=fix(M/2);
n2=fix(N/2);

%理想低通滤波器取d0=10  （15,30）可变
d0=30;
for i=1:M
    for j=1:N
        d=sqrt((i-n1)^2+(j-n2)^2);
        if d<d0
            h=1;
        else
            h=0;
        end
        s(i,j)=h*s(i,j);
    end
end
s=ifftshift(s);
s=uint8(real(ifft2(s)));

%figure(1);
%imshow(s);


%图片2处理
I2=imread('images.jpg');%图片
g3=rgb2gray(I2);
g3 = imresize(g3,[2698 1927]);
s2=fftshift(fft2(g3));
[M2,N2]=size(s2);
n12=fix(M2/2);
n22=fix(N2/2);

%理想高通滤波器取 （15,30）可变
d02=5;
for i=1:M2
    for j=1:N2
        d=sqrt((i-n12)^2+(j-n22)^2);
        if d<d02
            h=0;
        else
            h=1;
        end
        s2(i,j)=h*s2(i,j);
    end
end
s2=ifftshift(s2);
s2=uint8(real(ifft2(s2)));
%figure(2);
%imshow(s2);

%图片合并
s3=imadd(s,s2);
figure(3);
imshow(s3);
imwrite(s3,'max.jpg','JPG')

%图片分解

g3 = imresize(s3,[2698 1927]);
s4=fftshift(fft2(g3));
[M4,N4]=size(s4);
n14=fix(M4/2);
n24=fix(N4/2);
%分离图片
d02=5;
for i=1:M2
    for j=1:N2
        d=sqrt((i-n14)^2+(j-n24)^2);
        if d>d02
            h=0;
        else
            h=1;
        end
        s4(i,j)=h*s4(i,j);
    end
end
s4=ifftshift(s4);
s4=uint8(real(ifft2(s4)));
figure(4)
imshow(s4)
figure(5)
imshow(s3-s4)
