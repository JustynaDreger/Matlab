function [populacja] = losowanie_plecaka(n)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%losowanie problemu plecakowego
%
%n - liczba przedmiotow
%

%ile osobnikow w populacji
os=10;
%tworzenie populacji
populacja=zeros(os,n);
for i=1:os
%ile - ile przedmiotow w plecaku - n/5
ile=round((n/5-1)*rand(1,1)+1);
%ktore - ktore przedmioty beda w plecaku 1-10
ktore=floor((n-1)*rand(1,ile)+1);
for j=1:ile
    populacja(i,ktore)=1;
end
end
populacja=populacja;
end

