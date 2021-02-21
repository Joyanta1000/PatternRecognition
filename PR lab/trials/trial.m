clc();
clear all;
close all;
x=rand(1,1000);
N=length(x); %// length of signal
n1=128;  %// length of window
xf=framing(x,n1,n1/2,rectwin(n1)); %this function frames the signal i will get xf(128,14)
win_num=size(xf,2);
% M0=???

ccor=NaN(M0+1,win_num);
for col=1:win_num
    for m=1:M0+1,
        [term1,term2,term3]=deal(0);
        for n=1:N-m,
            term1=term1+xf(n,col)*xf(n+m,col);
            term2=term2+xf(n,col)^2;
            term3=term3+xf(n+m,col)^2;
        end
        ccor(m,col)=term1/sqrt(term2*term3);        
    end
end