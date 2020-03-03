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
    <link rel="stylesheet" href="static/css/video_play.css">
    <link rel="stylesheet" href="static/css/movieglobal.css">
    <script src="static/plugins/jquery/jquery.js"></script>
    <link rel="stylesheet" href="static/plugins/layui/css/layui.css"/>
    <link rel="stylesheet" href="static/css/global.css"/>
    <script src="static/plugins/layui/layui.js"></script>
    <script src="static/js/movie.js"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/jsp/common/header.jsp"/>

    <div class="container">
        <h2 class="title" >${video.name}</h2>
        <div class="player">
            <video preload="auto" controls poster width="800px" height="450px" style="float: left;">
                <c:forEach var="episode" items="${episodes}">
                    <c:if test="${episode.id == detail.id}">
                        <source src="file/video/videos/${episode.fileName}" type="video/mp4">
                    </c:if>
                </c:forEach>
            </video>
            <div class="episode">
                <h3 class="">视频选集</h3>
                <div class="line"></div>
                <div>
                    <c:forEach var="episode" items="${episodes}">
                        <c:if test="${episode.id == detail.id}">
                            <a style="display: block;" class="episodeFontCurrent">p${detail.episode}&nbsp;&nbsp; ${detail.title}</a>
                        </c:if>
                        <c:if test="${episode.id != detail.id}">
                            <a href="video/play?id=${episode.id}" style="display: block;" class="episodeFont">p${detail.episode}&nbsp;&nbsp; ${detail.title}</a>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </div>

        <div>
            <div class="hrFont">
                <div></div>
                <span> 下载 </span>
                <div></div>
            </div>
            <div class="episodeList">
                <ul>
                    <c:forEach var="episode" items="${episodes}">
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
                            </div>
                            <hr>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>

    <jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>
<script>
    layui.use('element', function() {
        var element = layui.element;
    });

    var firstPlayFlag = true;
    $("video").on("play",function () {
        if(${sessionScope.user != null}){
            if(firstPlayFlag){
                $.ajax({
                    url:"user/addHistory"
                    ,type:"post"
                    ,data:{"vid":${video.id},"uid":${sessionScope.user.id},"name":'${video.name}',"img":'${video.imgSrc}',"title":'${detail.title}',"episode":${detail.episode}}
                    ,success:function () {
                    }
                });
                firstPlayFlag = false;
            }
        }
    })
</script>
</body>
</html>
