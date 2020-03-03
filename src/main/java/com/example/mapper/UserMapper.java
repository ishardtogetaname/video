package com.example.mapper;

import com.example.pojo.User;
import com.example.pojo.Video;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface UserMapper {
    User selectByNameAndPwd(String username,String password);
    User selectByName(String username);
    List<User> selectAll(int start,int limit);
    int selectCount();
    int insert(User user);


    List<User> selectByCondition(User user,int start,int limit);
    int selectCountByCondition(User user);


    int insCollection(int uid,int vid);
    int delCollection(int uid,int vid);
    List<Video> findCollectionWithUid(int uid);


    User selectUserWithCollectionById(int id);

    int updImgById(int id,String img);

    int updByUser(User user);

    @Select("select * from user where id = #{param1}")
    User selectById(int id);

    @Delete("delete from user where id = #{param1}")
    int delById(int id);
}
