package com.violetks.entity;

import java.util.Date;

public class Record {
    private int id = 0;
    private int sid = 0;
    private int qid = 0;
    private String cAnswer = "";    // 标准答案
    private String sAnswer = "";    // 学生代码运行结果
//    private String sCode = "";      // 学生提交代码
    private int sRate = 0;           // 代码通过率
    private int tScore = 0;         // 满分
    private int sScore = 0;         // 得分
    private int tid = 0;            // 阅卷人
    private int sResult = 0;        // 练习结果，0-未解决；1-已解决
    private Date submitTime;        // 提交时间
//    private Student s = null;
//    private Question question = null;
//    private String name;
//    private int result = 1;
//    private int category = 0;
//    private int level = 0;
//    private int codeLength = 0;

    public Record() { }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getcAnswer() {
        return cAnswer;
    }

    public void setcAnswer(String cAnswer) {
        this.cAnswer = cAnswer;
    }

    public String getsAnswer() {
        return sAnswer;
    }

    public void setsAnswer(String sAnswer) {
        this.sAnswer = sAnswer;
    }

//    public String getsCode() {
//        return sCode;
//    }
//
//    public void setsCode(String sCode) {
//        this.sCode = sCode;
//    }

    public int getsRate() {
        return sRate;
    }

    public void setsRate(int sRate) {
        this.sRate = sRate;
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

    public int getTid() {
        return tid;
    }

    public void setTid(int tid) {
        this.tid = tid;
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
}
