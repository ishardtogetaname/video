<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>视频详情</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="static/plugins/layui/css/layui.css"  media="all">
    <script src="static/plugins/layui/layui.js"></script>
    <script src="static/plugins/jquery/jquery.js"></script>
    <script src="static/plugins/webUploader/webuploader.js"></script>

    <style type="text/css">
        .layui-layout-admin .layui-body{bottom: 0;}

        .title{line-height: 60px;color: #d0cbc1;margin-left: 20px;}
        .detail-div{box-sizing: border-box; width: 97%; margin: 20px auto;background: #ffffff; border: #e6e1d5 1px solid;border-radius: 5px;}
        .avatar-div{height: 50px;box-sizing: border-box; padding: 10px 20px; background: #e3e3e3;border-top-right-radius: 5px;border-top-left-radius: 5px;}
        .info-div{padding: 30px 20px;box-sizing: border-box;}
        .videoImg{width: 200px;height: 300px;}


        .description-div{flex: 1; display: inline-block; padding: 0 0 0 30px; box-sizing: border-box; vertical-align: middle;}
        .description-line span{ display: inline-block;margin-top: 10px;}
        .description-line span:first-child{line-height: 30px; text-align: start;vertical-align: top; font-weight: 600;font-size: 17px;}
        .description-line span:last-child{line-height: 30px;font-size: 17px;width: 930px;}

        table[id='table']{display: none;}
        .operateBtn{color: #1d1d1d; margin-right: 10px;width: 40px;box-sizing: border-box; background: #fff;padding: 5px 10px;border: #c4bfb5 solid 1px;border-radius: 5px;cursor: pointer;}
        .operateBtn:hover{color: #1d1d1d}
        .operateBtn:last-child{background: #ff5833;color: #fff;margin-right: 0;}
        .operateBtn:last-child:hover{color: #fff}

        .layui-form-label{width:100px}
        .layui-input-block{margin-left: 130px;}
        .videoAddForm{width: 300px; margin:20px 50px;}

        .btn{margin: 20px auto 0 auto;display: inline-block; height: 30px;line-height: 30px; color: #fff; text-align: center; width: 50px;background: #4EBBF9;}
        .btn:hover{ color: #fff; background: #15a8f9;}

    </style>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">想看视频后台管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <a class="layui-layout-left title" style="">
            视频详情
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
        <div class="detail-div">
            <div class="avatar-div">
                <h2 >视频详情</h2>
            </div>
            <div class="info-div">
                <div style="display: flex;">
                    <img class="videoImg" src="${video.imgSrc}" alt="${video.name}">
                    <div class="description-div">
                        <h1>${video.name}</h1>
                        <div class="description-line">
                            <span>演员：</span>
                            <span>${video.starring}</span>
                        </div>
                        <div class="description-line">
                            <span>类型：</span>
                            <span><c:forEach items="${video.categoryList}" var="category">${category.categoryName} </c:forEach></span>
                        </div>
                        <div class="description-line">
                            <span>状态：</span>
                            <span>
                                <c:if test="${video.finished}">已完结  全${video.totalEpisode}集</c:if>
                                <c:if test="${!video.finished}">连载中  连载至${video.currentEpisode}集</c:if>
                            </span>
                        </div>
                        <div class="description-line">
                            <span>简介：</span>
                            <span>${video.description}</span>
                        </div>
                    </div>
                </div>

                <div class="episode-block">
                    <div style="border: #beb9b0 solid 1px;margin-top: 30px;border-radius: 5px;">
                        <div style="border-bottom: #beb9b0 solid 1px;height:40px;">
                            <h2 style="margin:10px 0 10px 15px;">分集列表</h2>
                        </div>
                        <div style="padding:20px;">
                            <table id="table" lay-filter="table">
                                <thead>
                                    <tr>
                                        <th lay-data="{field:'episode',width:100,sort:true}">第几集</th>
                                        <th lay-data="{field:'title'}">标题</th>
                                        <th lay-data="{field:'statue',minWidth:60}">状态</th>
                                        <th lay-data="{field:'progress',minWidth:120}">进度</th>
                                        <th lay-data="{field:'publishDate',sort: true}">上传时间</th>
                                        <th lay-data="{field:'operate',minWidth:301}">操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${episodes}" var="obj">
                                        <tr>
                                            <td>${obj.episode}</td>
                                            <td>${obj.title}</td>
                                            <td><div class="statue" objId="${obj.id}"><c:if test="${obj.fileName == null || obj.fileName == ''}">未上传</c:if><c:if test="${obj.fileName != null && obj.fileName != ''}">已上传</c:if></div></td>
                                            <td><div class="progress" objId="${obj.id}"><c:if test="${obj.fileName == null || obj.fileName == ''}">0%</c:if><c:if test="${obj.fileName != null && obj.fileName != ''}">100%</c:if></div></td>
                                            <td><fmt:formatDate value="${obj.uploadDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                            <td>
                                                <a class="operateBtn uploadBtn" objId="${obj.id}" style="display: none"></a>
                                                <a class="operateBtn" lay-event="upload" objId="${obj.id}"><c:if test="${obj.fileName == null || obj.fileName == ''}">上传</c:if><c:if test="${obj.fileName != null && obj.fileName != ''}">重新上传</c:if></a>
                                                <a class="operateBtn" lay-event="update">编辑</a>
                                                <a class="operateBtn" objId="${obj.id}" lay-event="delete">删除</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div style="width: 100%;text-align: center;margin-top: 10px;">
                    <a class="btn" style="" href="manager/video/list">返回</a>
                </div>
            </div>
        </div>
    </div>

    <div style="display: none" id="addForm" >
            <form class="layui-form videoAddForm" style="width: 500px;" method="get" action="manager/video/add">
                <div class="layui-form-item">
                    <label class="layui-form-label">第几集：</label>
                    <div class="layui-input-block">
                        <input id="episode" type="text" name="episode" lay-verify="" autocomplete="off" placeholder="请输入本集集数（数字）" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">本集标题：</label>
                    <div class="layui-input-block">
                        <input id="title" type="text" name="title" lay-verify="" autocomplete="off" placeholder="请输入本集标题" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block" style="margin-top: 50px;">
                        <button type="submit" id="submit" class="layui-btn" style="margin-right: 60px;margin-left: 70px;" lay-submit="" lay-filter="demo1">立即提交</button>
                    </div>
                </div>
        </form>
    </div>
    <div style="display: none" id="updateForm" >
        <form class="layui-form videoAddForm" style="width: 500px;" method="get" action="manager/video/add">
            <div class="layui-form-item">
                <label class="layui-form-label">第几集：</label>
                <div class="layui-input-block">
                    <input id="episode2" type="text" name="episode" lay-verify="" autocomplete="off" placeholder="请输入本集集数（数字）" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">本集标题：</label>
                <div class="layui-input-block">
                    <input id="title2" type="text" name="title" lay-verify="" autocomplete="off" placeholder="请输入本集标题" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block" style="margin-top: 50px;">
                    <button type="submit" id="submit2" class="layui-btn" style="margin-right: 60px;margin-left: 70px;" lay-submit="" lay-filter="demo1">立即提交</button>
                </div>
            </div>
        </form>
    </div>
</div>

<script type="text/html" id="toolbarLeft">
    <div class="layui-inline" title="添加视频分集信息" lay-event="uploadVideo">
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
        , $ = layui.jquery
        , upload = layui.upload;

    // webuploader大文件断点续传
    // 文件标记
    var fileMd5;
    //必须在uploader实例化前面
    WebUploader.Uploader.register({
        "before-send-file":"beforeSendFile"
        ,"before-send":"beforeSend"
        ,"after-send-file":"afterSendFile"
    },{
        //时间点1：所有分块上传前条用此函数
        beforeSendFile:function (file) {
            //创建一个defferred
            var deferred = WebUploader.Deferred();
            //1.计算文件的唯一标记（MD5），用于断点续传和秒传
            uploader.md5File(file,0,3*1024*1024)
                .progress(function (percentage) {
                    $(".statue[objId="+ objId + "]").html("正在获取文件信息");
                })
                .then(function (val) {
                    fileMd5 = val;
                    $(".statue[objId="+ objId + "]").html("成功获取信息");
                    //只有文件读取成功才进行下一步操作
                    deferred.resolve();
                });
            //2.请求后台是否保存过该文件，如果存在，则跳过该文件，实现秒传功能
            return deferred.promise();
        }
        //时间点2：如果有分块上传，则每个分块上传前调用此函数
        ,beforeSend:function (block) {
            console.log(fileMd5);
            var deferred = WebUploader.Deferred();

            //1.请求后台是否保存过该分块，如果存在，则跳过该分块文件，实现秒传功能
            $.ajax({
                type:"post"
                ,url:'manager/video/detail/checkChunk'
                ,data:{
                    fileMd5:fileMd5
                    ,chunk:block.chunk
                    ,chunkSize:block.end-block.start
                },
                dataType:'json'
                ,success:function (result) {
                    if (result.ifExist) {
                        //分块存在，跳过该分块
                        deferred.reject();
                    }else{
                        //分块不存在或不完整，重新发送该分块内容
                        deferred.resolve();
                    }
                }
            });
            this.owner.options.formData.fileMd5 = fileMd5;
            return deferred.promise();
        }
        //时间点3：所有分块上传成功之后调用此函数
        ,afterSendFile:function (file) {
            //1.如果分块上传，则通过后台合并所有分块文件
            $.ajax({
                url:"manager/video/detail/mergeChunks"
                ,type:"post"
                ,data:{
                    fileMd5:fileMd5
                    ,fileName:fileName + file.name.substring(file.name.lastIndexOf("."))
                }
                ,success:function (result) {
                    var statue = $(".statue[objId="+ objId + "]");
                    var progress = $(".progress[objId="+objId+"]");
                    var uploadBtn = $(".upload[objId="+objId+"][lay-event='upload']");

                    statue.html("已上传");
                    progress.html("100%");
                    uploadBtn.html("重新上传");
                    uploader.reset();

                    $.ajax({
                        url:'manager/video/detail/updDetailAndDate'
                        ,type:'post'
                        ,data:{
                            id:objId,
                            fileName:result
                        }
                        ,success:function () {
                            location.reload();
                        }
                    })
                }
            })
        }
    });

    // webuploader文件上传
    var uploader = WebUploader.create({
        //flash插件的地址
        swf:"static/plugins/webUploader/Uploader.swf"
        //设置提交的服务器地址
        ,server:"manager/video/detail/upload"
        //渲染上传文件元素
        ,pick:$(".uploadBtn")
        //自动上传
        ,auto:true
        //分块上传配置
        ,chunked:true
        ,chunkSize:5*1024*1024
    });

    //选择文件后触发事件，文件预加载
    //注册fileQueued事件：当文件加入队列后触发
    //file：代表当前选择的文件
    uploader.on("fileQueued",function (file) {
        $(".statue[objId="+ objId + "]").html("等待上传...")
    });

    //文件上传过程监听
    // percentage:文件上传百分比 0.14  1
    uploader.on("uploadProgress",function (file,percentage) {
        var statue = $(".statue[objId="+ objId + "]");
        var progress = $(".progress[objId="+objId+"]");
        var uploadBtn = $(".upload[objId="+objId+"][lay-event='upload']");

        if(percentage == 1){
            statue.html("上传完成，正在合并");
            progress.html("99%");
        }else{
            statue.html("文件上传中");
            progress.html(Math.floor(percentage*100) + "%");
        }
    });



    table.init('table', {
        limit: 10 //注意：请务必确保 limit 参数（默认：10）是与你服务端限定的数据条数一致
        ,page: true //开启分页
        ,toolbar: '#toolbarLeft'
        //支持所有基础参数
        ,success:function () {
        }
    });


    $("form").submit(function () {
        return false;
    });
    table.on('toolbar(table)',function (obj) {
        switch(obj.event){
            case 'uploadVideo':    //添加视频分集信息
                layer.open({
                    type:1
                    ,title:'添加视频分集信息'
                    ,area:['600px','350px']
                    ,content:$("#addForm")
                    ,success:function () {
                        $("#submit").on('click',function () {
                            $.ajax({
                                url:"manager/video/detail/addVideoDetail/"+${video.id}
                                ,type:"post"
                                ,data:{
                                    episode:$("#episode").val()
                                    ,title:$("#title").val()
                                }
                                ,success:function (data) {
                                    if (data.code == 1) {
                                        layer.msg("添加分集信息成功");
                                        setTimeout(function () {
                                            layer.close();
                                            location.reload();
                                        },700)
                                    }else{
                                        layer.msg("添加分集信息失败");
                                    }
                                }
                            })
                        })
                    }
                });
                break;
        }
    });


    var objId;
    var fileName;
    var isFirst = true; //第一次上传

    table.on('tool(table)',function (obj) {
        var data = obj.data;

        switch(obj.event){
            case 'upload':           //上传视频
                var progress = $(".progress[objId="+objId+"]");
                if(progress.html() != '100%' && progress.html() != '0%' && !isFirst){
                    layer.msg("请等待上一个文件上传完成");
                    break;
                }
                isFirst = false;
                objId = $(this).prev(".uploadBtn").attr("objId");
                if (0<data.episode < 10){
                    fileName = '${video.name}'+ '-0' + data.episode;
                } else{
                    fileName = '${video.name}'+ '-' + data.episode;
                }
                $(".uploadBtn[objId=" + objId + "]").find("input").trigger('click');
                break;

            case 'update':         //编辑分集信息
                var id = $(this).prev().prev(".uploadBtn").attr("objId");
                layer.open({
                    type:1
                    ,title:'修改视频分集信息'
                    ,area:['600px','350px']
                    ,content:$("#updateForm")
                    ,success:function () {
                        $("#submit2").on('click',function () {
                            $.ajax({
                                url:"manager/video/detail/updDetail"
                                ,type:"post"
                                ,data:{
                                    id:id
                                    ,episode:$("#episode2").val()
                                    ,title:$("#title2").val()
                                }
                                ,success:function (data) {
                                    if (data.code == 1) {
                                        layer.msg("修改分集信息成功");
                                        setTimeout(function () {
                                            layer.close();
                                            location.reload();
                                        },700)
                                    }else{
                                        layer.msg("修改分集信息失败");
                                    }
                                }
                            })
                        })
                    }
                });
                break;
            case 'delete':
                var id1 = $(this).attr("objId");
                layer.confirm('确认删除视频 \"'+ data.title + '\" ?', {title:'提示'}, function(index){
                    $.get('manager/video/detail/del?id='+id1,function (data) {
                        if (data >= 1){
                            layer.msg("删除成功");
                            obj.del();
                        }else{
                            layer.msg("删除失败");
                        }
                    });
                    layer.close(index);
                });
                break;
        }
    });

})
</script>

</body>
</html>
