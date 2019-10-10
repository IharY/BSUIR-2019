{ http://forum.pascalnet.ru/index.php?showtopic=26656&pid=149300&mode=threaded&show=&st=&#entry149300 }
{ https://www.programmersforum.ru/showthread.php?t=119869 }

Var
  Found,SFound  : boolean; {Флаг для цикла}
  simple        : boolean; {Флаг, используемый при проверке на пр. число}
  square        : double; {Переменная,в котором хранится число из кв. корня}
  number,numb   : longint; {Число,с которого начинаем поиск...}
  N             : longint; {Наше супер-число Смита}
  i,j,k         : longint; {Счетчики для циклов}
  Smith, SSmith : longint; {Искомое супер-число Смита}
  SumNumb       : longint; {Сумма цифр числа}
  SumSubs       : longint; {Сумма множителей}
  amount        : longint; {Кол-во простых множителей}
  numSum,numSub : longint; {Переменные для поиска сумм}
  factor,pr     : longint; {Начальный делитель числа}
  s,sfact,sum   : longint; {Результат вычислений}

Begin
  {ВВОД ЧИСЛА N}
  write('Enter your number N: ');
  readln(N);
  {Поиск супер-числа Смита}
  i:=0;
  number:=1;
  while i<>N do
  begin
    repeat
      SFound:=false;
      {Поиск числа Смита}  
      repeat 
        inc(number);
        Found:=false;
        SumNumb:=0;
        SumSubs:=0;
        numSum:=number;
        numSub:=number;
        {Подсчет суммы цифр числа} 
        s:=0;
        while numSum<>0 do
        begin
          inc(s,numSum mod 10);
          numSum:=numSum div 10;
        end;
        SumNumb:=s;
        {Подсчет суммы множителей числа}
        s:=0;
        factor:=2;
        amount:=0;
        repeat
          if (numSub mod factor)=0 then
            begin
              {Подсчитываем сумму цифр числа (множителя)}
              sfact:=0;
              numb:=factor;
              while numb<>0 do
              begin
                inc(sfact,numb mod 10);
                numb:=numb div 10;
              end;
              sum:=sfact;
            {Подсчитываем сумму множителей}
              s:=s+sum;
              inc(amount);
              numSub:=numSub div factor
            end
            else inc(factor);
        until numSub=1;
        SumSubs:=s;
        {Найденное число - это число Смита?}
        {Проверяем, чтобы сумма его цифр была равна сумме простых множителей}
        if ((SumNumb=SumSubs) and (amount>1)) then Found:=true;
      until Found=true;
      {Поиск супер-чисел Смита, удолетворяющих условиям}
      {Подсчет суммы цифр cупер-числа Смита}
       s:=0;
       numSum:=0;
       numSum:=number;
       while numSum<>0 do
       begin
         inc(s,numSum mod 10);
         numSum:=numSum div 10;
       end;
       SSmith:=s;
       {Проверка на супер-число Смита}
        SumNumb:=0;
        SumSubs:=0;
        numSum:=SSmith;
        numSub:=SSmith;
        {Подсчет суммы цифр числа} 
        s:=0;
        while numSum<>0 do
        begin
          inc(s,numSum mod 10);
          numSum:=numSum div 10;
        end;
        SumNumb:=s;
        {Подсчет суммы множителей числа}
        s:=0;
        factor:=2;
        amount:=0;
        repeat
          if (numSub mod factor)=0 then
            begin
              {Подсчитываем сумму цифр числа (множителя)}
              sfact:=0;
              numb:=factor;
              while numb<>0 do
              begin
                inc(sfact,numb mod 10);
                numb:=numb div 10;
              end;
              sum:=sfact;
            {Подсчитываем сумму множителей}
              s:=s+sum;
              inc(amount);
              numSub:=numSub div factor
            end
            else inc(factor);
        until numSub=1;
        SumSubs:=s; 
      {Теперь еще проверим,чтобы это из корня кв. было простым числом}
       simple:=true;
       if Sqr(Trunc(Sqrt(number))) <> number then simple:=false;
      {Найденное число - это супер-число Смита?}
      {Проверяем, чтобы сумма его цифр являлась числом Смита}
      if ((SumNumb=SumSubs) and (amount>1) and (simple=true)) then SFound:=true;
    until SFound=true;
    inc(i); 
  end;
  Smith:=number;
  {ВЫВОД СУПЕР-ЧИСЛА СМИТА}
  writeln('Ваше супер-число Смита: ',Smith);
  readln;
End.