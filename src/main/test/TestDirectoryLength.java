import java.io.File;

public class TestDirectoryLength {
    public TestDirectoryLength() {
    }

    public static void main(String[] args) {
        File f1 = new File("d://TestScanner/test1");
        File[] files1 = f1.listFiles();
        System.out.println(files1.length);
        File f2 = new File("d://TestScanner/test2");
        File[] files2 = f2.listFiles();
        System.out.println(files2.length);
    }
}
