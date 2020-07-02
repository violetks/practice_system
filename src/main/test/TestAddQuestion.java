import com.violetks.dao.QuestionDao;
import com.violetks.entity.Question;

/**
 * 测试添加题目
 * 测试如果题目信息填写不完整是否也能添加
 */
public class TestAddQuestion {
    public TestAddQuestion() {
    }

    public static void main(String[] args) {
        Question question = new Question();
        question.setqType(1);
        question.setqLevel(2);
        question.setqName("测试添加题");
        QuestionDao dao = new QuestionDao();
        boolean res = dao.addQuestion(question);
        if (res) {
            System.out.print("添加成功");
        } else {
            System.out.print("添加失败");
        }
    }
}
