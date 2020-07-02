package com.violetks.entity;

import java.util.Date;

public class Question {
    private int qid = 0;
    private int qType = 0;       // 试题类型，0-单选，1-多选，2-填空，3-判断，4-编程，5-简答
    private int qLevel = 0;      // 难度等级，0-较易，1-容易，2-难，3-较难
    private String qName = "";   // 试题名
    private String qContent = "";// 试题内容
    private String qKeyword = "";// 关键字
    private String qAnswer = ""; // 试题答案
    private int tScore = 0;      // 题目满分
    private Date addTime;        // 创建时间

    public Question() { }

    public int getQid() { return qid; }

    public void setQid(int qid) { this.qid = qid; }

    public int getqType() { return qType; }

    public void setqType(int qType) { this.qType = qType; }

    public int getqLevel() { return qLevel; }

    public void setqLevel(int qLevel) { this.qLevel = qLevel; }

    public String getqName() { return qName; }

    public void setqName(String qName) { this.qName = qName; }

    public String getqContent() { return qContent; }

    public void setqContent(String qContent) { this.qContent = qContent; }

    public String getqKeyword() { return qKeyword; }

    public void setqKeyword(String qKeyword) { this.qKeyword = qKeyword; }

    public String getqAnswer() { return qAnswer; }

    public void setqAnswer(String qAnswer) { this.qAnswer = qAnswer; }

    public int gettScore() { return tScore; }

    public void settScore(int tScore) { this.tScore = tScore; }

    public Date getAddTime() { return addTime; }

    public void setAddTime(Date addTime) { this.addTime = addTime; }
}
