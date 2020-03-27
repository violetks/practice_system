package com.violetks.entity;

public class Student {
    private int sid = 0;
    private String name = "";
    private String password = "";
    private int sex = 0;
    private String grades = "";
    private String classInfo = "";

    public Student() { }

    public int getSid() { return sid; }

    public void setSid(int sid) { this.sid = sid; }

    public String getName() { return name; }

    public void setName(String name) { this.name = name; }

    public String getPassword() { return password; }

    public void setPassword(String password) { this.password = password; }

    public int getSex() { return sex; }

    public void setSex(int sex) { this.sex = sex; }

    public String getGrades() { return grades; }

    public void setGrades(String grades) { this.grades = grades; }

    public String getClassInfo() { return classInfo; }

    public void setClassInfo(String classInfo) { this.classInfo = classInfo; }
}
