<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>Title</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="../../static/css/video_play.css">
    <link rel="stylesheet" href="../../static/css/movieglobal.css">
    <script src="../../static/plugins/jquery/jquery.js"></script>
</head>
<body>
<div class="player">
    <div class="playScreen"></div>
    <i class="iconfont centerPlayBtn">&#xe737;</i>
    <video preload="auto" >
        <source src="file/video/videos/分手大师 BD1280高清国语中英双字.mkv" type="video/mp4">
    </video>
    <div style="" class="controls">
        <i class="iconfont controlsBtn playBtn icon-play"></i>
        <span class="time-text">0:00 / 1:53:51</span>
        <div>
            <i class="iconfont controlsBtn rightBtn icon-more"></i>
            <i class="iconfont controlsBtn rightBtn icon-fullscreen"></i>
            <div class="volume">
                <i class="iconfont controlsBtn icon-volume"></i>
                <div class="volume-bar"></div>
            </div>
        </div>
        <div class="progress-bar">
            <div class="loaded"></div>
            <div class="elapse"></div>
        </div>
    </div>
</div>

<script>
    var video = $("video")[0];
    var playScreen=$(".playScreen");
    var centerBtn = $(".centerPlayBtn");
    /*播放暂停*/
    $(".playScreen,.centerPlayBtn,.playBtn").click(function (ev) {
        if(video.paused){
            video.play();
            centerBtn.css('display',"none");
        }else{
            video.pause();
            centerBtn.css('display',"block");
        }
        $(".playBtn").toggleClass("icon-play icon-bofangzanting");
    });
    $(document).keydown(function (ev) {
        if (ev.keyCode == 32){
            if(video.paused){
                video.play();
                centerBtn.css('display',"none");
            }else{
                video.pause();
                centerBtn.css('display',"block");
            }
            $(".playBtn").toggleClass("icon-play icon-bofangzanting");
        }
    });

    /*3.实现全屏操作*/
    $(".rightBtn:eq(1)").click(function(){
        /*全屏>>不同浏览器需要添加不同的前缀>>能力测试*/
        if(video.requestFullScreen){
            video.requestFullScreen();
        }
        else if(video.webkitRequestFullScreen){
            video.webkitRequestFullScreen();
        }
        else if(video.mozRequestFullScreen){
            video.mozRequestFullScreen();
        }
        else if(video.msRequestFullScreen){
            video.msRequestFullScreen();
        }
    });

</script>
</body>
</html>
