﻿Program Summa_tsifr; {выводит на экран сумма цифр числа, например 202 -> 2+0+2=4}
 
var s1:integer;
var a:integer;
begin
     s1:=0; 
 writeln ('Введите число');
     read (a);
     
     while a<>0 do
     begin
          s1:=s1+(a mod 10); {выдает остаток от деления на 10 т.е. число после запятой)}
          writeln('s1=',s1); {отслеживаем промежуточный результат}
          a:=a div 10; {выдает целое число после делиения на 10 }
          writeln('a=', a);   {отслеживаем промежуточный результат}
     end;
     
writeln('Результат ', s1);

end.
