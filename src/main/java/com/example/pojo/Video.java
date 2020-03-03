package com.example.pojo;

import java.util.Date;
import java.util.List;

public class Video {
    private Integer id;

    private String name;

    private Integer currentEpisode;

    private Integer totalEpisode;

    private String imgSrc;

    private String starring;

    private String description;

    private Integer type;

    private Integer category;

    private List<Category> categoryList;

    private String typeName;

    private String location;

    private Date publishDate;

    private Boolean finished;

    private List<VideoDetail> list;

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public List<VideoDetail> getList() {
        return list;
    }

    public void setList(List<VideoDetail> list) {
        this.list = list;
    }

    public List<Category> getCategoryList() {
        return categoryList;
    }

    public void setCategoryList(List<Category> categoryList) {
        this.categoryList = categoryList;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getCurrentEpisode() {
        return currentEpisode;
    }

    public void setCurrentEpisode(Integer currentEpisode) {
        this.currentEpisode = currentEpisode;
    }

    public Integer getTotalEpisode() {
        return totalEpisode;
    }

    public void setTotalEpisode(Integer totalEpisode) {
        this.totalEpisode = totalEpisode;
    }

    public String getImgSrc() {
        return imgSrc;
    }

    public void setImgSrc(String imgSrc) {
        this.imgSrc = imgSrc == null ? null : imgSrc.trim();
    }

    public String getStarring() {
        return starring;
    }

    public void setStarring(String starring) {
        this.starring = starring == null ? null : starring.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getCategory() {
        return category;
    }

    public void setCategory(Integer category) {
        this.category = category;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location == null ? null : location.trim();
    }

    public Date getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

    public Boolean getFinished() {
        return finished;
    }

    public void setFinished(Boolean finished) {
        this.finished = finished;
    }

    @Override
    public String toString() {
        return "Video{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", currentEpisode=" + currentEpisode +
                ", totalEpisode=" + totalEpisode +
                ", imgSrc='" + imgSrc + '\'' +
                ", starring='" + starring + '\'' +
                ", description='" + description + '\'' +
                ", type=" + type +
                ", category=" + category +
                ", categoryList=" + categoryList +
                ", typeName='" + typeName + '\'' +
                ", location='" + location + '\'' +
                ", publishDate=" + publishDate +
                ", finished=" + finished +
                ", list=" + list +
                '}';
    }
}