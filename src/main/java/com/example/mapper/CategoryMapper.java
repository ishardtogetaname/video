package com.example.mapper;

import com.example.pojo.Category;
import com.example.pojo.VideoCategory;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface CategoryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Category record);

    int insertSelective(Category record);

    Category selectByPrimaryKey(Integer id);

    List<Category> selectAll();

    List<Category> selectByPid(int pid);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);

    @Select("select category_name from category where id = #{id}")
    String getNameById(int id);

    @Insert("insert into video_category values(#{param1},#{param2})")
    void insCategory(int vid,int cid);

    @Update("update video_category set category_id = #{param2} where video_id = #{param1}")
    void updCategory(int vid, Integer integer);
    @Delete("delete from video_category where video_id = #{param1}")
    void delCategory(int vid);

    @Select("select * from category limit #{param1},#{param2}")
    List<Category> selByLimit(Integer start, Integer limit);

    @Select("select count(*) from category")
    int selCount();

    List<Category> selByNameWithLimit(String name,Integer pid, int start, Integer limit);


    int selCountByName(String name,Integer pid);

    @Delete("delete from category where id = #{id}")
    int delById(Integer id);

    @Insert("insert into category values(default,#{param1},#{param2})")
    int addCategory(String name, Integer pid);
}