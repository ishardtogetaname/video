package com.example.service;

import com.example.pojo.Category;

import java.util.List;

public interface CategoryService {
    List<Category> selByPid(int pid);

    List<Category> selAll();

    List<Category> selByLimit(Integer page, Integer limit);

    int selCount();

    List<Category> selByNameWithLimit(String name,Integer pid, Integer page, Integer limit);

    int selCountByName(String name,Integer pid);

    int delById(Integer id);

    int insCategory(String name, Integer pid);
}
