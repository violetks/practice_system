package com.violetks.dao;

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
            this.pstm = this.con.prepareStatement("insert into tb_record(_sid,_qid,name,result,category,level) values(?,?,?,?,?,?)");
            this.pstm.setInt(1, record.getS().getSid());
            this.pstm.setInt(2, record.getQuestion().getQid());
//            this.pstm.setString(3, record.getQuestion().getName());
            this.pstm.setInt(4, record.getResult());
            this.pstm.setInt(5, record.getCategory());
            this.pstm.setInt(6, record.getLevel());
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
    public List<Record> getExciseResult(int sid, int result) {
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
}
