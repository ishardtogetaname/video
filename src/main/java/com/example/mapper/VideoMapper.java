package com.example.mapper;

import com.example.pojo.Category;
import com.example.pojo.Video;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface VideoMapper {
    @Select("select * from videos")
    List<Video> selectAllVideos();

    @Select("select * from videos limit #{param1},#{param2}")
    List<Video> selectAll(int start,int pageSize);
    @Select("select count(*) from videos")
    int selectCount();


    Video selectById(int id);
    List<Category> selectCategoryByVideoId(int id);

    List<Video> selectAllByCondition(int type, int category, String location, Integer year,int start,int pageSize,Integer pre,Integer last);
    int selectCountByCondition(int type, int category, String location, Integer year,Integer pre,Integer last);

    @Select("select * from videos where name like concat('%',#{param1},'%')")
    List<Video> selectByName(String name);
    @Select("select * from videos where name like concat('%',#{param1},'%') limit #{param2},#{param3}")
    List<Video> selectByNameAndPage(String name,int start,int pageSize);
    @Select("select count(*) from videos where name like concat('%',#{param1},'%')")
    int selectCountByName(String name);

    Video findVideoWithCatrgory(int id);
    List<Category> findCategoryWithVideo(int id);

    List<Video> findVideoAndCategory();

    List<Video> findVideoAndCategoryByCondition(Video video, Integer year,Integer pre,Integer last);


    void insVideo(@Param("name") String name,@Param("totalEpisode") Integer totalEpisode,@Param("currentEpisode") Integer currentEpisode, @Param("type") Integer type, @Param("starring") String starring
            , @Param("year") Integer year, @Param("location") String location
            , @Param("statue") Integer statue, @Param("imgPath") String imgPath
            ,@Param("description")String description);

    @Select("select id from videos where name = #{name}")
    int selectIdByName(String name);

    int updVideo(String name, Integer totalEpisode, Integer currentEpisode, Integer type2, String starring, Integer year, String location, Integer statue, String imgPath, String description,int id);

    @Delete("delete v,vc,uc,history from videos v " +
            "left join video_category vc on v.id = vc.video_id " +
            "left join user_collection uc on v.id = uc.vid " +
            "left join history on v.id = history.vid " +
            "where v.id = #{id}")
    int del(Integer id);
}