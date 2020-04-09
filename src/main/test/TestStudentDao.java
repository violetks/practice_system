import com.violetks.dao.StudentDao;
import com.violetks.entity.Student;

/**
 * 测试数据库连接
 * 学生登录
 */
public class TestStudentDao {
    public TestStudentDao() {
    }

    public static void main(String[] args) {
        StudentDao dao = new StudentDao();
        Student s = new Student();
        s.setSid(2016206929);
        s.setsPwd("123456");
        Student student = dao.getStudent(s);
        if (student != null) {
            try {
                System.out.print(student.getSid() + "\t");
                System.out.print(student.getsName() + "\t");
                System.out.print(student.getsClass() + "\t");
                System.out.print(student.getsGrade());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
