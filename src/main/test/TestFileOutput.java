import com.violetks.fileUtil.FileOutput;

/**
 * 测试读取文件内容
 */
public class TestFileOutput {
    public TestFileOutput() {
    }

    public static void main(String[] args) {
        FileOutput fo = new FileOutput();
        System.out.println(fo.readFile("1", "input", 1));
        System.out.println(fo.readFile("1", "input", 2));
        System.out.println(fo.readFile("1", "answer", 1));
        System.out.println(fo.readFile("1", "answer", 2));
    }
}
