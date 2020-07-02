package com.violetks.dao;

import com.violetks.entity.Student;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class StudentDao extends BaseDao {
    // 登录 - 获取学生信息
    // StuLoginServlet
    // studentLogin.jsp
    public Student getStudent(Student student) {
        ResultSet rs = null;

        try {
            String sql = "select * from tb_student where s_id= ? and s_pwd= ?";
            this.pstm = this.con.prepareStatement(sql);
            this.pstm.setInt(1, student.getSid());
            this.pstm.setString(2, student.getsPwd());
            rs = this.pstm.executeQuery();

            Student s = null;
            if (rs.next()) {
                s = new Student();
                s.setSid(rs.getInt("s_id"));
                s.setsName(rs.getString("s_name"));
                s.setsPwd(rs.getString("s_pwd"));
                s.setsSex(rs.getInt("s_sex"));
                s.setsGrade(rs.getString("s_grade"));
                s.setsClass(rs.getString("s_class"));
                s.setsDept(rs.getString("s_dept"));
            }
            return s;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (this.pstm != null) {
                    this.pstm.close();
                }
            } catch (Exception e) {
            }
        }
        return null;
    }

    // 注册 - 添加学生
    // StuRegisterServlet
    // stuRegister.jsp
    public boolean addStudent(Student student) {
        try {
            String sql = "insert into tb_student(s_id,s_name,s_pwd,s_sex,s_grade,s_class,s_dept) values(?,?,?,?,?,?,?)";
            this.pstm = this.con.prepareStatement(sql);
            this.pstm.setInt(1, student.getSid());
            this.pstm.setString(2, student.getsName());
            this.pstm.setString(3, student.getsPwd());
            this.pstm.setInt(4, student.getsSex());
            this.pstm.setString(5, student.getsGrade());
            this.pstm.setString(6, student.getsClass());
            this.pstm.setString(7, student.getsDept());
            int i = this.pstm.executeUpdate();
            if (i > 0) {
                return true;
            }
            return false;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (this.pstm != null) {
                    this.pstm.close();
                }
            } catch (Exception e) {
            }
        }
        return false;
    }

    // 注册 - 判断学号是否重复
    // StuRegisterServlet
    // stuRegister.jsp
    public Student getStudentBySid(Student student) {
        ResultSet rs = null;

        try {
            String sql = "select * from tb_student where s_id= ?";
            this.pstm = this.con.prepareStatement(sql);
            this.pstm.setInt(1, student.getSid());
            rs = this.pstm.executeQuery();

            Student s = null;
            if (rs.next()) {
                s = new Student();
                s.setSid(rs.getInt("s_id"));
                s.setsName(rs.getString("s_name"));
                s.setsPwd(rs.getString("s_pwd"));
                s.setsSex(rs.getInt("s_sex"));
                s.setsGrade(rs.getString("s_grade"));
                s.setsClass(rs.getString("s_class"));
                s.setsDept(rs.getString("s_dept"));
            }
            return s;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (this.pstm != null) {
                    this.pstm.close();
                }
            } catch (Exception e) {
            }
        }
        return null;
    }

    // 教师 - 获取学生班级
    // studentList.jsp
    public List<Student> getStudentClass(){
        Statement stmt = null;
        ResultSet rs = null;
        ArrayList list = new ArrayList();

        ArrayList sClassList;
        try {
            stmt = this.con.createStatement();
            rs = stmt.executeQuery("select distinct s_class from tb_student");

            while (rs.next()) {
                Student student = new Student();
                student.setsClass(rs.getString("s_class"));
                list.add(student);
            }

            sClassList = list;
            return sClassList;
        } catch (Exception e) {
            e.printStackTrace();
            sClassList = list;
        } finally {
            closeAll(stmt, null);
        }

        return sClassList;
    }

    // 教师 - 根据班级获取学生列表
    // studentList.jsp 在 url 中将 sClass 作为参数，跳转到 viewStudent.jsp 显示学生列表
    public List<Student> getStudentList(String s_class) {
        Statement stmt = null;
        ResultSet rs = null;
        ArrayList list = new ArrayList();

        ArrayList studentList;
        try {
            stmt = this.con.createStatement();
            rs = stmt.executeQuery("select * from tb_student where s_class=" + s_class);

            while (rs.next()) {
                Student student = new Student();
                student.setSid(rs.getInt("s_id"));
                student.setsName(rs.getString("s_name"));
                student.setsPwd(rs.getString("s_pwd"));
                student.setsSex(rs.getInt("s_sex"));
                student.setsGrade(rs.getString("s_grade"));
                student.setsClass(rs.getString("s_class"));
                student.setsDept(rs.getString("s_dept"));
                list.add(student);
            }

            studentList = list;
            return studentList;
        } catch (Exception e) {
            e.printStackTrace();
            studentList = list;
        } finally {
            closeAll(stmt, null);
        }

        return studentList;
    }

    // 教师 - 获取学生列表
    // studentTest.jsp
    public List<Student> getStudentLists() {
        Statement stmt = null;
        ResultSet rs = null;
        ArrayList list = new ArrayList();

        ArrayList studentList;
        try {
            stmt = this.con.createStatement();
            rs = stmt.executeQuery("select * from tb_student");

            while (rs.next()) {
                Student student = new Student();
                student.setSid(rs.getInt("s_id"));
                student.setsName(rs.getString("s_name"));
                student.setsPwd(rs.getString("s_pwd"));
                student.setsSex(rs.getInt("s_sex"));
                student.setsGrade(rs.getString("s_grade"));
                student.setsClass(rs.getString("s_class"));
                student.setsDept(rs.getString("s_dept"));
                list.add(student);
            }

            studentList = list;
            return studentList;
        } catch (Exception e) {
            e.printStackTrace();
            studentList = list;
        } finally {
            closeAll(stmt, null);
        }

        return studentList;
    }
}
