<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>分类列表</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="static/plugins/layui/css/layui.css"  media="all">
    <script src="static/plugins/layui/layui.js"></script>
    <script src="static/plugins/jquery/jquery.js"></script>
    <style type="text/css">
        .layui-layout-admin .layui-body {bottom:0}

        .title{line-height: 60px;color: #d0cbc1;margin-left: 20px;}
        .searchDiv{height: 50px;background: #e0e0e0;font-size: 20px;color: #696969;line-height: 50px;border-radius: 5px;}
        .searchDiv span{margin-left:10px;}
        .searchDiv label{display: inline-block;vertical-align: middle;padding-left: 8px; margin-left: 20px;text-align: center; height: 30px;line-height: 30px;box-sizing:border-box;border: #95918a solid 1px;border-radius: 5px; font-size: 15px;color: black;background: #f8f8f8;}
        .searchDiv input{padding-left: 12px; vertical-align: middle;height: 30px;border: #95918a solid 1px;border-radius: 5px;font-size: 15px;color: black;background: #f8f8f8;box-sizing:border-box;}
        .searchDiv input:last-child{vertical-align: middle;height: 30px;font-size: 15px;width: 80px;color: #fff;margin-left: 15px; border-radius: 5px;background: #4EBBF9;border: #d9d4c9 1px solid;padding-left: 0;cursor: pointer;}
        .layui-form-select{width: 190px;height: 30px;display: inline-block;font-size: 15px;color: black;}

        .operateBtn{color: #1d1d1d; margin-right: 20px;width: 50px;box-sizing: border-box; background: #fff;padding: 5px 10px;border: #c4bfb5 solid 1px;border-radius: 5px;cursor: pointer;}
        .operateBtn:hover{color: #1d1d1d}
        .operateBtn:last-child{background: #ff5833;color: #fff}
        .operateBtn:last-child:hover{color: #fff}

    </style>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">想看视频后台管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <a class="layui-layout-left title" style="">
            分类列表
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
                <li class="layui-nav-item" onclick="">
                    <a class="" href="javascript:;">用户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">用户列表</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">视频管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="manager/video/list">视频列表</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="javascript:;">视频分类管理</a>
                    <dl class="layui-nav-child">
                        <dd class="layui-this"><a href="manager/category/list">视频分类列表</a></dd>
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
                <form class="layui-form" >
                    <span style="">搜索栏</span>
                    <label>分类名称：</label>
                    <input type="text" placeholder="Search">

                    <label for="">所属频道：</label>
                    <select name="" id="">
                        <option value="0">无</option>
                        <c:forEach var="obj" items="${type}">
                            <option value="${obj.id}">${obj.categoryName}</option>
                        </c:forEach>
                    </select>

                    <input type="submit" class="searchBtn" style="" value="搜 索">
                </form>
            </div>

            <div style="border: #beb9b0 solid 1px;margin-top: 20px;border-radius: 5px;">
                <div style="border-bottom: #beb9b0 solid 1px;height:40px;">
                    <h2 style="margin:10px 0 10px 15px;">分类列表</h2>
                </div>
                <div style="padding:20px;width: 60%;margin: 0 auto;">
                    <div id="test" lay-filter="test"></div>
                </div>
            </div>
        </div>
    </div>

</div>

<script>
    $(".layui-nav-itemed").trigger('mouseenter');
    $(".layui-nav-item").click(function () {
        $(".layui-nav-item").not(this).removeClass('layui-nav-itemed');
        $(".layui-nav-bar").css({top: $(this).position().top+'px'})
    });

    //JavaScript代码区域
    layui.use(['element','table','layer'], function(){
        var element = layui.element
            ,table = layui.table
            ,layer = layui.layer;

        table.render({
            elem: '#test'
            ,url:'manager/category/getAll'
            ,toolbar: 'true'
            ,cols: [[
                {type:'checkbox', width:60, title: '全选'}
                ,{type:'numbers', width:60, title: '序号'}
                ,{field:'categoryName', title: '分类名'}
                ,{field:'phone',  title: '所属频道'
                    ,templet:function (d) {
                    var categories = ${categories};
                    for(var i in categories){
                        if (d.pid == '0') {
                            return '<div>无</div>'
                        }
                        if (d.pid == categories[i].id) {
                            return '<div>'+ categories[i].categoryName +'</div>';
                        }
                    }
                }}
                ,{field:'operate',title:'操作'
                    ,templet:function (d) {
                        return '<div><a href="manager/user/detail/'+ d.id +'" class="operateBtn">查看</a><a class="operateBtn" lay-event="delete">删除</a></div>';
                    }
                }
            ]]
            ,page: {
                layout: [ 'count', 'prev', 'page', 'next', 'skip','limit']
                ,limit:10
            }
        });

        $(".searchBtn").click(function () {
            table.reload('test',{
                url:'manager/category/getByName'
                ,where:{name:$("input:eq(0)").val(),pid:$("select").val()}
                ,method:'post'
            });
            return false;
        });

        table.on('tool(test)', function(obj) {
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if (layEvent == 'delete'){
                layer.confirm('确认删除分类 \"'+ data.categoryName + '\" ?', {title:'提示'}, function(index){
                    $.get('manager/category/delCategory?id='+data.id,function (data) {
                        if (data.result >= 1){
                            layer.msg("删除成功");
                            obj.del();
                        }else{
                            layer.msg("删除失败");
                        }
                    });
                    layer.close(index);
                });
            }
        })
    });

</script>
</body>
</html>
