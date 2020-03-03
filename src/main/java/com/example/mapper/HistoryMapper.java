package com.example.mapper;

import com.example.pojo.History;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface HistoryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(History record);

    int insertSelective(History record);

    History selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(History record);

    int updateByPrimaryKey(History record);

    @Select("select * from history where uid = #{param1} and name = #{param2}")
    History getByVideoName(int uid, String videoName);

    @Select("select * from history where uid = #{param1} group by time DESC")
    List<History> getByUid(int uid);
}