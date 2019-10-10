Program Chislo_smita;

{рабочая программа}
{просит ввести число и выдает число Смита по порядковому номеру которое введено}
{Числа Смита
4, 22, 27, 58, 85, 94, 121, 166, 202, 265, 
274, 319, 346, 355, 378, 382, 391, 438, 454, 483, 
517, 526, 535, 562, 576, 588, 627, 634, 636, 645, 
648, 654, 663, 666, 690, 706, 728, 729, 762, 778, 
825, 852, 861, 895, 913, 915, 922, 958, 985, 1086, 
1111, 1165,..}
 
function summa(a:integer):integer;
var s1:integer;
begin
     s1:=0;
     while a<>0 do
     begin
          s1:=s1+(a mod 10);
          a:=a div 10
     end;
summa:=s1;
end;
 
function summadelitel(b:integer):integer;
         var x,y,s:integer;
         begin
              x:=b;
              y:=2;
              s:=0;
              if b<2 then
              summadelitel:=0
              else
              begin
                   while x<>1 do
                   begin
                        if x mod y = 0 then
                        begin
                             x:=x div y;
                             s:=s+summa(y);
                        end
                        else inc(y);
                   end;
                       if y=b then s:=s-summa(y);
 
              summadelitel:=s;
              end;
         end;
         
var k, i, n: integer;
begin
k:=0; i:=0;
writeln ('Введите номер числа Смита');
read (n);
while k<>n do
      begin
      i:=i+1;
      if summa(i)=summadelitel(i) then
          k:=k+1;
      end;
writeln(i);
end.