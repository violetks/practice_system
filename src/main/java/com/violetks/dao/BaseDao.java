package com.violetks.dao;

import java.sql.*;

public class BaseDao {
    public String driverClassName = "com.mysql.jdbc.Driver";
    public String databaseURL = "jdbc:mysql://47.99.243.73:3306/sysdb?user=sysdb&password=fCjNRTmceXD7zGXy&useUnicode=true&characterEncoding=utf8";
    public Connection con = null;
    public PreparedStatement pstm = null;

    public BaseDao() {
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

    // 添加问题
//    public boolean addQuestion(Question programQuestion) {
//        try {
//            String sql = "insert into tb_question(name,content,keyword,category) values(?,?,?,?)";
//            this.pstm = this.con.prepareStatement(sql);
//            this.pstm.setString(1, programQuestion.getName());
//            this.pstm.setString(2, programQuestion.getContent());
//            this.pstm.setString(3, programQuestion.getKeyword());
////            this.pstm.setInt(4, programQuestion.getCategory());
//            int i = this.pstm.executeUpdate();
//            if (i > 0) {
//                return true;
//            }
//            return false;
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            try {
//                if (this.pstm != null) {
//                    this.pstm.close();
//                }
//            } catch (Exception e) {
//            }
//        }
//        return false;
//    }
//
//    // 添加选择题
//    public boolean addChoiceQuestion(Question programQuestion) {
//        try {
//            this.pstm = this.con.prepareStatement("insert into tb_question values(?,?,?,?,?,?,?,?,?)");
////            this.pstm.setInt(1, programQuestion.getCategory());
//            this.pstm.setString(2, programQuestion.getContent());
//            this.pstm.setString(3, programQuestion.getKeyword());
//            int i = this.pstm.executeUpdate();
//            if (i > 0) {
//                return true;
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return false;
//        } finally {
//            try {
//                if (this.pstm != null) {
//                    this.pstm.close();
//                }
//            } catch (Exception e) {
//            }
//        }
//        return false;
//    }
//
//    // 更新某道题
//    public boolean updateQuestion(int qid, Question programQuestion) {
//        try {
//            String sql = "update tb_question set name=?,content=?,keyword=?,category=? where qid=" + qid;
//            this.pstm = this.con.prepareStatement(sql);
//            this.pstm.setString(1, programQuestion.getName());
//            this.pstm.setString(2, programQuestion.getContent());
//            this.pstm.setString(3, programQuestion.getKeyword());
////            this.pstm.setInt(4, programQuestion.getCategory());
//            int i = this.pstm.executeUpdate();
//            if (i > 0) {
//                return true;
//            }
//            return false;
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            try {
//                if (this.pstm != null) {
//                    this.pstm.close();
//                }
//            } catch (Exception e) {
//            }
//        }
//        return false;
//    }
//
//    // 排行榜
//    public List<RankList> getExResult(int top) {
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
//                es.setName(rs.getString(2));
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
