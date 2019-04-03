function [populacja_nowa] = selekcja_rankingowa(populacja,wart_f)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
[w,k]=size(populacja);
%populacja_nowa=zeros(w,k)4
populacja;
wart_f;
pop=[wart_f populacja];
pop=sortrows(pop,1);
pop=flipud(pop);
%funkcja do wyliczania kopii
f=@(x)(10./x);
rangi=1:1:w;
r=round(f(rangi));
i=1;
populacja_nowa=zeros(w,k);
%populacja_nowa=populacja;
pop1=pop(:,2:k+1);
while(i<w)
    if(r(i)>w)
        r(i)=w;
    end
    ki=i;
    for j=1:r(i)
        populacja_nowa(ki,:)=pop1(i,:);
        ki=ki+1;
    end
    i=i+1;
end
populacja_nowa;
end