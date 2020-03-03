package com.example.controller;

import com.example.page.PageInfo;
import com.example.pojo.Video;
import com.example.pojo.VideoDetail;
import com.example.service.VideoService;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

@Controller
@RequestMapping("video")
public class VideoController {
    @Resource
    private VideoService videoServiceImpl;

    @RequestMapping("getAll/{pageNum}/{pageSize}")
    @ResponseBody
    public PageInfo<Video> getAll(@PathVariable("pageNum")int pageNum,@PathVariable("pageSize")int pageSize){
        if (pageNum <= 0){
            pageNum = 1;
        }
        if (pageSize <= 0){
            pageSize = 30;
        }
        PageInfo<Video> pageInfo = new PageInfo<>();
        pageInfo.setPageSize(pageSize);
        pageInfo.setPageNum(pageNum);
        pageInfo.setCount(videoServiceImpl.getCount());
        pageInfo.setList(videoServiceImpl.getAll(pageInfo));
        return pageInfo;
    }

    @RequestMapping("getAllBySelect/{type}/{category}/{location}/{year}/{pageNum}/{pageSize}")
    @ResponseBody
    public PageInfo<Video> getAllBySelect(@PathVariable("type")int type,@PathVariable("category")int category
            ,@PathVariable("location")String location,@PathVariable("year")String year
            ,@PathVariable("pageNum")int pageNum,@PathVariable("pageSize")int pageSize){
        if (pageNum <= 0){
            pageNum = 1;
        }
        if (pageSize <= 0){
            pageSize = 30;
        }
        PageInfo<Video> pageInfo = new PageInfo<>();
        pageInfo.setPageSize(pageSize);
        pageInfo.setPageNum(pageNum);
        pageInfo.setCount(videoServiceImpl.getCountByCondition(type,category,location,year));
        pageInfo.setList(videoServiceImpl.getAllByCondition(type,category,location,year,pageInfo));
        return pageInfo;
    }

    @RequestMapping("/getByName/{name}/{pageNum}/{pageSize}")
    @ResponseBody
    public PageInfo<Video> getByName(@PathVariable("name") String name,@PathVariable("pageNum") int pageNum,@PathVariable("pageSize") int pageSize){
        if (pageNum <= 0){
            pageNum = 1;
        }
        if (pageSize <= 0){
            pageSize = 30;
        }
        PageInfo<Video> pageInfo = new PageInfo<>();
        pageInfo.setPageSize(pageSize);
        pageInfo.setPageNum(pageNum);
        pageInfo.setCount(videoServiceImpl.getCountByName(name));
        pageInfo.setList(videoServiceImpl.getByName(name,pageInfo));
        return pageInfo;
    }
    @RequestMapping("/getByName/{name}")
    @ResponseBody
    public List<Video> getByName(@PathVariable("name") String name){
        return videoServiceImpl.getByName(name);
    }

    @RequestMapping("detail/{id}")
    public String detail(@PathVariable("id")int id, HttpServletRequest request){
        Video video = videoServiceImpl.getById(id);
        List<VideoDetail> episodes =videoServiceImpl.getDetailById(id);
        request.setAttribute("video",video);
        request.setAttribute("episodes",episodes);
        return "video/video_detail";
    }

    @RequestMapping("download")
    public void download(HttpServletRequest request, HttpServletResponse response,String fileName) throws IOException {
        System.out.println(fileName);
        String newName;
        //解决文件名乱码
        String userAgent = request.getHeader("User-Agent");
        if(userAgent.contains("MSIE") || userAgent.contains("Trident") || userAgent.contains("Edge")){//IE
            newName = java.net.URLEncoder.encode(fileName, "UTF-8");
        }else{//非IE
            newName = new String(fileName.getBytes(StandardCharsets.UTF_8),StandardCharsets.ISO_8859_1);
        }
        response.setHeader("Content-Disposition","attachment;filename="+newName);
        response.setCharacterEncoding("utf-8");
        File file = new File(request.getServletContext().getRealPath("file/video/videos/"),fileName);
        response.setHeader("Content-Length", String.valueOf(file.length()));
        OutputStream os = new BufferedOutputStream(response.getOutputStream());
        InputStream is = new BufferedInputStream(new FileInputStream(file));
        byte[] buffer = new byte[1024*1024*5];
        int len = -1;
        while ((len = is.read(buffer)) != -1){
            os.write(buffer,0,len);
        }
        os.flush();
        os.close();
        is.close();
    }

    @RequestMapping("play")
    public String play(Integer id,HttpServletRequest req){
        VideoDetail videoDetail = videoServiceImpl.getDetailByDetailId(id);
        List<VideoDetail> episodes = videoServiceImpl.getDetailById(videoDetail.getPid());
        Video video = videoServiceImpl.getById(videoDetail.getPid());
        req.setAttribute("episodes",episodes);
        req.setAttribute("video",video);
        req.setAttribute("detail",videoDetail);
        return "video/play";
    }
}
