import com.violetks.dao.TeacherDao;
import com.violetks.entity.Teacher;

/**
 * 测试教师登录
 */
public class TestTeacherDao {
    public TestTeacherDao() {
    }

    public static void main(String[] args) {
        TeacherDao dao = new TeacherDao();
        Teacher t = new Teacher();
        t.settPhone("17863963946");
        t.settPwd("qwe");
        Teacher teacher = dao.getTeacher(t);
        if (teacher != null) {
            try {
                System.out.print(teacher.getTid() + "\t");
                System.out.print(teacher.gettName() + "\t");
                System.out.print(teacher.gettPwd() + "\t");
                System.out.print(teacher.gettPhone() + "\t");
                System.out.print(teacher.gettDept());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
