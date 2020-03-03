package com.example.service.impl;

import com.example.mapper.AdminMapper;
import com.example.pojo.Admin;
import com.example.service.ManagerService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class ManagerServiceImpl implements ManagerService {

    @Resource
    AdminMapper adminMapper;

    @Override
    public Admin selByName(String name) {
        return adminMapper.selByName(name);
    }

    @Override
    public Admin selByNameAndPassword(String name, String password) {
        return adminMapper.selByNameAndPassword(name,password);
    }
}
