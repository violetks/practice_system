package com.violetks.dao;

import com.violetks.entity.Question;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ProgramDao extends BaseDao {
    // 获取编程题总数
    // programSet.jsp
    public int getProgramCount(int q_type) {
        Statement stmt = null;
        ResultSet rs = null;

        try {
            stmt = this.con.createStatement();
            rs = stmt.executeQuery("select count(*) as sum from tb_question where q_type=" + q_type);
            if (rs.next()) {
                int count = rs.getInt("sum");
                return count;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeAll(stmt, null);
        }
        return 0;
    }

    // 获取不同难度等级试题的总数
    // programSet.jsp
    public int getCount(int q_level) {
        Statement stmt = null;
        ResultSet rs = null;

        try {
            stmt = this.con.createStatement();
            rs = stmt.executeQuery("select count(*) as sum from tb_question where q_level=" + q_level + " and q_type=" + 4);
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

    // 获取不同难度等级试题 已解决数量
    // programSet.jsp
    // q_level : 难度等级
    // q_type : 试题类型，0-单选，1-多选，2-填空，3-判断，4-编程，5-简答
//    public int getResolvedCount(int sid, int q_level, int q_type, int result) {
//        Statement stmt = null;
//        ResultSet rs = null;
//
//        try {
//            stmt = this.con.createStatement();
//            rs = stmt.executeQuery("select count(*) as sum from tb_record where _sid=" + sid + " and level=" + level + " and category=" + category + " and result=" + result);
//            if (rs.next()) {
//                int count = rs.getInt("sum");
//                return count;
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            closeAll(stmt, null);
//        }
//        return 0;
//    }

    // 获取不同难度等级试题 更新时间
    // programSet.jsp
    public Date getLastTime(int q_level) {
        Statement stmt = null;
        ResultSet rs = null;

        try {
            stmt = this.con.createStatement();
            rs = stmt.executeQuery("select add_time from tb_question where q_level=" + q_level + " and q_type=" + 4 + " order by q_id desc limit 1");
            if (rs.next()) {
                Date addTime = rs.getDate("add_time");
                return addTime;
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
    // programLevelSet.jsp
    public List<Question> getQuestionListByLevel(int q_level) {
        Statement stmt = null;
        ResultSet rs = null;
        ArrayList list = new ArrayList();

        ArrayList questionList;
        try {
            stmt = this.con.createStatement();
            rs = stmt.executeQuery("select * from tb_question where q_level=" + q_level + " and q_type=" + 4);

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

    // 获取每道题完成次数
    // programLevelSet.jsp
//    public int getExResult(int sid, int qid, int category, int result) {
//        Statement stmt = null;
//        ResultSet rs = null;
//
//        try {
//            stmt = this.con.createStatement();
//            rs = stmt.executeQuery("select count(*) as sum from tb_record where _sid=" + sid + " and _qid=" + qid + " and category=" + category + " and result=" + result);
//            if (rs.next()) {
//                int count = rs.getInt("sum");
//                return count;
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            closeAll(stmt, null);
//        }
//        return 0;
//    }

    // 获取单个编程题 详细内容
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
}
