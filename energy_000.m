clc
clear all
tic
%AN ADAPTIVE ENERGY EFFICIENT TRANSMISSION SCHEME USING MOBILE SINK FOR WIRELESS SENSOR NETWORKS.
%Let suppose we have 100 nodes wireless sensor network(100*100)m.
%CALCULATING ETA
ETA=(250000/83500000);
%CALCULATING RECEIVER  SNR
SNR=ETA*6.7608;
%We  have randomly selected the temperature  in range from [-10(C)- 53(C)].
T=zeros(100,1);
Nnodes=100;
T=ceil(-10+63.*rand(Nnodes,1));
%Then to estimate RSSI-loss(dBm) for given temperature.
for j=1:1:100
    Rssi(j,1)=0.1996*((T(j,1))-25);
end
% To estimate required transmitter power level for given RSSI.
for k=1:1:100
    Plevel(k,1)=power(((Rssi(k,1)+40)/12),2.91);
end
%Division of network into three regions on basis of RSSI-loss.
%Finding minimum value in array.
RssiL=min(Rssi);
%Finding maximum value in array.
RssiH=max(Rssi);
%Finding average value in array.
RssiA=(RssiL+RssiH)/2;
%Finding the number of nodes in A region(RssiH).
RssiLimitH=RssiA+2;
countH=0;
A=zeros(100,1);
for l=1:1:100
    if (Rssi(l,1)<=RssiH)
        if (Rssi(l,1)>RssiLimitH)
            countH=countH+1;
            A(l,1)=Rssi(l,1);
        end
    end
end
%Finding the number of nodes in B region(RssiM).
RssiLimitMH=RssiA+2;
RssiLimitML=RssiA-2;
countM=0;
B=zeros(100,1);
for m=1:1:100
    if (Rssi(m,1)<=RssiLimitMH)
        if (Rssi(m,1)>RssiLimitML)
            countM=countM+1;
            B(m,1)=Rssi(m,1);
        end
    end
end
%Finding the number of nodes in C region(RssiL).
RssiLimitLH=RssiA-2;
countL=0;
C=zeros(100,1);
for n=1:1:100
    if (Rssi(n,1)<=RssiLimitLH)
        if (Rssi(n,1)>=RssiL)
            countL=countL+1;
            C(n,1)=Rssi(n,1);
        end
    end
end
% Estimating RSSI and Plevel for each node in region A.
count1=1;
for o=1:1:length(A)
    if (A(o,1)~=0)
        RssiAAA(count1,1)=A(o,1);
        PlevelAAA(count1,1)=power(((A(o,1)+40)/12),2.91);
        count1=count1+1;
    end
end
% Estimating RSSI and Plevel for each node in region B.
count2=1;
for p=1:1:length(B)
    if (B(p,1)~=0)
        RssiBBB(count2,1)=B(p,1);
        PlevelBBB(count2,1)=power(((B(p,1)+40)/12),2.91);
        count2=count2+1;
    end
end
% Estimating RSSI and Plevel for each node in region C.
count3=1;
for q=1:1:length(C)
    if (C(q,1)~=0)
        RssiCCC(count3,1)=C(q,1);
        PlevelCCC(count3,1)=power(((C(q,1)+40)/12),2.91);
        count3=count3+1;
    end
end
%Plotting mean RSSI (Threshold) for each region.
RssiAAAmean=mean(RssiAAA(1:count1-1));
RssiBBBmean=mean(RssiBBB(1:count2-1));
RssiCCCmean=mean(RssiCCC(1:count3-1));
%Now we will estimate corresponding power level.
PlevelA=power(((RssiAAAmean+40)/12),2.91);
PlevelB=power(((RssiBBBmean+40)/12),2.91);
PlevelC=power(((RssiCCCmean+40)/12),2.91);
%Defining Rounds.
for rmax=1:1:100
    xm=100;
    ym=100;
    n=100;
    c=n/10;
    for i=1:1:n
        S(i).xd=xm*rand(1,1);
        S(i).yd=ym*rand(1,1);
    end
    for b=1:1:n
        if(b<c)
            S(n+1).xd=50;
            S(n+1).yd=50;
            for i=1:1:n
                dis(i)=sqrt((S(i).xd-S(n+1).xd)^(2)+(S(i).yd-S(n+1).yd)^(2));
            end
        end
        if(b>c && b<(2*c))
            S1(n+1).xd=0;
            S1(n+1).yd=0;
            for i=1:1:n
                dis1(i)=sqrt((S(i).xd-S1(n+1).xd)^(2)+(S(i).yd-S1(n+1).yd)^(2));
            end
        end
        if(b>(2*c) && b<(3*c))
            S2(n+1).xd=0;
            S2(n+1).yd=100;
            for i=1:1:n
                dis2(i)=sqrt((S(i).xd-S2(n+1).xd)^(2)+(S(i).yd-S2(n+1).yd)^(2));
            end
        end
        if(b>(3*c) && b<(4*c))
            S3(n+1).xd=100;
            S3(n+1).yd=100;
            for i=1:1:n
                dis3(i)=sqrt((S(i).xd-S3(n+1).xd)^(2)+(S(i).yd-S3(n+1).yd)^(2));
            end
        end
        if(b>(4*c) && b<(5*c))
            S4(n+1).xd=100;
            S4(n+1).yd=0;
            for i=1:1:n
                dis4(i)=sqrt((S(i).xd-S4(n+1).xd)^(2)+(S(i).yd-S4(n+1).yd)^(2));
            end
        end
    end
    % To estimate required transmitter power  for given RSSI.
    for r=1:1:100
        Pt(r,1)=(power(((Rssi(r,1)+40)/12),2.91))+((10*log((SNR)*(3.16)*(1.38*(10^(-23)))*(300)*(83500000)*(power(102.61*dis(r),2))))+5+30);
    end

    % To estimate required transmitter power  for given RSSI.
    for r=1:1:100
        Pt1(r,1)=(power(((Rssi(r,1)+40)/12),2.91))+((10*log((SNR)*(3.16)*(1.38*(10^(-23)))*(300)*(83500000)*(power(102.61*dis1(r),2))))+5+30);
    end

    % To estimate required transmitter power  for given RSSI.
    for r=1:1:100
        Pt2(r,1)=(power(((Rssi(r,1)+40)/12),2.91))+((10*log((SNR)*(3.16)*(1.38*(10^(-23)))*(300)*(83500000)*(power(102.61*dis2(r),2))))+5+30);
    end

    % To estimate required transmitter power  for given RSSI.
    for r=1:1:100
        Pt3(r,1)=(power(((Rssi(r,1)+40)/12),2.91))+((10*log((SNR)*(3.16)*(1.38*(10^(-23)))*(300)*(83500000)*(power(102.61*dis3(r),2))))+5+30);
    end

    % To estimate required transmitter power  for given RSSI.
    for r=1:1:100
        Pt4(r,1)=(power(((Rssi(r,1)+40)/12),2.91))+((10*log((SNR)*(3.16)*(1.38*(10^(-23)))*(300)*(83500000)*(power(102.61*