<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>用户首页</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="static/css/userHome.css">
    <link rel="stylesheet" href="static/plugins/layui/css/layui.css"  media="all">
    <link rel="stylesheet" href="static/css/movieglobal.css">
    <link rel="stylesheet" href="static/css/global.css"/>
    <script src="static/plugins/layui/layui.js"></script>
    <script src="static/plugins/jquery/jquery.js"></script>
    <script src="static/js/movie.js"></script>
</head>
<body>
    <jsp:include page="/jsp/common/header.jsp"/>
    <div class="container">
        <div class="avatarDiv" title="点击切换头像">
            <img class="homeAvatar" id="upload" src="${sessionScope.user.img}">
        </div>
        <div class="tabDiv">
            <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
                <ul class="layui-tab-title">
                    <li class="layui-this">个人信息</li>
                    <li>修改信息</li>
                    <li>我的收藏</li>
                    <li>历史记录</li>
                </ul>
                <div class="layui-tab-content" >
                    <%--个人信息--%>
                    <div class="layui-tab-item layui-show infoDiv">
                        <div>
                            <label class="label">用户名：</label>
                            <input type="text" disabled="false" class="infoInp input" >
                        </div>
                        <div>
                            <label class="label">手机号：</label>
                            <input type="text" disabled="false" class="infoInp input">
                        </div>
                        <div>
                            <label class="label">年 龄：</label>
                            <input type="text" disabled="false" class="infoInp input">
                        </div>
                        <div>
                            <label class="label">性 别：</label>
                            <input type="text" disabled="false" class="infoInp input">
                        </div>
                        <div>
                            <label class="label">生 日：</label>
                            <input type="text" disabled="false" class="infoInp input">
                        </div>
                    </div>

                    <%--修改用户信息--%>
                    <div class="layui-tab-item updateDiv infoDiv">
                        <form action="user/update" method="post">
                            <input type="hidden" name="id" value="${sessionScope.user.id}">
                            <div>
                                <label class="label">用户名：</label>
                                <input type="text" name="username" value="${sessionScope.user.username}" class="input" >
                            </div>
                            <div>
                                <label class="label">手机号：</label>
                                <input type="text" name="phone" value="${sessionScope.user.phone}" class="input">
                            </div>
                            <div>
                                <label class="label">密 码：</label>
                                <input type="text" name="password" value="${sessionScope.user.password}" class="input">
                            </div>
                            <div>
                                <label class="label">年 龄：</label>
                                <input type="text" name="age" value="${sessionScope.user.age}" class="input">
                            </div>
                            <div>
                                <label class="label">性别：</label>
                                <input id="man" type="radio" value="男" name="sex">
                                <label for="man"> 男 </label>
                                &nbsp;&nbsp;
                                <input id="female" type="radio" value="女" name="sex">
                                <label for="female"> 女 </label>
                            </div>
                            <div>
                                <label class="label">生 日：</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="birthday" value="${sessionScope.user.birthday}" class="input" id="date" placeholder="yyyy-MM-dd">
                                </div>
                            </div>
                            <input type="submit" value="提交" class="submitBtn">
                        </form>
                    </div>

                    <%--我的收藏--%>
                    <div class="layui-tab-item">
                        <c:if test="${fn:length(collections) == 0}">
                            <h5 style="height: 30px;line-height: 30px;margin:30px 0 30px 20px;">暂无收藏</h5>
                        </c:if>
                        <c:if test="${fn:length(collections) != 0}">
                            <ul class="collectionsList">
                            <c:forEach var="collection" items="${collections}" varStatus="vs">
                                <c:if test="${vs.index%6 == 0 && vs.index!=0}">
                                    </ul>
                                    <ul class="collectionsList">
                                </c:if>
                                <li>
                                    <a href="video/detail/${collection.id}" target="_blank" class="img-block"><img src="${collection.imgSrc}" alt=""></a>
                                    <a href="video/detail/${collection.id}" target="_blank" class="name-block">${collection.name}</a>
                                </li>
                                <c:if test="${vs.last && vs.index%5 != 0}">
                                    </ul>
                                </c:if>
                            </c:forEach>
                        </c:if>
                    </div>

                    <%--历史记录--%>
                    <div class="layui-tab-item">
                        <c:if test="${fn:length(histories) == 0}">
                            <h3 style="height: 30px;line-height: 30px;margin:30px 0 30px 20px;">您还没开始看视频哦！</h3>
                        </c:if>
                        <ul class="layui-timeline" style="margin-top: 20px;">
                            <c:if test="${histories != null}">
                                <c:forEach items="${histories}" var="history">
                                    <li class="layui-timeline-item">
                                        <i class="layui-icon layui-timeline-axis"></i>
                                        <div class="layui-timeline-content layui-text">
                                            <div class="layui-timeline-title">
                                                <a href="video/detail/${history.vid}" target="_blank"><img src="${history.img}" height="140px" width="100px" style="vertical-align: middle"></a>
                                                <div style="display: inline-block;margin-left: 10px;height: 140px;vertical-align: middle;">
                                                    <a href="video/detail/${history.vid}" style="text-decoration: none;" target="_blank"><h3>${history.name}</h3></a>
                                                    <p style="margin-top: 10px;">第${history.episode}集 ${history.title}</p>
                                                    <p style="position: absolute;bottom: 0;">${history.time.getYear()+1900}-${history.time.getMonth()+1}-${history.time.getDate()} ${history.time.getHours()}:${history.time.getMinutes()}:${history.time.getSeconds()}</p>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </c:forEach>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

<script>
    if (${errorMsg!=null}){
        alert('${errorMsg}');
        window.location.href='index.jsp';
    }
    /*展示用户信息*/
    if(${sessionScope.user.username != null}){
        $(".layui-show input:eq(0)").attr("value",'${sessionScope.user.username}');
    }else{
        $(".layui-show input:eq(0)").attr("value",'未登录');
    }
    if(${sessionScope.user.phone != null}){
        $(".layui-show input:eq(1)").attr("value",'${sessionScope.user.phone}');
    }else{
        $(".layui-show input:eq(1)").attr("value",'未登录');
    }
    if(${sessionScope.user.img!=null}){
        $(".homeAvatar").attr('src',"/${sessionScope.user.img}");
    }else{
        $(".homeAvatar").attr('src',"static/images/用户.png");
    }
    if(${sessionScope.user.age != null and sessionScope.user.age != 0 }){
        $(".layui-show input:eq(2)").attr("value",'${sessionScope.user.age}');
    }else{
        $(".layui-show input:eq(2)").attr("value",'无');
    }
    if(${sessionScope.user.sex != null}){
        $(".layui-show input:eq(3)").attr("value",'${sessionScope.user.sex}');
    }else{
        $(".layui-show input:eq(3)").attr("value",'无');
    }
    if(${sessionScope.user.birthday != null}){
        var birthday = new Date('${sessionScope.user.birthday}');
        var formatDate = birthday.getFullYear()+ "-" + (birthday.getMonth()+1) +"-"+birthday.getDate();
        $(".layui-show input:eq(4)").attr("value",formatDate);
    }else {
        $(".layui-show input:eq(4)").attr("value",'无');
    }
    if(${sessionScope.user.sex!= null && sessionScope.user.sex!=''}){
        if(${sessionScope.user.sex == '男'}){
            $('#man').attr('checked',true);
        }
        if(${sessionScope.user.sex == '女'}){
            $('#female').attr('checked',true);
        }
    }

layui.use(['element','laydate','layer','upload'], function(){
    var element = layui.element
        ,laydate = layui.laydate
        ,layer = layui.layer
        ,upload = layui.upload;

    //日期选择器
    laydate.render({
        elem: '#date'
        ,trigger: 'click'
        ,value:formatDate
        ,done: function(value, date, endDate){
            console.log(value); //得到日期生成的值，如：2017-08-18
            $("input[name=birthday]").attr('value',value);
        }
    });

    //选项卡触发事件
    var active = {
        tabAdd: function(){
            //新增一个Tab项
            element.tabAdd('demo', {
                title: '新选项'+ (Math.random()*1000|0) //用于演示
                ,content: '内容'+ (Math.random()*1000|0)
                ,id: new Date().getTime() //实际使用一般是规定好的id，这里以时间戳模拟下
            })
        }
        ,tabDelete: function(othis){
            //删除指定Tab项
            element.tabDelete('demo', '44'); //删除：“商品管理”
            othis.addClass('layui-btn-disabled');
        }
        ,tabChange: function(){
            //切换到指定Tab项
            element.tabChange('demo', '22'); //切换到：用户管理
        }
    };

    $('.site-demo-active').on('click', function(){
        var othis = $(this), type = othis.data('type');
        active[type] ? active[type].call(this, othis) : '';
    });

    //Hash地址的定位
    var layid = location.hash.replace(/^#test=/, '');
    element.tabChange('test', layid);

    element.on('tab(test)', function(elem){
        location.hash = 'test='+ $(this).attr('lay-id');
    });


    //头像上传
    upload.render({
        elem: '#upload'
        ,url: 'user/imageUpdate'
        ,done: function(res){
            if (res.code == 0) {//上传失败
                return layer.msg('头像上传失败');
            }else if(res.code == 1){
                $(".homeAvatar").attr('src',"/"+res.src);
                $(".fly-nav-avatar img").attr("src","/"+res.src+"");
                return layer.msg('头像上传成功');
            }
        }
    });
});
</script>
</body>
</html>
