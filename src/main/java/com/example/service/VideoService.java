package com.example.service;

import com.example.page.PageInfo;
import com.example.pojo.Video;
import com.example.pojo.VideoDetail;

import java.util.Date;
import java.util.List;

public interface VideoService {

    /*根据id获取视频*/
    Video getById(int id);

    /*查询视频的总数*/
    int getCount();

    /*根据视频名称查询视频*/
    List<Video> getByName(String name);

    /*根据视频名称查询视频并分页*/
    List<Video> getByName(String name,PageInfo pageInfo);


    List<Video> getAllVideos();

    List<Video> getAllVideosByCondition(Video video,String year);

    /*获取所有的视频*/
    List<Video> getAll(PageInfo<Video> pageInfo);

    int getCountByName(String name);

    /*获取符合条件的视频总数*/
    int getCountByCondition(int type, int category, String location, String year);

    /*获取所有符合条件的视频*/
    List<Video> getAllByCondition(int type, int category, String location, String year, PageInfo<Video> pageInfo);

    /*根据id查询视频及其分类信息*/
    Video getVideoWithCategory(int id);

    /*根据视频id获取分集信息*/
    List<VideoDetail> getDetailById(int id);

    /*根据分集id获取分集信息*/
    VideoDetail getDetailByDetailId(int id);

    /*插入视频数据*/
    void insVideo(String name,Integer totalEpisode,Integer currentEpisode,String imgPath, Integer type2, List<Integer> category, String starring, Integer year, String location, Integer statue,String description);

    /*修改视频数据*/
    int updVideo(int id,String name,Integer totalEpisode,Integer currentEpisode,String imgPath, Integer type2, List<Integer> category, String starring, Integer year, String location, Integer statue,String description);

    /*插入分集信息*/
    int insVideoDetail(int id,String title,int episode);

    /*修改分集的信息*/
    int updDetailById(VideoDetail detail);

    /*删除视频*/
    int delAll(Integer id);

    /*删除视频分集信息*/
    void delDetail(Integer id);

    int delDetailByDetailId(Integer id);
}
