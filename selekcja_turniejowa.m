function [populacja_nowa] = selekcja_turniejowa(populacja,wart_f)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
[w,k]=size(populacja);
%rozmiar grupy turniejowej
%n=round(w/10);
n=3;
%populacja;
%losowanie
ma_w=0;
ma=populacja(1,:);
for i=1:w
    for j=1:n
        ktore=round((w-1)*rand()+1);
        tmp_w=wart_f(ktore);
        tmp=populacja(ktore,:);
        if(tmp_w>ma_w)
            ma_w=tmp_w;
            ma=tmp;
        end
    end
    populacja_nowa(i,:)=ma;
end
end

