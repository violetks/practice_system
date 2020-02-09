package com.violetks.entity;

import java.util.Date;

public class Record {
    private int id = 0;
    private Student s = null;
    private Question q = null;
    private String name;
    private int category = 0;
    private int result = 1;
    private Date submitTime;
    private int codeLength = 0;

    public Record() { }

    public int getId() { return id; }

    public void setId(int id) { this.id = id; }

    public Student getS() { return s; }

    public void setS(Student s) { this.s = s; }

    public Question getQ() { return q; }

    public void setQ(Question q) { this.q = q; }

    public String getName() { return name; }

    public void setName(String name) { this.name = name; }

    public int getCategory() { return category; }

    public void setCategory(int category) { this.category = category; }

    public int getResult() { return result; }

    public void setResult(int result) { this.result = result; }

    public Date getSubmitTime() { return submitTime; }

    public void setSubmitTime(Date submitTime) { this.submitTime = submitTime; }

    public int getCodeLength() { return codeLength; }

    public void setCodeLength(int codeLength) { this.codeLength = codeLength; }
}
