function [populacja_nowa] = krzyzowanie_dp(populacja,pr)
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
[w,k]=size(populacja);
populacja_nowa=populacja;
for i=1:w-1
    p=rand();
    if(p>=pr)
    %losowanie punktu krzyzowania
    pkt1=round((k-2)*rand(1)+2);
    pkt2=round((k-2)*rand(1)+2);
    if(pkt1==pkt2)
        pkt1=pkt1-1;
    end
    if(pkt1<pkt2)
        populacja_nowa(i,pkt1:1:pkt2)=populacja(i+1,pkt1:1:pkt2);
        populacja_nowa(i+1,pkt1:1:pkt2)=populacja(i,pkt1:1:pkt2);
    end
    if(pkt1>pkt2)
        populacja_nowa(i,pkt2:1:pkt1)=populacja(i+1,pkt2:1:pkt1);
        populacja_nowa(i+1,pkt2:1:pkt1)=populacja(i,pkt2:1:pkt1);
    end
    end
end
end

