package com.example.pojo;

import java.util.Date;

public class History {
    private Integer id;

    private Integer vid;

    private Integer uid;

    private String name;

    private Date time;

    private String img;

    private String title;

    private Integer episode;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getVid() {
        return vid;
    }

    public void setVid(Integer vid) {
        this.vid = vid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img == null ? null : img.trim();
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

    @Override
    public String toString() {
        return "History{" +
                "id=" + id +
                ", vid=" + vid +
                ", uid=" + uid +
                ", name='" + name + '\'' +
                ", time=" + time +
                ", img='" + img + '\'' +
                ", title='" + title + '\'' +
                ", episode=" + episode +
                '}';
    }
}