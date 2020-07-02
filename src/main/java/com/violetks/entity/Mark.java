package com.violetks.entity;

import java.util.Date;

/**
 * 教师批改记录
 */
public class Mark {
    private int id = 0;
    private int tid = 0;          // 阅卷人
    private int sid = 0;
    private int qid = 0;
    private int tScore = 0;       // 满分
    private int sScore = 0;       // 得分
    private int tResult = 0;      // 批改结果，0-未批改；1-已批改
    private Date viewTime;        // 批阅时间

    public Mark() { }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTid() {
        return tid;
    }

    public void setTid(int tid) {
        this.tid = tid;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public int getQid() {
        return qid;
    }

    public void setQid(int qid) {
        this.qid = qid;
    }

    public int gettScore() {
        return tScore;
    }

    public void settScore(int tScore) {
        this.tScore = tScore;
    }

    public int getsScore() {
        return sScore;
    }

    public void setsScore(int sScore) {
        this.sScore = sScore;
    }

    public int gettResult() {
        return tResult;
    }

    public void settResult(int tResult) {
        this.tResult = tResult;
    }

    public Date getViewTime() {
        return viewTime;
    }

    public void setViewTime(Date viewTime) {
        this.viewTime = viewTime;
    }
}
