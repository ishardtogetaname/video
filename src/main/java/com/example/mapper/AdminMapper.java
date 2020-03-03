package com.example.mapper;

import com.example.pojo.Admin;
import org.apache.ibatis.annotations.Select;

public interface AdminMapper {

    @Select("select * from admins where name = #{param1}")
    Admin selByName(String name);

    @Select("select * from admins where name = #{param1} and password = #{param2}")
    Admin selByNameAndPassword(String name, String password);
}