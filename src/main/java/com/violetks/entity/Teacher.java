package com.violetks.entity;

public class Teacher {
    private int tid = 0;
    private String name = "";
    private String phone = "";
    private String password = "";

    public Teacher() { }

    public int getTid() { return tid; }

    public void setTid(int tid) { this.tid = tid; }

    public String getName() { return name; }

    public void setName(String name) { this.name = name; }

    public String getPhone() { return phone; }

    public void setPhone(String phone) { this.phone = phone; }

    public String getPassword() { return password; }

    public void setPassword(String password) { this.password = password; }
}
