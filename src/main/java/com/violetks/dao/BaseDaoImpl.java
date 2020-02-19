package com.violetks.dao;

import com.violetks.entity.Question;
import com.violetks.entity.RankList;
import com.violetks.entity.Record;
import com.violetks.entity.Student;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class BaseDaoImpl implements BaseDao{
    private String driverClassName = "com.mysql.jdbc.Driver";
    private String databaseURL = "jdbc:mysql://47.99.243.73:3306/sysdb?user=sysdb&password=fCjNRTmceXD7zGXy&useUnicode=true&characterEncoding=utf8";
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
//                student.setGender(rs.getString("gender"));
//                student.setGrades(rs.getString("grades"));
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
    public List<Question> getQuestionList(int category) {
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

    // 获取每道题完成状态
    public int getExResult(int sid, int qid, int result) {
        Statement stmt = null;
        ResultSet rs = null;

        try {
            stmt = this.con.createStatement();
            rs = stmt.executeQuery("select count(*) as sum from tb_record where _sid=" + sid + " and _qid=" + qid + " and result=" + result);
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

    // 获取单个试题 详细内容
    public Question getQuestion(int qid) {
        Statement stmt = null;
        ResultSet rs = null;
        Question question = new Question();

        try {
            stmt = this.con.createStatement();
            rs = stmt.executeQuery("select * from tb_question where qid=" + qid);
            if (rs.next()) {
                question.setQid(qid);
                question.setName(rs.getString("name"));
                question.setCategory(rs.getInt("category"));
                question.setContent(rs.getString("content"));
                question.setKeyword(rs.getString("keyword"));
                question.setAddtime(rs.getDate("add_time"));
                return question;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return question;
        } finally {
            closeAll(stmt,null);
        }
        return question;
    }

    // 添加问题
    public boolean addQuestion(Question question) {
        try {
            String sql = "insert into tb_question(name,content,keyword,category) values(?,?,?,?)";
            this.pstm = this.con.prepareStatement(sql);
            this.pstm.setString(1, question.getName());
            this.pstm.setString(2, question.getContent());
            this.pstm.setString(3, question.getKeyword());
            this.pstm.setInt(4, question.getCategory());
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

    // 添加选择题
    public boolean addChoiceQuestion(Question question) {
        try {
            this.pstm = this.con.prepareStatement("insert into tb_question values(?,?,?,?,?,?,?,?,?)");
            this.pstm.setInt(1, question.getCategory());
            this.pstm.setString(2, question.getContent());
            this.pstm.setString(3, question.getKeyword());
            int i = this.pstm.executeUpdate();
            if (i > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
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

    // 更新某道题
    public boolean updateQuestion(int qid, Question question) {
        try {
            String sql = "update tb_question set name=?,content=?,keyword=?,category=? where qid=" + qid;
            this.pstm = this.con.prepareStatement(sql);
            this.pstm.setString(1, question.getName());
            this.pstm.setString(2, question.getContent());
            this.pstm.setString(3, question.getKeyword());
            this.pstm.setInt(4, question.getCategory());
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

    // 添加练习记录
    public boolean addExciseRecord(Record record) {
        try {
            this.pstm = this.con.prepareStatement("insert into tb_record(_sid,_qid,name,result,category) values(?,?,?,?,?)");
            this.pstm.setInt(1, record.getS().getSid());
            this.pstm.setInt(2, record.getQ().getQid());
            this.pstm.setString(3, record.getQ().getName());
            this.pstm.setInt(4, record.getResult());
            this.pstm.setInt(5, record.getCategory());
            int i = this.pstm.executeUpdate();
            if (i > 0) {
                return true;
            }
            return false;
        } catch (SQLException e) {
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

    // 查询练习记录
    public List<Record> getExResult(int sid, int result) {
        Statement stmt = null;
        ResultSet rs = null;
        ArrayList list = new ArrayList();

        ArrayList exResultList;
        try {
            stmt = this.con.createStatement();
            rs = stmt.executeQuery("select _qid,name,category,submit_time from tb_record where _sid=" + sid + " and result=" + result);

            while(rs.next()) {
                Record record = new Record();
                record.setId(rs.getInt(1));
                record.setName(rs.getString(2));
                record.setCategory(rs.getInt(3));
                record.setSubmitTime(rs.getDate(4));
                list.add(record);
            }

            exResultList = list;
            return exResultList;
        } catch (Exception e) {
            e.printStackTrace();
            exResultList = list;
        } finally {
            closeAll(stmt,null);
        }

        return exResultList;
    }

    // 排行榜
    public List<RankList> getExResult(int top) {
        String sql;
        if (top == 0) {
            sql = "SELECT a._sid,b.name,a.tishu FROM (SELECT DISTINCT _sid,COUNT(*)as tishu FROM ex_record WHERE result=1 GROUP BY _sid) as a,student as b WHERE a._sid=b.sid ORDER BY a.tishu DESC";
        } else {
            sql = "SELECT a._sid,b.name,a.tishu FROM (SELECT DISTINCT _sid,COUNT(*)as tishu FROM ex_record WHERE result=1 GROUP BY _sid) as a,student as b WHERE a._sid=b.sid ORDER BY a.tishu DESC Limit " + top;
        }

        Statement stmt = null;
        ResultSet rs = null;
        ArrayList list = new ArrayList();

        ArrayList rankList;
        try {
            stmt = this.con.createStatement();
            rs = stmt.executeQuery(sql);

            while(rs.next()) {
                RankList es = new RankList();
                es.setSid(rs.getString(1));
                es.setName(rs.getString(2));
                es.setAmount(rs.getInt(3));
                list.add(es);
            }

            rankList = list;
            return rankList;
        } catch (Exception e) {
            e.printStackTrace();
            rankList = list;
        } finally {
            closeAll(stmt,null);
        }

        return rankList;
    }
}
