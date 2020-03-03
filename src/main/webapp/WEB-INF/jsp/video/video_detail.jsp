<%@ page import="com.example.pojo.User" %>
<%@ page import="com.example.pojo.Video" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="static/css/movieglobal.css">
    <link rel="stylesheet" href="static/plugins/layui/css/layui.css"/>
    <link rel="stylesheet" href="static/css/global.css">
    <link rel="stylesheet" href="static/css/video_detail.css">
    <script src="static/plugins/layui/layui.js"></script>
    <script src="static/plugins/jquery/jquery.js"></script>
</head>
<body>
    <jsp:include page="/jsp/common/header.jsp"/>
    <div class="container">
        <div class="detail-div">
            <img src="${video.imgSrc}" alt="${video.name}" title="${video.name}">
            <div class="description-div">
                <div>
                    <h1>${video.name}</h1>
                    <em>主演：</em>
                    <p class="pShow">${video.starring}</p>
                    <em>分类：</em>
                    <p class="pShow">
                        <c:if test="${video.categoryList == null}">我忘了</c:if>
                        <c:forEach items="${video.categoryList}" var="category">
                            ${category.categoryName}
                        </c:forEach>
                    </p>
                    <em>状态：</em>
                    <p class="pShow">
                        <c:if test="${video.finished}">已完结  全${video.totalEpisode}集</c:if>
                        <c:if test="${!video.finished}">连载中  连载至${video.currentEpisode}集</c:if>
                    </p>
                    <em>简介：</em>
                    <p class="pShow" val="${video.description}"></p>
                </div>
                <a href="javascript:void(0)" style="background: #30aaff"><i class="iconfont">&#xe661;</i>点击收藏</a>
            </div>
        </div>

        <div class="hrFont">
            <div></div>
            <span>分集列表</span>
            <div></div>
        </div>

        <div class="episodeList">
            <ul>
                <C:forEach var="episode" items="${episodes}">
                    <li>
                        <div class="episode-div">
                            <c:if test="${video.finished == true and video.totalEpisode ==1}">
                                <span>全 1 集</span>
                            </c:if>
                            <c:if test="${video.totalEpisode !=1}">
                                <span>第 ${episode.episode} 集</span>
                            </c:if>
                            <span>${episode.title}</span>
                            <a href="video/download?fileName=${episode.fileName}" target="_blank" class="downloadBtn" path="${episode.fileName}">下载</a>
                            <a href="video/play?id=${episode.id}" class="playBtn" >播放</a>
                        </div>
                        <hr>
                    </li>
                </C:forEach>
            </ul>
        </div>
    </div>

    <jsp:include page="/jsp/common/footer.jsp"/>

<script>
layui.use(['layer','element'],function () {
    var layer = layui.layer
    ,element = layui.element;

    layer.config({
        offset:'250px'
    });
/*---------------------------- 视频下载模块 start -----------------------------------------------------------------------------------------------*/
    var downloadBtn = $(".episode-div a:eq(0)");
    //解决下载链接ie浏览器url中文乱码
    var fileName = encodeURI(downloadBtn.attr("path"));
    downloadBtn.attr("href","video/download?fileName="+fileName);
    /*未登录不能进行下载*/
    <%--downloadBtn.click(function () {--%>
    <%--    if (${sessionScope.user == null}) {--%>
    <%--        layer.alert("请先登录",{--%>
    <%--            id:'msg'--%>
    <%--            ,success:function (layero, index) {--%>
    <%--                /*按下Enter键时关闭当前窗口*/--%>
    <%--                $("body").on("keydown",function(event) {--%>
    <%--                    if(event.keyCode == 13){--%>
    <%--                        layer.close(index);--%>
    <%--                    }--%>
    <%--                });--%>
    <%--            }--%>
    <%--        });--%>
    <%--        return false;--%>
    <%--    }--%>
    <%--});--%>
/*---------------------------- 视频下载模块 end -----------------------------------------------------------------------------------------------*/

/*---------------------------- 简介展开与收缩 start -----------------------------------------------------------------------------------------------*/
    /*简介展开收起*/
    var description = $(".pShow:last-child");
    var content = description.attr("val");
    var flag = false;
    description.html(content.substring(0,150) + '... <span>展开全部>></span>');
    description.on('click','span',function () {
        if (flag){
            description.html(content.substring(0,150) + '... <span>展开全部>></span>');
            flag = false;
        }else{
            description.html(content + ' <span>收起<<</span>');
            flag = true;
        }
    });
/*---------------------------- 简介展开与收缩 end -----------------------------------------------------------------------------------------------*/

/*---------------------------- 收藏视频 start -----------------------------------------------------------------------------------------------*/
    var url = "user/collection/add?vid=${video.id}";
    var collectionFlag = false;
    /*查询数据库查看是否已收藏*/
    if(${sessionScope.user != null}){
        $.ajax({
            url:'user/collection/get'
            ,method:'post'
            ,data:{"uid":'${sessionScope.user.id}'}
            ,success:function (data) {  //data为收藏的视频的list
                for(var i=0;i<data.length;i++){
                    //如果已收藏
                    if('${video.id}' == data[i].id){
                        $(".description-div a").css("background",'#ff5a58').html('取消收藏');
                        url = "user/collection/del?vid=${video.id}";
                        collectionFlag = true;
                    }
                }
            }
        });
    }
    /*绑定收藏点击事件*/
    $(".description-div a").on("click",function () {
        /*未登录*/
        if (${sessionScope.user == null}) {
            layer.alert("请先登录",{
                id:'msg'
                ,success:function (layero, index) {
                    /*按下Enter键时关闭当前窗口*/
                    $("body").on("keydown",function(event) {
                        if(event.keyCode == 13){
                            layer.close(index);
                        }
                    });
                }
            });
            return false;
        }
        /*更新css样式和后台数据库*/
        $.ajax({
            url:url
            ,success:function () {
                if (collectionFlag){
                    $(".description-div a").css("background",'').html('<i class="iconfont">&#xe661;</i>点击收藏');
                    url = "user/collection/add?vid=${video.id}";
                    layer.msg("已取消");
                    collectionFlag = false;
                } else{
                    $(".description-div a").css("background",'#ff5a58').html('取消收藏');
                    url = "user/collection/del?vid=${video.id}";
                    layer.msg("收藏成功");
                    collectionFlag = true;
                }
            }
            ,error:function () {
                if (collectionFlag) {
                    layer.msg("收藏失败");
                }else{
                    layer.msg("取消失败");
                }
            }
        })

    });
/*---------------------------- 收藏视频 end -----------------------------------------------------------------------------------------------*/
});

</script>
</body>
</html>
