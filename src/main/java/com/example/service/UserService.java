package com.example.service;

import com.example.pojo.User;
import com.example.pojo.Video;

import java.util.List;

public interface UserService {
    User getUserByNameAndPwd(String name,String password);
    User getUserByName(String name);
    int insert(User user);
    int insertCollection(int uid,int vid);
    int delCollection(int uid,int vid);
    List<Video> getCollection(int uid);
    int updImgById(int uid,String src);

    int updByUser(User user);

    List<User> getAll(int start,int limit);
    int getCount();

    List<User> getByCondition(User user,int start,int limit);
    int getCountByCondition(User user);

    User getUserById(int id);

    int delById(int id);
}
