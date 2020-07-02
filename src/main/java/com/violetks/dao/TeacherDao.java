package com.violetks.dao;

import com.violetks.entity.Teacher;

import java.sql.ResultSet;

public class TeacherDao extends BaseDao {
    // 登录 - 获取教师信息
    // TeaLoginServlet
    // teacherLogin.jsp
    public Teacher getTeacher(Teacher teacher) {
        ResultSet rs = null;

        try {
            String sql = "select * from tb_teacher where t_phone= ? and t_pwd= ?";
            this.pstm = this.con.prepareStatement(sql);
            this.pstm.setString(1, teacher.gettPhone());
            this.pstm.setString(2, teacher.gettPwd());
            rs = this.pstm.executeQuery();

            Teacher t = null;
            if (rs.next()) {
                t = new Teacher();
                t.setTid(rs.getInt("t_id"));
                t.settName(rs.getString("t_name"));
                t.settPwd(rs.getString("t_pwd"));
                t.settPhone(rs.getString("t_phone"));
                t.settDept(rs.getString("t_dept"));
            }
            return t;
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

    // 注册 - 添加教师
    // TeaRegisterServlet
    // teaRegister.jsp
    public boolean addTeacher(Teacher teacher) {
        try {
            String sql = "insert into tb_teacher(t_name,t_phone,t_pwd,t_dept) values(?,?,?,?)";
            this.pstm = this.con.prepareStatement(sql);
            this.pstm.setString(1, teacher.gettName());
            this.pstm.setString(2, teacher.gettPhone());
            this.pstm.setString(3, teacher.gettPwd());
            this.pstm.setString(4, teacher.gettDept());
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

    // 注册 - 判断手机号是否重复
    // TeaRegisterServlet
    // teaRegister.jsp
    public Teacher getTeacherByPhone(Teacher teacher) {
        ResultSet rs = null;

        try {
            String sql = "select * from tb_teacher where t_phone= ?";
            this.pstm = this.con.prepareStatement(sql);
            this.pstm.setString(1, teacher.gettPhone());
            rs = this.pstm.executeQuery();

            Teacher t = null;
            if (rs.next()) {
                t = new Teacher();
                t.settName(rs.getString("t_name"));
                t.settPwd(rs.getString("t_pwd"));
                t.settPhone(rs.getString("t_phone"));
                t.settDept(rs.getString("t_dept"));
            }
            return t;
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
