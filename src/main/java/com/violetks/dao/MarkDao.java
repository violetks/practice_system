package com.violetks.dao;

import com.violetks.entity.Mark;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MarkDao extends BaseDao {
    // 添加评分记录
    public boolean addMarkRecord(Mark mark) {
        try {
            String sql = "insert into tb_mark(t_id,s_id,q_id,t_score,s_score,t_result) values(?,?,?,?,?,?)";
            this.pstm = this.con.prepareStatement(sql);
            this.pstm.setInt(1, mark.getTid());
            this.pstm.setInt(2, mark.getSid());
            this.pstm.setInt(3, mark.getQid());
            this.pstm.setInt(4, mark.gettScore());
            this.pstm.setInt(5, mark.getsScore());
            this.pstm.setInt(6, mark.gettResult());
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

    // 查询评分记录
    public Mark getMark(int sid, int qid) {
        Statement stmt = null;
        ResultSet rs = null;

        try {
            String sql = "select * from tb_mark where s_id=" + sid + " and q_id=" + qid;
            stmt = this.con.createStatement();
            rs = stmt.executeQuery(sql);

            Mark m = null;
            if (rs.next()) {
                m = new Mark();
                m.setId(rs.getInt("id"));
                m.setTid(rs.getInt("t_id"));
                m.setSid(rs.getInt("s_id"));
                m.setQid(rs.getInt("q_id"));
                m.settScore(rs.getInt("t_score"));
                m.setsScore(rs.getInt("s_score"));
                m.settResult(rs.getInt("t_result"));
                m.setViewTime(rs.getDate("view_time"));
            }
            return m;
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
