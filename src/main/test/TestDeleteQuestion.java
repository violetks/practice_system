import com.violetks.dao.ProgramDao;

/**
 * 测试删除题目
 * 编程题
 */
public class TestDeleteQuestion {
    public TestDeleteQuestion() {
    }

    public static void main(String[] args) {
        ProgramDao dao = new ProgramDao();
        Boolean res = dao.deleteQuestion(31);
        if (res) {
            System.out.print("删除成功");
        } else {
            System.out.print("删除失败");
        }
    }
}
