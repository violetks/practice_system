package com.violetks.dao;

import com.violetks.entity.Question;
import com.violetks.entity.Record;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class RecordDao extends BaseDao {
    // 添加练习记录
    public boolean addExciseRecord(Record record) {
        try {
            String sql = "insert into tb_record(s_id,q_id,s_answer,s_rate,s_result) values(?,?,?,?,?)";
            this.pstm = this.con.prepareStatement(sql);
            this.pstm.setInt(1, record.getSid());
            this.pstm.setInt(2, record.getQid());
            this.pstm.setString(3, record.getsAnswer());
            this.pstm.setInt(4, record.getsRate());
            this.pstm.setInt(5, record.getsResult());
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

    /**
     * 获取不同难度等级试题 已解决题数
     * questionSet.jsp
     *
     * @param q_level : 难度等级
     * @param q_type  : 试题类型，0-单选，1-多选，2-填空，3-判断，4-编程，5-简答
     * @param result  : 0-未解决，1-已解决
     */
    public int getResolvedCount(int sid, int q_level, int q_type, int result) {
        Statement stmt = null;
        ResultSet rs = null;

        try {
            String sql = "select count(DISTINCT r.q_id) as sum from tb_record r INNER JOIN tb_question q ON r.q_id = q.q_id where r.s_id=" + sid + " and r.s_result=" + result + " and q.q_level=" + q_level + " and q.q_type=" + q_type;
            stmt = this.con.createStatement();
            rs = stmt.executeQuery(sql);
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

    // 获取每道题完成次数
    // questionLevelSet.jsp
    public int getExResult(int sid, int qid, int result) {
        Statement stmt = null;
        ResultSet rs = null;

        try {
            stmt = this.con.createStatement();
            rs = stmt.executeQuery("select count(*) as sum from tb_record where s_id=" + sid + " and q_id=" + qid + " and s_result=" + result);
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

    /**
     * 查询个人练习记录
     * exerciseSet.jsp
     *
     * @param sid
     * @return q_id, q_name, q_type, q_level, submit_time
     * 根据学号查询多个学生练习记录
     * studentTest.jsp
     */
    public List<Record> getExciseResult(int sid) {
        Statement stmt = null;
        ResultSet rs = null;
        ArrayList list = new ArrayList();

        ArrayList exResultList;
        try {
            String sql = "select r.q_id,q.q_name,q.q_type,q.q_level,r.submit_time,r.s_answer,r.s_rate,r.s_result,q.t_score,r.id,q.q_answer from (select * from tb_record where s_id=" + sid + " and s_result=1 order by submit_time DESC) r INNER JOIN tb_question q ON r.q_id = q.q_id GROUP BY r.q_id";
            stmt = this.con.createStatement();
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Record record = new Record();
                Question question = new Question();
                record.setQid(rs.getInt(1));
                question.setqName(rs.getString(2));
                question.setqType(rs.getInt(3));
                question.setqLevel(rs.getInt(4));
                question.settScore(rs.getInt(9));
                question.setqAnswer(rs.getString(11));
                record.setQuestion(question);
                record.setSubmitTime(rs.getDate(5));
                record.setsAnswer(rs.getString(6));
                record.setsRate(rs.getInt(7));
                record.setsResult(rs.getInt(8));
                record.setId(rs.getInt(10));
                list.add(record);
            }

            exResultList = list;
            return exResultList;
        } catch (Exception e) {
            e.printStackTrace();
            exResultList = list;
        } finally {
            closeAll(stmt, null);
        }

        return exResultList;
    }
}
