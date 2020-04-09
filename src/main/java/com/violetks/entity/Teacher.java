package com.violetks.entity;

public class Teacher {
    private int tid = 0;
    private String tName = "";
    private String tPwd = "";
    private String tPhone = "";
    private String tDept = "";

    public Teacher() { }

    public int getTid() { return tid; }

    public void setTid(int tid) { this.tid = tid; }

    public String gettName() { return tName; }

    public void settName(String tName) { this.tName = tName; }

    public String gettPwd() { return tPwd; }

    public void settPwd(String tPwd) { this.tPwd = tPwd; }

    public String gettPhone() { return tPhone; }

    public void settPhone(String tPhone) { this.tPhone = tPhone; }

    public String gettDept() { return tDept; }

    public void settDept(String tDept) { this.tDept = tDept; }
}
