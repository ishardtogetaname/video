<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>Title</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="static/plugins/layui/css/layui.css"  media="all">

    <style>
        form{width: 500px;}
        input{width: 300px;}
    </style>
</head>
<body>
<div style="display: none" id="addForm" >
    <form class="layui-form videoAddForm" style="width: 500px;" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">视频名称：</label>
            <div class="layui-input-block">
                <input type="text" name="name" lay-verify="name" autocomplete="off" placeholder="请输入视频名称" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" for="type">所属频道：</label>
            <div class="layui-input-inline">
                <select name="type" lay-filter="type" id="type2">
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
                <select name="category"   lay-filter="category" id="category2">
                    <option value="">--请选择--</option>
                </select>
            </div>
            <div class="layui-input-inline" style="width: 110px; ">
                <select name="category"   lay-filter="category" id="category3">
                    <option value="">--请选择--</option>
                </select>
            </div>
            <div class="layui-input-inline" style="width: 110px;">
                <select name="category"   lay-filter="category" id="category4">
                    <option value="">--请选择--</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">演员</label>
            <div class="layui-input-block">
                <input type="starring" name="starring" lay-verify="starring" autocomplete="off" placeholder="请输入演员（多个演员以空格分隔）" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">地区</label>
            <div class="layui-input-inline">
                <select name="location" lay-filter="location">
                    <option value="">--请选择--</option>
                    <option value="0">写作</option>
                    <option value="1" selected="">阅读</option>
                    <option value="2">游戏</option>
                    <option value="3">音乐</option>
                    <option value="4">旅行</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">上映年</label>
            <div class="layui-input-inline">
                <select name="publishDate" lay-filter="publishDate">
                    <option value="">--请选择--</option>
                    <option value="0">写作</option>
                    <option value="1" selected="">阅读</option>
                    <option value="2">游戏</option>
                    <option value="3">音乐</option>
                    <option value="4">旅行</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-inline">
                <select name="statue" lay-filter="statue">
                    <option value="">--请选择--</option>
                    <option value="0">连载中</option>
                    <option value="1">已完结</option>
                </select>
            </div>
        </div>
    </form>
</div>
<script src="static/plugins/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use(['element','table','layer','jquery','form'], function() {
            var element = layui.element
                , $ = layui.jquery
                , form = layui.form;


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
        })
    })
</script>
</body>
</html>
