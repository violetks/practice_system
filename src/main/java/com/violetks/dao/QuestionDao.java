package com.violetks.dao;

import com.violetks.entity.Question;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class QuestionDao extends BaseDao {
    // 获取不同类型试题总数
    // questionSet.jsp
    public int getCountByType(int q_type) {
        Statement stmt = null;
        ResultSet rs = null;

        try {
            stmt = this.con.createStatement();
            rs = stmt.executeQuery("select count(*) as sum from tb_question where q_type=" + q_type);
            if (rs.next()) {
                return rs.getInt("sum");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeAll(stmt, null);
        }
        return 0;
    }

    // 获取不同难度等级试题的总数
    // questionSet.jsp
    public int getCountByTypeAndLevel(int q_type,int q_level) {
        Statement stmt = null;
        ResultSet rs = null;

        try {
            stmt = this.con.createStatement();
            rs = stmt.executeQuery("select count(*) as sum from tb_question where q_level=" + q_level + " and q_type=" + q_type);
            if (rs.next()) {
                return rs.getInt("sum");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        } finally {
            closeAll(stmt, null);
        }
        return 0;
    }

    // 获取不同难度等级试题 更新时间
    // questionSet.jsp
    public Date getLastTime(int q_type,int q_level) {
        Statement stmt = null;
        ResultSet rs = null;

        try {
            stmt = this.con.createStatement();
            rs = stmt.executeQuery("select add_time from tb_question where q_level=" + q_level + " and q_type=" + q_type + " order by q_id desc limit 1");
            if (rs.next()) {
                return rs.getDate("add_time");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            closeAll(stmt, null);
        }
        return null;
    }

    // 获取不同难度等级试题 试题列表
    // questionLevelSet.jsp
    public List<Question> getQuestionList(int q_type,int q_level) {
        Statement stmt = null;
        ResultSet rs = null;
        ArrayList list = new ArrayList();

        ArrayList questionList;
        try {
            stmt = this.con.createStatement();
            rs = stmt.executeQuery("select * from tb_question where q_level=" + q_level + " and q_type=" + q_type);

            while (rs.next()) {
                Question question = new Question();
                question.setQid(rs.getInt("q_id"));
                question.setqName(rs.getString("q_name"));
                question.setqKeyword(rs.getString("q_keyword"));
                question.setqLevel(rs.getInt("q_level"));
                list.add(question);
            }

            questionList = list;
            return questionList;
        } catch (Exception e) {
            e.printStackTrace();
            questionList = list;
        } finally {
            closeAll(stmt, null);
        }

        return questionList;
    }

    // 获取单个题目 详细内容
    // programQItem.jsp
    public Question getQuestionItem(int qid) {
        Statement stmt = null;
        ResultSet rs = null;
        Question question = new Question();

        try {
            stmt = this.con.createStatement();
            rs = stmt.executeQuery("select * from tb_question where q_id=" + qid);
            if (rs.next()) {
                question.setQid(qid);
                question.setqType(rs.getInt("q_type"));
                question.setqLevel(rs.getInt("q_level"));
                question.setqName(rs.getString("q_name"));
                question.setqContent(rs.getString("q_content"));
                question.setqKeyword(rs.getString("q_keyword"));
                question.setqAnswer(rs.getString("q_answer"));
                question.settScore(rs.getInt("t_score"));
                question.setAddTime(rs.getDate("add_time"));
                return question;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return question;
        } finally {
            closeAll(stmt, null);
        }
        return question;
    }

    // 获取不同类型试题 试题列表
    // viewQuestion.jsp
    public List<Question> getQuestionList(int q_type) {
        Statement stmt = null;
        ResultSet rs = null;
        ArrayList list = new ArrayList();

        ArrayList questionList;
        try {
            stmt = this.con.createStatement();
            rs = stmt.executeQuery("select * from tb_question where q_type=" + q_type);

            while (rs.next()) {
                Question question = new Question();
                question.setQid(rs.getInt("q_id"));
                question.setqName(rs.getString("q_name"));
                question.setqContent(rs.getString("q_content"));
                question.setqKeyword(rs.getString("q_keyword"));
                question.setqAnswer(rs.getString("q_answer"));
                question.settScore(rs.getInt("t_score"));
                question.setqLevel(rs.getInt("q_level"));
                list.add(question);
            }

            questionList = list;
            return questionList;
        } catch (Exception e) {
            e.printStackTrace();
            questionList = list;
        } finally {
            closeAll(stmt, null);
        }

        return questionList;
    }

    // 获取教师添加每道题的时间
    // viewQuestion.jsp
    public Date getAddTime(int qid) {
        Statement stmt = null;
        ResultSet rs = null;

        try {
            stmt = this.con.createStatement();
            rs = stmt.executeQuery("select add_time from tb_question where q_id=" + qid);
            if (rs.next()) {
                return rs.getDate("add_time");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            closeAll(stmt, null);
        }
        return null;
    }

    // 获取最后一次添加的题信息
    public int getLastQid(){
        Statement stmt = null;
        ResultSet rs = null;

        try {
            stmt = this.con.createStatement();
            rs = stmt.executeQuery("select * from tb_question order by q_id desc limit 1");
            if (rs.next()) {
                return rs.getInt("q_id");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        } finally {
            closeAll(stmt, null);
        }
        return 0;
    }

    // 添加题目，不同类型题都可用
    public boolean addQuestion(Question question) {
        try {
            String sql = "insert into tb_question(q_type,q_level,q_name,q_content,q_keyword,q_answer,t_score) values(?,?,?,?,?,?,?)";
            this.pstm = this.con.prepareStatement(sql);
            this.pstm.setInt(1, question.getqType());
            this.pstm.setInt(2, question.getqLevel());
            this.pstm.setString(3, question.getqName());
            this.pstm.setString(4, question.getqContent());
            this.pstm.setString(5, question.getqKeyword());
            this.pstm.setString(6, question.getqAnswer());
            this.pstm.setInt(7, question.gettScore());
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

    // 删除某道题
    public boolean deleteQuestion(int qid) {
        try {
            String sql = "delete from tb_question where q_id=" + qid;
            this.pstm = this.con.prepareStatement(sql);
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

    // 更新某道题
    public boolean updateQuestion(int qid, Question question) {
        try {
            String sql = "update tb_question set q_level=?,q_name=?,q_content=?,q_keyword=?,q_answer=? where q_id=" + qid;
            this.pstm = this.con.prepareStatement(sql);
            this.pstm.setInt(1, question.getqLevel());
            this.pstm.setString(2, question.getqName());
            this.pstm.setString(3, question.getqContent());
            this.pstm.setString(4, question.getqKeyword());
            this.pstm.setString(5, question.getqAnswer());
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
}
