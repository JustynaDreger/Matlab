%obliczanie mutacji dla danej populacji
function [populacja_nowa] = mutacja(populacja,pr)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
%prawdopodobienstwo mutacji - <0 , 0.1>
pr;
%ile_zmutowanych=0;
[w,k]=size(populacja);
%ile_wszytskich=w;
populacja_nowa=populacja;
for i=1:w
    for j=1:k
        p=rand(1,1);
        if(p<=pr)
            populacja_nowa(i,j)=~populacja(i,j);
           % ile_zmutowanych=ile_zmutowanych+1;
        end
    end
end
populacja_nowa;
end

