package com.violetks.dao;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class RanklistDao extends BaseDao {
    // 排行榜
//    public List<RankList> getRankList(int top) {
//        String sql;
//        if (top == 0) {
//            sql = "SELECT a._sid,b.name,a.tishu FROM (SELECT DISTINCT _sid,COUNT(*)as tishu FROM ex_record WHERE result=1 GROUP BY _sid) as a,student as b WHERE a._sid=b.sid ORDER BY a.tishu DESC";
//        } else {
//            sql = "SELECT a._sid,b.name,a.tishu FROM (SELECT DISTINCT _sid,COUNT(*)as tishu FROM ex_record WHERE result=1 GROUP BY _sid) as a,student as b WHERE a._sid=b.sid ORDER BY a.tishu DESC Limit " + top;
//        }
//
//        Statement stmt = null;
//        ResultSet rs = null;
//        ArrayList list = new ArrayList();
//
//        ArrayList rankList;
//        try {
//            stmt = this.con.createStatement();
//            rs = stmt.executeQuery(sql);
//
//            while(rs.next()) {
//                RankList es = new RankList();
//                es.setSid(rs.getString(1));
//                es.setsName(rs.getString(2));
//                es.setAmount(rs.getInt(3));
//                list.add(es);
//            }
//
//            rankList = list;
//            return rankList;
//        } catch (Exception e) {
//            e.printStackTrace();
//            rankList = list;
//        } finally {
//            closeAll(stmt,null);
//        }
//
//        return rankList;
//    }
}
