<%@ page import="com.example.pojo.Video" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>视频列表</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="static/plugins/layui/css/layui.css"  media="all">
    <script src="static/plugins/layui/layui.js"></script>
    <script src="static/plugins/jquery/jquery.js"></script>
    <style type="text/css">
        .layui-layout-admin .layui-body {bottom:0}
        .layui-layout-admin .layui-side .layui-nav .layui-nav-item > a {padding-top: 8px;padding-bottom: 8px;cursor: pointer;}

        .title{line-height: 60px;color: #d0cbc1;margin-left: 20px;}
        .searchDiv{padding-bottom: 10px; background: #e0e0e0;font-size: 20px;color: #696969;line-height: 50px;border-radius: 5px;}
        .searchDiv span{margin-left:10px;}
        .searchDiv label{width: 90px; display: inline-block;vertical-align: middle;padding-left: 8px; margin-left: 20px;text-align: center; height: 30px;line-height: 30px;box-sizing:border-box;border: #95918a solid 1px;border-radius: 5px; font-size: 15px;color: black;background: #f8f8f8;}
        .searchDiv input{padding-left: 12px; vertical-align: middle;height: 30px;border: #95918a solid 1px;border-radius: 5px;font-size: 15px;color: black;background: #f8f8f8;box-sizing:border-box;}
        .searchDiv input:last-child{vertical-align: middle;height: 30px;font-size: 15px;width: 80px;color: #fff;margin-left: 20px; border-radius: 5px;background: #4EBBF9;border: #d9d4c9 1px solid;padding-left: 0;cursor: pointer;}
        .layui-form-select{height: 30px;width: 100%;font-size: 15px;}
        .layui-form-select dl { max-height:200px; }
        .layui-form-item .layui-input-inline{width: 150px ;}
        table[id='demo']{display: none;}

        .operateBtn{color: #1d1d1d; margin-right: 5px;width: 40px;box-sizing: border-box; background: #fff;padding: 5px 10px;border: #c4bfb5 solid 1px;border-radius: 5px;cursor: pointer;}
        .operateBtn:hover{color: #1d1d1d}
        .operateBtn:last-child{background: #ff5833;color: #fff;margin-right: 0;}
        .operateBtn:last-child:hover{color: #fff}

        .videoAddForm{width: 300px; margin:20px 50px;}
        .videoUpdateForm{width: 300px; margin:20px 50px;}

        .layui-layer-title{ background: #24262F !important;color: #ffffff !important;height: 50px !important;line-height: 50px;border: 0;}
        .layui-layer-ico:before {background: none !important;content: "\1006"}
        .layui-layer-setwin a{font-family: layui-icon !important;font-size: 16px !important;font-style: normal;-webkit-font-smoothing: antialiased;-moz-osx-font-smoothing: grayscale;color: #ffffff;}
    </style>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">想看视频后台管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <a class="layui-layout-left title" style="">
            用户列表
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
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item">
                    <a href="jsp/manager/index.jsp">首页</a>
                </li>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;">用户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="manager/user/list">用户列表</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="javascript:;">视频管理</a>
                    <dl class="layui-nav-child">
                        <dd class="layui-this"><a href="manager/video/list">视频列表</a></dd>
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
        <div style="padding: 15px;">
            <div class="searchDiv">
                <form class="layui-form" action="manager/video/search" method="post">
                    <span style="">搜索栏</span>

                    <label>视频名称：</label>
                    <input type="text" name="name" placeholder="Search">

                    <label for="type">所属频道：</label>
                    <div class="layui-input-inline" style="width: 150px;">
                        <select name="type" lay-filter="type" id="type">
                            <option value="">--请选择--</option>
                            <c:forEach items="${type}" var="obj">
                                <option value="${obj.id}" <c:if test="${video.type == obj.id}">selected="selected"</c:if>>${obj.categoryName}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <label for="category">分类：</label>
                    <div class="layui-input-inline" style="width: 150px;">
                        <select name="category" lay-filter="category" id="category">
                            <option value="">--请选择--</option>
                        </select>
                    </div>
                    <br>

                    <label style="margin-left: 95px;">上映年：</label>
                    <div class="layui-input-inline" style="width: 150px;">
                        <select name="year" lay-filter="year" id="year">
                            <option value="">--请选择--</option>
                            <option value="2019" <c:if test="${year == '2019'}">selected="selected"</c:if>>2019</option>
                            <option value="2018" <c:if test="${year == '2018'}">selected="selected"</c:if>>2018</option>
                            <option value="2017" <c:if test="${year == '2017'}">selected="selected"</c:if>>2017</option>
                            <option value="2016" <c:if test="${year == '2016'}">selected="selected"</c:if>>2016</option>
                            <option value="2015" <c:if test="${year == '2015'}">selected="selected"</c:if>>2015</option>
                            <option value="2014" <c:if test="${year == '2014'}">selected="selected"</c:if>>2014</option>
                            <option value="2013" <c:if test="${year == '2013'}">selected="selected"</c:if>>2013</option>
                            <option value="2012" <c:if test="${year == '2012'}">selected="selected"</c:if>>2012</option>
                            <option value="2011" <c:if test="${year == '2011'}">selected="selected"</c:if>>2011</option>
                            <option value="2010-2000">2010-2000</option>"
                            <option value="更早">更早</option>
                        </select>
                    </div>

                    <label style="margin-left: 60px;" >状态：</label>
                    <div class="layui-input-inline" style="width: 150px;">
                        <select name="finished"  lay-filter="state" id="state">
                            <option value="">--请选择--</option>
                            <option value="0" <c:if test="${video.finished == false}">selected="selected"</c:if>>连载中</option>
                            <option value="1" <c:if test="${video.finished == true}">selected="selected"</c:if>>已完结</option>
                        </select>
                    </div>

                    <input type="submit" class="searchBtn" style="" value="搜 索">
                </form>
            </div>

            <div style="border: #beb9b0 solid 1px;margin-top: 30px;border-radius: 5px;">
                <div style="border-bottom: #beb9b0 solid 1px;height:40px;">
                    <h2 style="margin:10px 0 10px 15px;">视频列表</h2>
                </div>
                <div style="padding:20px;">
                    <table  id="demo" lay-filter="demo">
                        <thead>
                        <tr>
                            <th lay-data="{type:'checkbox', width:60}">全选</th>
                            <th lay-data="{type:'numbers', width:60}">序号</th>
                            <th lay-data="{field:'name',minWidth: 150}">视频名</th>
                            <th lay-data="{field:'type', width:80}">类型</th>
                            <th lay-data="{field:'categoryList'}">分类</th>
                            <th lay-data="{field:'starring',minWidth:120}">演员</th>
                            <th lay-data="{field:'location',sort: true}">地区</th>
                            <th lay-data="{field:'publishDate'}">上映年</th>
                            <th lay-data="{field:'finished'}">状态</th>
                            <th lay-data="{field:'operate',width:222}">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${videos}" var="obj">
                                <tr>
                                    <td> </td>
                                    <td> </td>
                                    <td>${obj.name}</td>
                                    <td>${obj.typeName}</td>
                                    <td>
                                        <c:forEach items="${obj.categoryList}" var="category">
                                            ${category.categoryName}
                                        </c:forEach>
                                    </td>
                                    <td>${obj.starring}</td>
                                    <td>${obj.location}</td>
                                    <td><fmt:formatDate value="${obj.publishDate}" pattern="yyyy"/></td>
                                    <td>
                                        <c:if test="${obj.finished == true}">已完结</c:if>
                                        <c:if test="${obj.finished == false}">连载中</c:if>
                                    </td>
                                    <td>
                                        <a href="manager/video/detail/${obj.id}" class="operateBtn">查看</a>
                                        <a class="operateBtn" lay-event="update" objId="${obj.id}">编辑</a>
                                        <a class="operateBtn" lay-event="delete" objId="${obj.id}">删除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>
</div>
<div style="display: none" id="addForm" >
    <form class="layui-form videoAddForm" style="width: 500px;" method="get" action="manager/video/add">
        <div class="layui-form-item">
            <label class="layui-form-label">视频名称：</label>
            <div class="layui-input-block">
                <input id="name2" type="text" name="name" lay-verify="required" autocomplete="off" placeholder="请输入视频名称" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">上传海报：</label>
            <div class="layui-input-block" style="display: inline-block;vertical-align: middle;margin-left: 0;">
                <button type="button" class="layui-btn layui-btn-normal" id="imgSelectBtn">选择文件</button>
                <span style="display: inline-block;margin-left: 16px;" id="fileName"></span><%--
                --%><span style="display: inline-block;margin-left: 10px;" id="fileSize"></span>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label" for="type2">所属频道：</label>
            <div class="layui-input-inline">
                <select name="type" lay-filter="type2" id="type2">
                    <option value="">--请选择--</option>
                    <c:forEach items="${type}" var="obj">
                        <option value="${obj.id}" <c:if test="${video.type == obj.id}">selected="selected"</c:if>>${obj.categoryName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" for="category2">分类：</label>
            <div class="layui-input-inline" style="width: 110px">
                <select name="category" lay-filter="category2" id="category2">
                    <option value="">--请选择--</option>
                </select>
            </div>
            <div class="layui-input-inline" style="width: 110px; ">
                <select name="category"   lay-filter="category3" id="category3">
                    <option value="">--请选择--</option>
                </select>
            </div>
            <div class="layui-input-inline" style="width: 110px;">
                <select name="category"   lay-filter="category4" id="category4">
                    <option value="">--请选择--</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">上映年：</label>
                <div class="layui-input-inline">
                    <input type="text" name="year" class="layui-input" id="year2" placeholder="yyyy">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">演员：</label>
            <div class="layui-input-block">
                <input type="starring" lay-verify="required" id="starring2" name="starring" lay-verify="starring" autocomplete="off" placeholder="请输入演员（多个演员以空格分隔）" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">地区：</label>
            <div class="layui-input-inline">
                <select id="location2" name="location" lay-filter="location">
                    <option value="">--请选择--</option>
                    <option value="内地">内地</option>
                    <option value="美国">美国</option>
                    <option value="香港">香港</option>
                    <option value="台湾">台湾</option>
                    <option value="日本">日本</option>
                    <option value="泰国">泰国</option>
                    <option value="印度">印度</option>
                    <option value="东南亚地区">东南亚地区</option>
                    <option value="欧美地区">欧美地区</option>
                    <option value="其他">其他</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">状态：</label>
            <div class="layui-input-inline">
                <select id="statue2" name="statue" lay-filter="statue">
                    <option value="">--请选择--</option>
                    <option value="0">连载中</option>
                    <option value="1">已完结</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">总集数：</label>
            <input id="totalEpisode" style="width: 200px" type="text" name="totalEpisode" lay-verify="number" autocomplete="off" placeholder="请输入总集数（数字）" class="layui-input">
            <div class="layui-input-inline">

            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">连载至：</label>
            <div class="layui-input-inline">
                <input id="currentEpisode" style="width: 200px" type="text" name="currentEpisode" lay-verify="number" autocomplete="off" placeholder="请输入更新到第几集（数字）" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">简介：</label>
            <div class="layui-input-block">
                <textarea name="description" id="description" placeholder="请输入简介内容" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block" style="margin-top: 50px;">
                <button type="submit" id="submit" class="layui-btn" style="margin-right: 60px;" lay-submit="" lay-filter="demo1">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<div style="display: none" id="updateForm" >
    <form class="layui-form videoUpdateForm" style="width: 500px;" method="post" action="manager/video/updateForForm">
        <input type="hidden" value="" name="id">

        <div class="layui-form-item">
            <label class="layui-form-label">视频名称：</label>
            <div class="layui-input-block">
                <input id="name3" type="text" name="name" lay-verify="required" autocomplete="off" placeholder="请输入视频名称" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">上传海报：</label>
            <div class="layui-input-block" style="display: inline-block;vertical-align: middle;margin-left: 0;">
                <button type="button" class="layui-btn layui-btn-normal" id="imgSelectBtn3">选择文件</button>
                <span style="display: inline-block;margin-left: 16px;" id="fileName3"></span><%--
                --%><span style="display: inline-block;margin-left: 10px;" id="fileSize3"></span>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label" for="type2">所属频道：</label>
            <div class="layui-input-inline">
                <select name="type" lay-filter="type3" id="type3">
                    <option value="">--请选择--</option>
                    <c:forEach items="${type}" var="obj">
                        <option value="${obj.id}" <c:if test="${video.type == obj.id}">selected="selected"</c:if>>${obj.categoryName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" for="category2">分类：</label>
            <div class="layui-input-inline" style="width: 110px">
                <select name="category" lay-filter="category5" id="category5">
                    <option value="">--请选择--</option>
                </select>
            </div>
            <div class="layui-input-inline" style="width: 110px; ">
                <select name="category"   lay-filter="category6" id="category6">
                    <option value="">--请选择--</option>
                </select>
            </div>
            <div class="layui-input-inline" style="width: 110px;">
                <select name="category"   lay-filter="category7" id="category7">
                    <option value="">--请选择--</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">上映年：</label>
                <div class="layui-input-inline">
                    <input type="text" name="year" class="layui-input" id="year3" placeholder="yyyy">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">演员：</label>
            <div class="layui-input-block">
                <input type="starring" lay-verify="required" id="starring3" name="starring" lay-verify="starring" autocomplete="off" placeholder="请输入演员（多个演员以空格分隔）" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">地区：</label>
            <div class="layui-input-inline">
                <select id="location3" name="location" lay-filter="location">
                    <option value="">--请选择--</option>
                    <option value="内地">内地</option>
                    <option value="美国">美国</option>
                    <option value="香港">香港</option>
                    <option value="台湾">台湾</option>
                    <option value="日本">日本</option>
                    <option value="泰国">泰国</option>
                    <option value="印度">印度</option>
                    <option value="东南亚地区">东南亚地区</option>
                    <option value="欧美地区">欧美地区</option>
                    <option value="其他">其他</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">状态：</label>
            <div class="layui-input-inline">
                <select id="statue3" name="statue" lay-filter="statue">
                    <option value="">--请选择--</option>
                    <option value="0">连载中</option>
                    <option value="1">已完结</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">总集数：</label>
            <input id="totalEpisode3" style="width: 200px" type="text" name="totalEpisode" lay-verify="" autocomplete="off" placeholder="请输入总集数（数字）" class="layui-input">
            <div class="layui-input-inline">

            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">连载至：</label>
            <div class="layui-input-inline">
                <input id="currentEpisode3" style="width: 200px" type="text" name="currentEpisode" lay-verify="" autocomplete="off" placeholder="请输入更新到第几集（数字）" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">简介：</label>
            <div class="layui-input-block">
                <textarea name="description" id="description3" placeholder="请输入简介内容" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block" style="margin-top: 50px;">
                <button type="submit" id="submit3" class="layui-btn" style="margin-right: 60px;" lay-submit="" lay-filter="demo1">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<script type="text/html" id="toolbarLeft">
    <div class="layui-inline" title="添加视频" lay-event="addVideo">
        <i class="layui-icon layui-icon-add-1" style="color: #77746e">
        </i>
    </div>
</script>

<script>
    $(".layui-nav-item").click(function () {
        $(".layui-nav-item").not(this).removeClass('layui-nav-itemed');
        $(".layui-nav-bar").css({top: $(this).position().top+'px'})
    });
//JavaScript代码区域
layui.use(['element','table','layer','jquery','form','laydate','upload'], function() {
    var element = layui.element
        , table = layui.table
        , layer = layui.layer
        ,$ = layui.jquery
        ,form = layui.form
        ,laydate = layui.laydate
        ,upload = layui.upload;

    /**
     * 搜索条件数据回显
     * @type {string}
     */
    var video = "${video}";
    if (video != null || video != ' ') {
        //名称文本框回显
        $("input[name='name']").val('${video.name}');
        //分类下拉框回显
        if (${video.type != null}){
            var type = '${video.type}';
            var category = '${video.category}';
            var html = '<option value="">--请选择--</option>';
            var selected = '';
            $.ajax({
                url:'manager/video/getCategoryByPid/'+type
                ,success:function (data) {
                    for (var i = 0; i <data.length;i++){
                        if (data[i].id == category){
                            console.log(data[i].id + " " +category);
                            selected = 'selected';
                        }else{
                            selected = '';
                        }
                        html += '<option value="'+ data[i].id +'"'+ selected +'>'+ data[i].categoryName +'</option>'
                }
                    $("#category").html(html);
                    form.render();
                }
            })
        }

    }

    /**
     * 表格渲染
     */
    table.init('demo', {
        limit: 10 //注意：请务必确保 limit 参数（默认：10）是与你服务端限定的数据条数一致
        ,page: true //开启分页
        ,toolbar: '#toolbarLeft'
        ,limits:[10,20,30,40,50,60,70,80,90,100,${fn:length(videos)}]
        //支持所有基础参数
    });

    //表格头工具栏事件
    table.on('toolbar(demo)', function(obj){
        switch(obj.event){
            case 'addVideo':    //添加视频
                layer.open({
                    type:1
                    ,title:'添加视频'
                    ,area:['700px','720px']
                    ,content:$("#addForm")
                    ,success:function () {
                        var layerForm = layui.form.render('select');

                        layerForm.on('select(type2)',function () {
                            //获取选中的类型id
                            var type =$('#type2').val();
                            var html = '<option value="">--请选择--</option>';
                            if(type == 0){
                                $("#category2,#category3,#category4").html(html);
                                layerForm.render();
                            }else{
                                $.ajax({
                                    url:'manager/video/getCategoryByPid/'+type
                                    ,success:function (data) {
                                        for (var i = 0; i <data.length;i++){
                                            html += '<option value="'+ data[i].id +'">'+ data[i].categoryName +'</option>'
                                        }
                                        $("#category2,#category3,#category4").html(html);
                                        layerForm.render();
                                    }
                                })
                            }
                        });
                        layerForm.on('select(statue)',function () {
                            //获取选中的类型id
                        })
                    }
                });
                break;
        }
    });

    //判断是否采用表单提交，上传图片时不使用表单提交
    var updateImgFlag = true;
    $("#updateForm").submit(function () {
        return updateImgFlag;
    });
    //表格行操作按钮点击事件
    table.on('tool(demo)', function(obj) {
        var data = obj.data; //获得当前行数据
        var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
        if (layEvent == 'delete'){
            var id1 = $(this).attr("objId");
            layer.confirm('确认删除视频 \"'+ data.name + '\" ?', {title:'提示'}, function(index){
                $.get('manager/video/del?id='+id1,function (data) {
                    if (data >= 1){
                        layer.msg("删除成功");
                        obj.del();
                    }else{
                        layer.msg("删除失败");
                    }
                });
                layer.close(index);
            });
        }

        //编辑视频信息
        if (layEvent == 'update'){
            //选中行的id
            var id = $(this).attr("objId");
            var html = '<option value="">--请选择--</option>';

            layer.open({
                type:1
                ,title:'修改视频信息'
                ,area:['700px','720px']
                ,content:$("#updateForm")
                ,success:function () {
                    var layerForm = layui.form.render('select');

                    //根据选择的类型获取分类
                    layerForm.on('select(type3)',function () {
                        //获取选中的类型id
                        var type =$('#type3').val();
                        var selected = '';
                        var html = '<option value="">--请选择--</option>';

                        if(type == 0){
                            html = '<option value="">--请选择--</option>';
                            $("#category5,#category6,#category7").html(html);
                            layerForm.render();
                        }else{
                            $.ajax({
                                url:'manager/video/getCategoryByPid/'+type
                                ,success:function (data) {
                                    for (var i = 0; i <data.length;i++){
                                        html += '<option value="'+ data[i].id +'">'+ data[i].categoryName +'</option>'
                                    }
                                    $("#category5,#category6,#category7").html(html);
                                    layerForm.render();
                                }
                            })
                        }
                    });

                    $.ajax({
                        url:'manager/video/getVideoById'
                        ,type:'post'
                        ,data:{id:id}
                        ,success:function (result) {
                            $("input[type='hidden']").val(id);

                            $("#name3").val(result.name);

                            $("select[id='type3'] option").each(function (index,el) {
                                if($(this).val() == result.type){
                                    $(this)[0].selected=true;
                                    layui.form.render('select');
                                    $("select[id='type3']").next().children('.layui-anim-upbit').children(".layui-this").click();
                                }
                            });

                            setTimeout(function () {
                                $("select[id='category5'] option").each(function (index, el) {
                                    if (result.categoryList[0] != null){
                                        if(result.categoryList[0].id == $(this).val()){
                                            $(this)[0].selected=true;
                                            layui.form.render('select');
                                        }
                                    }
                                });
                                $("select[id='category6'] option").each(function (index, el) {
                                    if (result.categoryList[1] != null){
                                        if(result.categoryList[1].id == $(this).val()){
                                            $(this)[0].selected=true;
                                            layui.form.render('select');
                                        }
                                    }
                                });
                                $("select[id='category7'] option").each(function (index, el) {
                                    if (result.categoryList[2] != null){
                                        if(result.categoryList[2].id == $(this).val()){
                                            $(this)[0].selected=true;
                                            layui.form.render('select');
                                        }
                                    }
                                });
                            },150);

                            $("#year3").val(new Date(result.publishDate).getFullYear());
                            $("#location3").val(result.location);
                            $("#starring3").val(result.starring);

                            if (result.finished){
                                $("#statue3").val(1);
                            } else{
                                $("#statue3").val(0);
                            }

                            $("#totalEpisode3").val(result.totalEpisode);
                            $("#currentEpisode3").val(result.currentEpisode);
                            $("#description3").val(result.description);
                            layui.form.render('select');
                        }
                    });


                }
            });
        }
    });


    /**
     * 表单选择下拉框监听
     */
    form.on('select(type)',function () {
        //获取选中的类型id
        var type =$('#type').val();
        var html = '<option value="">--请选择--</option>';

        if(type == 0){
            $("#category").html(html);
            form.render();
        }else{
            $.ajax({
                url:'manager/video/getCategoryByPid/'+type
                ,success:function (data) {
                    for (var i = 0; i <data.length;i++){
                        html += '<option value="'+ data[i].id +'">'+ data[i].categoryName +'</option>'
                    }
                    $("#category").html(html);
                    form.render();
                }
            })
        }
    });

    //时间选择器渲染
    laydate.render({
        elem: '#year2'
        ,type:'year'
        ,value: '2019' //必须遵循format参数设定的格式
        ,max:'2019'
    });
    //时间选择器渲染
    laydate.render({
        elem: '#year3'
        ,type:'year'
        ,value: '2019' //必须遵循format参数设定的格式
        ,max:'2019'
    });


    var imgFlag = false;//标记是否使用图片上传
    $(".videoAddForm").submit(function () {
        if(!imgFlag){
            layer.msg("请先选择海报图片");
        }
        return false;
    });


    /**
     * 文件上传
     */
    var uploadIns = upload.render({
        elem: '#imgSelectBtn'
        ,url: 'manager/video/add'
        ,auto: false //选择文件后不自动上传
        ,bindAction: '#submit' //指向一个按钮触发上传
        ,multiple:false
        ,data:{
            name:function () {
                return $("#name2").val();
            }
            ,totalEpisode:function () {
                return $("#totalEpisode").val();
            }
            ,currentEpisode:function () {
                return $("#currentEpisode").val();
            }
            ,type:function () {
                return $("#type2").val();
            }
            ,category:function () {
                return [$("#category2").val(),$("#category3").val(),$("#category4").val()];
            }
            ,starring:function () {
                return $("#starring2").val();
            }
            ,year:function () {
                return $("#year2").val();
            }
            ,location:function () {
                return $("#location2").val();
            }
            ,statue:function () {
                return $("#statue2").val();
            }
            ,description:function () {
                return $("#description").val();
            }
        }
        ,choose: function(obj){
            //预读本地文件
            obj.preview(function(index, file, result){
                imgFlag = true;
                $("#fileName").html(file.name);
                $("#fileSize").html((file.size/1024).toFixed(1) + 'kb');

                $(".layui-btn-primary").on('click',function () {
                    $("#fileName").html('');
                    $("#fileSize").html('');
                    uploadIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
                    imgFlag = false;
                })
            });
        }
        ,before: function(obj){ //obj参数包含的信息，跟 choose回调完全一致，可参见上文。
            layer.load(1); //上传loading
        }
        ,done:function (res, index, upload) {
            if(res.code == 1 ){
                layer.closeAll('loading'); //关闭loading
                layer.msg("添加视频成功！");
                layer.close();
                location.reload();
            }else if(res.code == 0 ){
                layer.closeAll('loading'); //关闭loading
                layer.msg("添加视频失败！");
            }
        }
    });

    /**
     * 编辑视频信息的文件上传
     */
    var uploadUpd = upload.render({
        elem: '#imgSelectBtn3'
        ,url: 'manager/video/update'
        ,auto: false //选择文件后不自动上传
        ,bindAction: '#submit3' //指向一个按钮触发上传
        ,multiple:false
        ,data:{
            id:function(){
                return $("input[type='hidden']").val();
            }
            ,name:function () {
                return $("#name3").val();
            }
            ,totalEpisode:function () {
                return $("#totalEpisode3").val();
            }
            ,currentEpisode:function () {
                return $("#currentEpisode3").val();
            }
            ,type:function () {
                return $("#type3").val();
            }
            ,category:function () {
                return [$("#category5").val(),$("#category6").val(),$("#category7").val()];
            }
            ,starring:function () {
                return $("#starring3").val();
            }
            ,year:function () {
                return $("#year3").val();
            }
            ,location:function () {
                return $("#location3").val();
            }
            ,statue:function () {
                return $("#statue3").val();
            }
            ,description:function () {
                return $("#description3").val();
            }
        }
        ,choose: function(obj){
            updateImgFlag = false;
            //预读本地文件
            obj.preview(function(index, file, result){
                imgFlag = true;
                $("#fileName3").html(file.name);
                $("#fileSize3").html((file.size/1024).toFixed(1) + 'kb');
            });
        }
        ,before: function(obj){ //obj参数包含的信息，跟 choose回调完全一致，可参见上文。
            layer.load(1); //上传loading
        }
        ,done:function (res, index, upload) {
            if(res.code == 1 ){
                layer.closeAll('loading'); //关闭loading
                layer.msg("修改视频成功！");
                layer.close();
                location.reload();
            }else if(res.code == 0 ){
                layer.closeAll('loading'); //关闭loading
                layer.msg("修改视频失败！");
            }
        }
    });
})
</script>
</body>
</html>
