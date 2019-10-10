package labwork02;

import java.util.Scanner;

public class Lab02_dreft01 {

     /*
    Лабораторная работа #2. Задание 3.2 (стр.32). Вариант 30
    Составное число называется числом Смита, если сумма его цифр равна сумме цифр всех чисел,
	образующихся разложением исходного числа на простые множители.
	Число Смита называется супер-числом Смита, если сумма его цифр является числом смита.
	Найти супер-число Смита с номером N, являющееся полным квадратом.
	(Число называется полным квадратом, если корень квадратный из него является простым числом)

    */

    static boolean checkPrime(long n) {
        boolean isPrime = true;
        for(int i = 2; i <= Math.sqrt(n); i++)
            if(n % i == 0) {
                isPrime = false;
                break;
            }
        return isPrime;
    }

    static long calcDigitSum(long n) {
        long sum = 0;
        while(n != 0) {
            sum = sum+n % 10;
            n = n / 10;
        }
        return sum;
    }
    static long calcDevidersSum(long n) {
        long decidersSum = 0;

        while(n > 1) {
            for(int i = 2; i <= n; i++) {
                if(n % i == 0) {
                    decidersSum += i;
                    n /= i;
                    break;
                }
            }
        }
        return decidersSum;
    }
    static boolean checkSmith(long n) {
        if(checkPrime(n))
            return false;
        long sum = calcDigitSum(n);

        long devidersSum = calcDevidersSum(n);

        if(sum == devidersSum) {
            return true;
        }
        return false;
    }

    static boolean checkSuperSmith(long n) {
        long sum = calcDigitSum(n);

        long dividersSum =calcDevidersSum(n);
        if(sum == dividersSum) {
            return checkSmith(sum);
        }
        return false;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter a number");
        int count = sc.nextInt();
        int current = 2;
        while(true) {
            if(checkPrime(current)) {
                current++;
                continue;
            }
            if(checkSuperSmith(current) && checkPrime((long) Math.sqrt(current)))
                count--;
            if(count == 0) {
                System.out.println("Число супер Смита с номером N:" + current);
                break;
            }
            current++;
        }
    }
}
