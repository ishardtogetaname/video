package com.example.service.impl;

import com.example.mapper.UserCollectionMapper;
import com.example.mapper.UserMapper;
import com.example.pojo.User;
import com.example.pojo.Video;
import com.example.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper userMapper;


    public User getUserByNameAndPwd(String name,String password){
        return userMapper.selectByNameAndPwd(name,password);
    }
    public User getUserByName(String name){
        return userMapper.selectByName(name);
    }

    @Override
    public int insert(User user) {
        return userMapper.insert(user);
    }

    @Override
    public int insertCollection(int uid, int vid) {
        return userMapper.insCollection(uid,vid);
    }

    @Override
    public int delCollection(int uid, int vid) {
        return userMapper.delCollection(uid,vid);
    }

    @Override
    public List<Video> getCollection(int uid) {
        return userMapper.findCollectionWithUid(uid);
    }

    @Override
    public int updImgById(int uid,String src) {
        return userMapper.updImgById(uid,src);
    }

    @Override
    public int updByUser(User user) {
        return userMapper.updByUser(user);
    }

    @Override
    public List<User> getAll(int start,int limit) {
        return userMapper.selectAll(start,limit);
    }

    @Override
    public int getCount() {
        return userMapper.selectCount();
    }

    @Override
    public List<User> getByCondition(User user, int start, int limit) {
        return userMapper.selectByCondition(user,start,limit);
    }

    @Override
    public int getCountByCondition(User user) {
        return userMapper.selectCountByCondition(user);
    }

    @Override
    public User getUserById(int id) {
        return userMapper.selectById(id);
    }

    @Override
    public int delById(int id) {
        return userMapper.delById(id);
    }


}
