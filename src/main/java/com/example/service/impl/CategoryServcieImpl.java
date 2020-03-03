package com.example.service.impl;

import com.example.mapper.CategoryMapper;
import com.example.pojo.Category;
import com.example.service.CategoryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class CategoryServcieImpl implements CategoryService {
    @Resource
    private CategoryMapper categoryMapper;

    @Override
    public List<Category> selByPid(int pid) {
        return categoryMapper.selectByPid(pid);
    }

    @Override
    public List<Category> selAll() {
        return categoryMapper.selectAll();
    }

    @Override
    public List<Category> selByLimit(Integer page, Integer limit) {
        int start = (page-1)*limit;
        return categoryMapper.selByLimit(start,limit);
    }

    @Override
    public int selCount() {
        return categoryMapper.selCount();
    }

    @Override
    public List<Category> selByNameWithLimit(String name,Integer pid, Integer page, Integer limit) {
        int start = (page-1)*limit;
        return categoryMapper.selByNameWithLimit(name,pid,start,limit);
    }

    @Override
    public int selCountByName(String name,Integer pid) {
        return categoryMapper.selCountByName(name,pid);
    }

    @Override
    public int delById(Integer id) {
        return categoryMapper.delById(id);
    }

    @Override
    public int insCategory(String name, Integer pid) {
        return categoryMapper.addCategory(name,pid);
    }
}
