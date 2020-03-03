package com.example.pojo;

public class Category {
    private Integer id;

    private String categoryName;

    private Integer pid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName == null ? null : categoryName.trim();
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    @Override
    public String toString() {
        return "{" +
                "id:" + id +
                ", categoryName:'" + categoryName + '\'' +
                ", pid:" + pid +
                '}';
    }
}