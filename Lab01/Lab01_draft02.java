package labwork01;

public class Lab01_draft02 {
       /*
    Лабораторная работа #1. Задание 3.1.1 (стр.16). Вариант 30
    Для заданного преподавателем пункта приведенной ниже таблицы вычислить значение функции f(x,n)
    для n= 10; 11; ...15 и значения X, изменяющегося от x=0.6 до x=1.1 c шагом 0.25. Результат вывести на печать в виде:
    n = Значение x=Значение f=Значение

    */

    public static void main(String[] args) {

        for(double n = 10; n < 16; n++) {
            for(double x = 0.6; x <= 1.1; x += 0.25) {
                double sum = 0.0;
                //цикл подсчитывает выражение под знаком суммы
                for(double k = 1; k <= n; k++) {
                    sum += Math.sqrt(Math.pow(Math.pow(x,(k + 1)), 1.0 / k ))+ Math.pow( Math.exp(k - 2/3), 1.0 / k)/ (1 + Math.log(x));
                }
                double f = Math.cos(Math.PI*x/ n) * sum;
                printResult(n ,x, f);
            }
        }
    }
    //вывод на печать реализуем отдельной фукцией
    private static void printResult(double n, double x, double f) {
        String xString = Double.toString(x);
        if(xString.length() == 3)
            xString += "0";
        System.out.println("n = " + (int) n + "\t" + "x = " + xString + "   " + "f = " + f);
    }
}
