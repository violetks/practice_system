import com.violetks.complierun.JavaCompileRun;

/**
 * 测试编译运行
 */

public class TestFileCompileRun {
    public TestFileCompileRun(){

    }
    public static void main(String[] args) {
        StringBuilder src = new StringBuilder();
        src.append("import java.util.Scanner;");
        src.append("public class Main{");
        src.append("int sum=0;");
        src.append("public int getSum(int m){");
        src.append("for (int i=0;i<=m;i++) {");
        src.append("sum=sum+i;");
        src.append("}");
        src.append("return sum;");
        src.append("}");
        src.append("public static void main(String[] args) {");
        src.append("Main t=new Main();");
        src.append("Scanner sc=new Scanner(System.in);\n int m=sc.nextInt();");
        src.append("System.out.println(t.getSum(m));");
        src.append("}}\n");
        JavaCompileRun jCR = new JavaCompileRun(new String(src));
        jCR.codeCompile(new String(src), 1, 111);
        if (!jCR.isCompileResult()) {
            System.out.println("编译错误");
        } else if (!jCR.isRunResult()) {
            System.out.println("运行错误");
        } else {
            int score = 0;

            for(int j = 1; j < 6; ++j) {
                String file1 = "d://test/output10" + j + ".txt";
                String file2 = "d://test/answer0" + j + ".txt";
                if (jCR.fileCompare(file1, file2)) {
                    score += 20;
                    jCR.setScore(score);
                }
            }
        }

        System.out.println(jCR.getScore());
        System.out.println(jCR.getRuntime());
    }
}
