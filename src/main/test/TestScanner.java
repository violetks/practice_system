import java.util.Scanner;

public class TestScanner {
    public static int doFactorial(int n) {
        int result = 1;
        if (n < 0) {
            return -1;//返回-1，说明传入数据不合法
        }
        if (n == 0) {
            return 1;
        }
        for (int i = 1; i <= n; i++) {
            result *= i;
        }
        return result;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int res = doFactorial(sc.nextInt());
        System.out.print(res);
    }
}
