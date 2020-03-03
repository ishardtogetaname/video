package com.example.mapper;

import com.example.pojo.VideoDetail;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.Date;
import java.util.List;

public interface VideoDetailMapper {
    @Select("select * from video_detail where pid = #{id}")
    List<VideoDetail> getByVideoId(int id);
    @Select("select * from video_detail where id = #{id}")
    VideoDetail getById(int id);

    @Insert("insert into video_detail(title,episode,pid) values(#{param2},#{param3},#{param1})")
    int insVideoDetail(int id, String title, int episode);

    int updByDetail(VideoDetail detail);

    @Delete("delete from video_detail where pid = #{param1}")
    void del(Integer id);

    @Delete("delete from video_detail where id = #{param1}")
    int delByDetailId(Integer id);
}