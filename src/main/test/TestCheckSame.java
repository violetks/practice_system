import com.violetks.fileUtil.CheckSame;

/**
 * 测试比较两个代码相似度
 * 相似度匹配算法
 * （据说）由俄国人Vladimir Levenshtein在1965年发明
 * 原理：返回将第一个字符串转换(删除、插入、替换)成第二个字符串的编辑次数。
 * 次数越少，意味着字符串相似度越高
 */
public class TestCheckSame {
    public TestCheckSame() {
    }

    public static void main(String[] args) {

        String Str_1 = "abcdefghi5klmuvwxyz";
        String Str_2 = "akcdefghijkl2uvwxz";

        CheckSame checkSame = new CheckSame();
        double result = checkSame.checkSimiliar(Str_1, Str_2);
        System.out.println("相似度："+result);
    }

}
