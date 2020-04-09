package com.violetks.dao;

import com.violetks.entity.Student;

import java.sql.ResultSet;

public class StudentDao extends BaseDao {
    // 登录 - 获取学生信息
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
}
