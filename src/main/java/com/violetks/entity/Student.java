package com.violetks.entity;

public class Student {
    private int sid = 0;
    private String name = "";
    private String password = "";
    private String grades = "";
    private String gender = "";
    private String department = "";
    private int tel = 0;
    private String pic = "";
    private String teacher = "";

    public Student() { }

    public int getSid() { return sid; }

    public void setSid(int sid) { this.sid = sid; }

    public String getName() { return name; }

    public void setName(String name) { this.name = name; }

    public String getPassword() { return password; }

    public void setPassword(String password) { this.password = password; }

    public String getGrades() { return grades; }

    public void setGrades(String grades) { this.grades = grades; }

    public String getGender() { return gender; }

    public void setGender(String gender) { this.gender = gender; }

    public String getDepartment() { return department; }

    public void setDepartment(String department) { this.department = department; }

    public int getTel() { return tel; }

    public void setTel(int tel) { this.tel = tel; }

    public String getPic() { return pic; }

    public void setPic(String pic) { this.pic = pic; }

    public String getTeacher() { return teacher; }

    public void setTeacher(String teacher) { this.teacher = teacher; }
}
