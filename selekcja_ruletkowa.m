function [populacja_nowa] = selekcja_ruletkowa(populacja,w_funkcji)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
[w,k]=size(populacja);
 populacja_nowa=[];
    p=zeros(1,w);
    %jaka czesc kola zajmie
    for i=1:w
        p(i)=w_funkcji(i)/sum(w_funkcji);
    end
    kolo=[];
    for i=1:w
        punkt=rand();
        for i=1:w
            kolo=[kolo sum(p(1:i))];
            if punkt<kolo(i)
                populacja_nowa=[populacja_nowa; populacja(i,:)];
                kolo=[];
                break;
            end
        end
    end
    populacja_nowa;
end

