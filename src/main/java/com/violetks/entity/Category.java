package com.violetks.entity;

public class Category {
    private int cid;
    private String categoryName;
    private int categoryValue;

    public Category() { }

    public int getCid() { return cid; }

    public void setCid(int cid) { this.cid = cid; }

    public String getCategoryName() { return categoryName; }

    public void setCategoryName(String categoryName) { this.categoryName = categoryName; }

    public int getCategoryValue() { return categoryValue; }

    public void setCategoryValue(int categoryValue) { this.categoryValue = categoryValue; }
}
