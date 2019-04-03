function [populacja_nowa] = krzyzowanie_jp(populacja,pr)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
[w,k]=size(populacja);
populacja_nowa=populacja;
for i=1:w-1
    p=rand();
    if(p>=pr)
    %losowanie punktu krzyzowania
    pkt=round((k-1)*rand(1)+1);
    populacja_nowa(i,:)=[populacja(i,1:pkt) populacja(i+1,pkt+1:k)];
    populacja_nowa(i+1,:)=[populacja(i+1,1:pkt) populacja(i,pkt+1:k)];
    end
end
end

