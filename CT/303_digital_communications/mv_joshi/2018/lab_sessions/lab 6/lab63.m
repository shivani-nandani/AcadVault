clc;
close all;
clear all;
t=1:1:57140;
c=5;
part=-1:2/32:1;
codebook=-1:2/32:1+2/32;
[msg,f]=wavread('a.wav');
[~,qnt]=quantiz(msg,part,codebook);
subplot(4,1,1);
plot(t,msg);
title('Message Signal');
subplot(4,1,2);
plot(t,qnt);
title('Quantized Signal');
y=uencode(qnt,c);
ybin=dec2bin(y,c);
subplot(4,1,3);
plot(t,y);
title('PCM Plot');
yy=udecode(y,c);
subplot(4,1,4);
plot(t,yy);
title('Reconstructed Signal');
sound(msg,f);

sound(yy,f);