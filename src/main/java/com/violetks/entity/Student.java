package com.violetks.entity;

public class Student {
    private int sid = 0;
    private String sName = "";
    private String sPwd = "";
    private int sSex = 0;
    private String sGrade = "";
    private String sClass = "";
    private String sDept = "";

    public Student() { }

    public int getSid() { return sid; }

    public void setSid(int sid) { this.sid = sid; }

    public String getsName() { return sName; }

    public void setsName(String sName) { this.sName = sName; }

    public String getsPwd() { return sPwd; }

    public void setsPwd(String sPwd) { this.sPwd = sPwd; }

    public int getsSex() { return sSex; }

    public void setsSex(int sSex) { this.sSex = sSex; }

    public String getsGrade() { return sGrade; }

    public void setsGrade(String sGrade) { this.sGrade = sGrade; }

    public String getsClass() { return sClass; }

    public void setsClass(String sClass) { this.sClass = sClass; }

    public String getsDept() { return sDept; }

    public void setsDept(String sDept) { this.sDept = sDept; }
}
