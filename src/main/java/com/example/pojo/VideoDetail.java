package com.example.pojo;

import java.util.Date;

public class VideoDetail {
    private Integer id;

    private String title;

    private Integer episode;

    private String fileName;

    private int pid;

    private Date publishDate;

    private Date uploadDate;

    public Date getUploadDate() {
        return uploadDate;
    }

    public void setUploadDate(Date uploadDate) {
        this.uploadDate = uploadDate;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Integer getEpisode() {
        return episode;
    }

    public void setEpisode(Integer episode) {
        this.episode = episode;
    }

    public Date getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

    @Override
    public String toString() {
        return "VideoDetail{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", episode=" + episode +
                ", fileName='" + fileName + '\'' +
                ", pid=" + pid +
                ", publishDate=" + publishDate +
                ", uploadDate=" + uploadDate +
                '}';
    }
}