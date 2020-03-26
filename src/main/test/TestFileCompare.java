import com.violetks.complierun.JavaCompileRun;

/**
 * 测试比较两个文件
 */
public class TestFileCompare {
    public TestFileCompare() {
    }

    public static void main(String[] args) {
        String sourceCode = "hello thank you";
        JavaCompileRun jcr = new JavaCompileRun(sourceCode);
        System.out.println(jcr.fileCompare("D:/qq/compileRun/answer/1/input101.txt",
                "D:/qq/compileRun/answer/1/answer101.txt"));
    }
}
