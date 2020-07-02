package com.violetks.entity;

import java.util.Date;

/**
 * 学生练习记录
 */
public class Record {
    private int id = 0;
    private int sid = 0;
    private int qid = 0;
    private String sAnswer = "";      // 学生代码运行结果
    private int sRate = 0;            // 代码通过率
    private int sResult = 0;          // 练习结果，0-未解决；1-已解决
    private Date submitTime;          // 提交时间
    private Question question = null; // 查询个人练习记录时关联tb_question表

    public Record() { }

    public int getId() { return id; }

    public void setId(int id) { this.id = id; }

    public int getSid() { return sid; }

    public void setSid(int sid) { this.sid = sid; }

    public int getQid() { return qid; }

    public void setQid(int qid) { this.qid = qid; }

    public String getsAnswer() {
        return sAnswer;
    }

    public void setsAnswer(String sAnswer) {
        this.sAnswer = sAnswer;
    }

    public int getsRate() { return sRate; }

    public void setsRate(int sRate) {
        this.sRate = sRate;
    }

    public int getsResult() {
        return sResult;
    }

    public void setsResult(int sResult) {
        this.sResult = sResult;
    }

    public Date getSubmitTime() {
        return submitTime;
    }

    public void setSubmitTime(Date submitTime) {
        this.submitTime = submitTime;
    }

    public Question getQuestion() { return question; }

    public void setQuestion(Question question) { this.question = question; }
}
