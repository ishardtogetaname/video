<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>后台管理</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="static/plugins/layui/css/layui.css"  media="all">
    <script src="static/plugins/layui/layui.js"></script>
    <script src="static/plugins/jquery/jquery.js"></script>
    <style type="text/css">
        .title{line-height: 60px;color: #d0cbc1;margin-left: 20px;}
        .detail-div{box-sizing: border-box; width: 50%; margin: 50px auto;background: #f9f9f9; border: #fff9ec 1px solid;border-radius: 5px;}
        .avatar-div{height: 70px;background: #e3e3e3;border-top-right-radius: 5px;border-top-left-radius: 5px;}
        .avatar-img{border-radius: 100%;height: 50px;width: 70px;margin: 10px 20px;}
        .info-div{margin: 30px 0;}
        .info-div div{height: 40px;}
        span:nth-child(1){font-size: 15px;vertical-align: middle; display: inline-block;font-weight: 600; margin-right: 20px; width: 100px;height:30px;line-height: 30px; text-align: right;}
        span:nth-child(2){font-size: 15px;display: inline-block;vertical-align: middle; width: 100px;height:30px;line-height: 30px; }
    </style>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">视频后台管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <a class="layui-layout-left title" style="">
            用户信息详情
        </a>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <c:if test="${sessionScope.admin == null}">
                        <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                        未登录
                    </c:if>
                    <c:if test="${sessionScope.admin != null}">
                        <img src="${sessionScope.admin.img}" class="layui-nav-img">
                        ${sessionScope.admin.name}
                    </c:if>
                </a>
            </li>
            <li class="layui-nav-item"><a href="">注销</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">用户管理</a>
                    <dl class="layui-nav-child">
                        <dd class="layui-this"><a href="javascript:;">用户列表</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">视频管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">视频列表</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">视频分类管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="manager/category/list">视频分类列表</a></dd>
                        <dd><a href="manager/category/add">添加分类</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->

        <div class="detail-div">
            <div class="avatar-div">
                <img class="avatar-img" src="${user.img}" alt="头像" title="头像">
            </div>
            <div class="info-div">
                <div>
                    <span>用户名：</span>
                    <span>${user.username}</span>
                </div>
                <div>
                    <span>密 码：</span>
                    <span>${user.password}</span>
                </div>
                <div>
                    <span>手机号：</span>
                    <span>${user.phone}</span>
                </div>
                <div>
                    <span>年 龄：</span>
                    <span>${user.age}</span>
                </div>
                <div>
                    <span>生 日：</span>
                    <span>${user.birthday}</span>
                </div>
                <div>
                    <span>性 别：</span>
                    <span>${user.sex}</span>
                </div>

                <div style="width: 100%;text-align: center;margin-top: 10px;">
                    <a style="margin: 0 auto;display: inline-block; height: 30px;line-height: 30px; color: #fff; text-align: center; width: 50px;background: #4EBBF9;" href="jsp/manager/userlist.jsp">返回</a>
                </div>
            </div>
        </div>
    </div>

</div>


</body>
</html>
