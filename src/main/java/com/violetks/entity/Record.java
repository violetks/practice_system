package com.violetks.entity;

import java.util.Date;

public class Record {
    private int id = 0;
    private Student s = null;
    private Question question = null;
    private String name;
    private int result = 1;
    private int category = 0;
    private int level = 0;
    private Date submitTime;
    private int codeLength = 0;

    public Record() { }

    public int getId() { return id; }

    public void setId(int id) { this.id = id; }

    public Student getS() { return s; }

    public void setS(Student s) { this.s = s; }

    public Question getQuestion() { return question; }

    public void setQuestion(Question question) { this.question = question; }

    public String getName() { return name; }

    public void setName(String name) { this.name = name; }

    public int getCategory() { return category; }

    public void setCategory(int category) { this.category = category; }

    public int getLevel() { return level; }

    public void setLevel(int level) { this.level = level; }

    public int getResult() { return result; }

    public void setResult(int result) { this.result = result; }

    public Date getSubmitTime() { return submitTime; }

    public void setSubmitTime(Date submitTime) { this.submitTime = submitTime; }

    public int getCodeLength() { return codeLength; }

    public void setCodeLength(int codeLength) { this.codeLength = codeLength; }
}
