package com.violetks.entity;

import java.util.Date;

public class Question {
    private int qid = 0;
    private int category = 0;
    private String name = "";
    private String content = "";
    private String keyword = "";
    private Date addtime;

    public Question() { }

    public int getQid() { return qid; }

    public void setQid(int qid) { this.qid = qid; }

    public int getCategory() { return category; }

    public void setCategory(int category) { this.category = category; }

    public String getName() { return name; }

    public void setName(String name) { this.name = name; }

    public String getContent() { return content; }

    public void setContent(String content) { this.content = content; }

    public String getKeyword() { return keyword; }

    public void setKeyword(String keyword) { this.keyword = keyword; }

    public Date getAddtime() { return addtime; }

    public void setAddtime(Date addtime) { this.addtime = addtime; }
}
