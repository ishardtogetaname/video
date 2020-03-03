package com.example.controller;

import com.alibaba.fastjson.JSONObject;
import com.example.pojo.History;
import com.example.pojo.User;
import com.example.pojo.Video;
import com.example.service.HistoryService;
import com.example.service.UserService;
import com.example.service.impl.HistoryServiceImpl;
import com.example.utils.CodeImageUtil;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sound.midi.Soundbank;
import java.awt.image.BufferedImage;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("user")
public class UserController {

    @Resource
    private UserService userServiceImpl;

    @Resource
    private HistoryService historyServiceImpl;

    @RequestMapping(value = "getAll",produces="text/html;charset=utf-8")
    @ResponseBody
    public String getAll(int page,int limit){
        int start = (page-1)*limit;
        List<User> userList = userServiceImpl.getAll(start, limit);
        int count = userServiceImpl.getCount();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code",0);
        jsonObject.put("count",count);
        jsonObject.put("data",userList);
        return jsonObject.toString();
    }

    @RequestMapping("getCode")
    public void getCode(HttpServletResponse response, HttpSession session) throws IOException {
        Object[] objs = CodeImageUtil.createImage();
        String code = (String) objs[0];
        BufferedImage image = (BufferedImage) objs[1];

        OutputStream os = response.getOutputStream();
        ImageIO.write(image,"png",os);

        session.setAttribute("code",code);
    }

    @RequestMapping(value = "login/{username}/{password}/{code}",produces = "text/html;charset=UTF-8;")
    @ResponseBody
    public String login(@PathVariable("username") String username,@PathVariable("password") String password
            ,@PathVariable("code") String code,HttpSession session) throws UnsupportedEncodingException {

        String sessionCode = (String) session.getAttribute("code");
        User userByNameAndPwd = userServiceImpl.getUserByNameAndPwd(username,password);
        User userByName = userServiceImpl.getUserByName(username);

        System.out.println(sessionCode);

        if(userByName == null){
            return "用户名不存在";
        }else if (userByNameAndPwd == null){
            return "密码错误";
        }else{
            if(!sessionCode.toLowerCase().equals(code)) {
                return "验证码输入错误";
            }
            session.setAttribute("user",userByNameAndPwd);
            return "success";
        }
    }

    @RequestMapping("logout")
    public void logout(HttpSession session){
        User user = (User) session.getAttribute("user");
        if (user !=null){
            session.removeAttribute("user");
            System.out.println(user.getUsername() + "logout");
        }
    }

    @RequestMapping("imageUpload")
    @ResponseBody
    public String imageUpload(MultipartFile file, HttpServletRequest request,HttpSession session){
        String fileName = file.getOriginalFilename();
        String suffix = null;
        if (fileName != null) {
            suffix = fileName.substring(fileName.lastIndexOf("."));
        }
        String src = request.getServletContext().getRealPath("file/user/avatar/");
        UUID uuid = UUID.randomUUID();
        File dest = new File(src+"/"+uuid+suffix);
        String imgPath = "file/user/avatar/" +uuid+suffix;
        JSONObject jsonObject = new JSONObject();
        try {
            FileUtils.copyInputStreamToFile(file.getInputStream(),dest);
            jsonObject.put("src",imgPath);
            jsonObject.put("code",1);
            jsonObject.put("fileName",uuid+suffix);
            return jsonObject.toString();
        } catch (IOException e) {
            System.out.println("图片上传失败");
            jsonObject.put("code",0);
            return jsonObject.toString();
        }
    }

    @RequestMapping(value = "imageUpdate",produces="text/html;charset=utf-8")
    @ResponseBody
    public String imageUpdate(MultipartFile file,HttpSession session,HttpServletRequest request){
        User user = (User) session.getAttribute("user");
        JSONObject jsonObject = new JSONObject();
        File oldFile = new File(request.getServletContext().getRealPath(user.getImg()));
        System.out.println(oldFile);
        if (oldFile.exists()){
            if (oldFile.delete()){
                System.out.println("删除成功");
            }
        }
        String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
        String fileName = user.getUsername()+ "-" + new Date().getTime()+suffix;
        String src = request.getServletContext().getRealPath("file/user/avatar/" + fileName);
        try {
            FileUtils.copyInputStreamToFile(file.getInputStream(),new File(src));
            userServiceImpl.updImgById(user.getId(),"file/user/avatar/" + fileName);
            user.setImg("file/user/avatar/" + fileName);
            session.setAttribute("user",user);
            jsonObject.put("src","file/user/avatar/" + fileName);
            jsonObject.put("code",1);
        } catch (IOException e) {
            System.out.println("图片上传失败");
            jsonObject.put("code",0);
            return jsonObject.toString();
        }
        return jsonObject.toString();
    }

    @RequestMapping("update")
    public String update(User user,HttpSession session,HttpServletRequest req){
        System.out.println(user);
        userServiceImpl.updByUser(user);
        User oldUser = (User) session.getAttribute("user");
        user.setImg(oldUser.getImg());
        session.setAttribute("user",user);
        List<Video> collections = userServiceImpl.getCollection(user.getId());
        req.setAttribute("collections",collections);
        return "/user/home";
    }

    @RequestMapping("register")
    public String register(User user,HttpServletRequest request){
        try {
            userServiceImpl.insert(user);
        }catch (Exception e){
            e.printStackTrace();
            if (!user.getImg().equals("") ){
                File img = new File(request.getServletContext().getRealPath(user.getImg()));
                img.delete();
            }
        }
        return "redirect:/index.jsp";
    }

    @RequestMapping("collection/add")
    @ResponseBody
    public void addCollection(HttpSession session,int vid){
        User u = (User) session.getAttribute("user");
        userServiceImpl.insertCollection(u.getId(),vid);
    }

    @RequestMapping("collection/del")
    @ResponseBody
    public void delCollection(HttpSession session,int vid){
        User u = (User) session.getAttribute("user");
        userServiceImpl.delCollection(u.getId(),vid);
    }

    @RequestMapping("collection/get")
    @ResponseBody
    public List<Video> getCollections(Integer uid){
        return userServiceImpl.getCollection(uid);
    }

    @RequestMapping("home")
    public String home(int id,HttpServletRequest req){
        List<Video> collections = userServiceImpl.getCollection(id);
        List<History> histories = historyServiceImpl.selHistoryByUid(id);
        req.setAttribute("collections",collections);
        req.setAttribute("histories",histories);
        return "user/home";
    }

    @RequestMapping("addHistory")
    @ResponseBody
    public void addHistory(History history){
        history.setTime(new Date());
        History oldHistory = historyServiceImpl.selHistoryByName(history.getUid(),history.getName());
        if(oldHistory == null){
            historyServiceImpl.insHistory(history);
        }else{
            historyServiceImpl.updHistory(history);
        }
    }

}
