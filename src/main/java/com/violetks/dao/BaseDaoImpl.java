package com.violetks.dao;

import com.violetks.entity.Question;
import com.violetks.entity.Student;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class BaseDaoImpl implements BaseDao{
    private String driverClassName = "com.mysql.jdbc.Driver";
    private String databaseURL = "jdbc:mysql://localhost:3306/sysdb?user=root&password=xl123456&useUnicode=true&characterEncoding=utf8";
    private Connection con = null;
    private PreparedStatement pstm = null;

    public BaseDaoImpl() {
        try {
            Class.forName(this.driverClassName);
            this.con = DriverManager.getConnection(this.databaseURL);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    // 关闭所有连接
    public void closeAll(Statement stmt, ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
//        if (conn != null) {
//            try {
//                conn.close();
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        }
    }

    // 获取学生信息
    public Student getStudent(int sid,String password) {
        Statement stmt = null;
        ResultSet rs = null;
        Student student = new Student();

        Student obj;
        try {
            stmt = this.con.createStatement();
            rs = stmt.executeQuery("select sid,name,password from tb_student where sid='"+sid+"'and password='"+password+"'");
            if (rs.next()) {
                student.setSid(rs.getInt("sid"));
                student.setName(rs.getString("name"));
                student.setPassword(rs.getString("password"));
//                user.setGender(rs.getString("gender"));
//                user.setGrade(rs.getString("grades"));
                obj = student;
                return obj;
            }
            obj = student;
        } catch (Exception e) {
            e.printStackTrace();
            obj = student;
            return obj;
        } finally {
            closeAll(stmt, null);
        }
        return obj;
    }

    // 获取每类试题 总数
    public int getCount(int category) {
        Statement stmt = null;
        ResultSet rs = null;

        try {
            stmt = this.con.createStatement();
            rs = stmt.executeQuery("select count(*) as sum from tb_question where category=" + category);
            if (rs.next()) {
                int count = rs.getInt("sum");
                return count;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        } finally {
            closeAll(stmt, null);
        }
        return 0;
    }

    // 获取每类试题 已解决数量
    public int getResolvedCount(int sid, int category, int result) {
        Statement stmt = null;
        ResultSet rs = null;

        try {
            stmt = this.con.createStatement();
            rs = stmt.executeQuery("select count(*) as sum from tb_record where _sid=" + sid + " and category=" + category + " and result=" + result);
            if (rs.next()) {
                int count = rs.getInt("sum");
                return count;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeAll(stmt,null);
        }
        return 0;
    }

    // 获取每类试题 更新时间
    public Date getLastTime(int category) {
        Statement stmt = null;
        ResultSet rs = null;

        try {
            stmt = this.con.createStatement();
            rs = stmt.executeQuery("select add_time from tb_question where category=" + category + " order by qid desc limit 1");
            if (rs.next()) {
                Date addTime = rs.getDate("add_time");
                return addTime;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            closeAll(stmt,null);
        }
        return null;
    }

    // 获取试题总数
    public int getLastQid() {
        Statement stmt = null;
        ResultSet rs = null;

        try {
            stmt = this.con.createStatement();
            rs = stmt.executeQuery("select * from tb_question order by qid desc limit 1");
            if (rs.next()) {
                int qid = rs.getInt("qid");
                return qid;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeAll(stmt,null);
        }
        return 0;
    }

    // 获取每类试题 试题列表
    public List<Question> getQuestions(int category) {
        Statement stmt = null;
        ResultSet rs = null;
        ArrayList list = new ArrayList();

        ArrayList questionList;
        try {
            stmt = this.con.createStatement();
            rs = stmt.executeQuery("select * from tb_question where category=" + category);

            while(rs.next()) {
                Question question = new Question();
                question.setQid(rs.getInt("qid"));
                question.setName(rs.getString("name"));
                question.setKeyword(rs.getString("keyword"));
                question.setCategory(rs.getInt("category"));
                list.add(question);
            }

            questionList = list;
            return questionList;
        } catch (Exception e) {
            e.printStackTrace();
            questionList = list;
        } finally {
            closeAll(stmt,null);
        }

        return questionList;
    }
}
