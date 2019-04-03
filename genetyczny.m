%algorytm genetyczny
%
clc
clear all
close all
%PARAMETRY PROGRAMU
% n - liczba przedmiotow w plecaku
n=10;
%rozmiar populacji
I=10;
%prawdopodobienstwo krzyzowania - <0.5,1.0>
pr_k=0.5;
%prawdopodobienstwo mutacji - <0,0.1>
pr_m=0.1;
%ilosc generacji - liczba iteracji
K=100;
%maksymalna objetosc plecaka
Cmax=200;
%Best = 0;
naj=0;
%najlepszy poprzedni
naj_p=0;
%najlepszy z wszystkich generacji
naj_naj=0;
str=0;
sr=0;
%
%
%g=linspace(1,1,I);
 hold on
 %plot(g,0,'g-');

% 1. Wybor populacji poczatkowej
%losowanie populacji
populacja=losowanie_plecaka(n);
%wektor przystosowania - wartosci i objetosci
[v , c]=wektor_p(n);
for k=1:K
% 2. Ocena przystosowania osobnikow
wart_f=zeros(I,1);
for i=1:I
   waga= sum(populacja(i,:).*c);  %wagi sumujemy aby sprawdzic czy nie wykracza poza dozwolona objentosc
    if(waga<=Cmax)
        wart_f(i,1) = waga;  %kiedy nie liczymy przystosowanie
        if(wart_f(i,1)>naj)
           naj_p=naj;
           naj=wart_f(i,1);        %najlepszy prametr przystosowania sie
           naj_ch=populacja(i,:);  %wybieranie chromosomu najlepszego typa
        end
    else
        naj_p=naj;
        wart_f(i,1)= 0;   %jak wykracza to przystosowanie -=== zero
    end
end
% 3.Wyprowadzenie najlepszego osobnika
%srednia populacji
str=sr;
sr=sum(wart_f);
sr=sr/I;
%najlepszy w historii
if(naj>naj_naj)
    naj_naj=naj;
    naj_naj_ch=naj_ch;
end
%rysowanie
line([k k-1],[naj naj_p], 'Marker', '.', 'Color', 'r')
line([k k-1],[sr str], 'Marker', '.', 'Color', 'b')
legend('wart. najlepiej przystosowanego osobnika','œrednia wart. przystosowania pop.');
% 4. Sprawdzenie warunkow zatrzymania
% 5. Selekcja chromosomow
%populacja=selekcja_ruletkowa(populacja,wart_f);
%populacja=selekcja_rankingowa(populacja,wart_f);
populacja=selekcja_turniejowa(populacja,wart_f);
% 6. Zastosowanie operatorow genetycznych
%krzyzowanie jednopunktowe
populacja=krzyzowanie_jp(populacja,pr_k);
%krzyzowanie dwupunktowe
populacja=krzyzowanie_dp(populacja,pr_k);
%mutacja
populacja=mutacja(populacja,pr_m);
% 7. Utworzenie nowej populacji
end
nalepszy_wart=naj
najlepszy=naj_ch
najlepszy_z_generacji_wart=naj_naj
najlepszy_z_generacji=naj_naj_ch