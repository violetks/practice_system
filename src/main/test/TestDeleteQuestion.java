import com.violetks.dao.QuestionDao;

/**
 * 测试删除题目
 */
public class TestDeleteQuestion {
    public TestDeleteQuestion() {
    }

    public static void main(String[] args) {
        QuestionDao dao = new QuestionDao();
        boolean res = dao.deleteQuestion(31);
        if (res) {
            System.out.print("删除成功");
        } else {
            System.out.print("删除失败");
        }
    }
}
