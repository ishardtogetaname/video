<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">
    body .login-class .layui-layer-title{font-size: 20px;color: #000;}
    body .login-class .layui-layer-btn a{background:#333;}
    body .login-class .layui-layer-btn .layui-layer-btn1{background:#999;}
</style>
<%--顶部--%>
<div class="movie-header all-container" >
    <div class="layui-container" style="width: 80%;" >
        <%--logo--%>
        <a href="index.jsp" style="position: relative">
            <img src="static/images/logo.png" alt="logo">
            <span class="movie-logo-font">想看视频</span>
        </a>

        <%--关键字搜索input输入框--%>
        <div class="layui-input-inline" style="margin: 10px auto;text-align:center;width: 70%;display: inline-block" >
            <input type="text" name="title" placeholder="请输入视频名称" class="input-search"/><%--
    --%><button type="button" class="layui-btn layui-btn-normal" onclick="showSearchTip()" style="vertical-align: middle;border-bottom-right-radius: 5px;border-top-right-radius: 5px; " >
            <img src="static/images/search.png" height="13px" style="vertical-align: middle">
            <span style="vertical-align: middle;">搜索</span>
        </button>
        </div>

        <%--模糊查询div--%>
        <div class="searchTipDiv">
        </div>

        <%--用户头像--%>
        <ul class="layui-nav fly-nav-user" style="background: #000;">
            <li class="layui-nav-item">
                <a class="fly-nav-avatar" href="javascript:">
                    <img src="static/images/用户.png">
                    <cite class="layui-hide-xs" style="color: #fff;margin-left: 5px;"></cite>
                </a>
                <dl class="layui-nav-child">
                </dl>
            </li>
        </ul>
    </div>

    <%--后台登录链接--%>
    <a href="jsp/manager/login.jsp" target="_blank" style="position: absolute;right: 50px;top: 0;line-height: 60px;">
        <span style="text-align: center;vertical-align: middle;color: #fff;">进入后台</span>
    </a>

<script src="static/plugins/layui/lay/modules/layer.js"></script>
<script>
    /**
     * 用户信息模块
     */
    var child = $(".layui-nav-child");
    //头像和用户名显示,给选项绑定点击事件
    if(${sessionScope.user != null}){
        if (${sessionScope.user.img != ''}){
            $(".fly-nav-avatar img").attr("src",'/${sessionScope.user.img}');
        }
        $(".fly-nav-avatar cite").html('${sessionScope.user.username}');
        //给选项绑定点击事件
        child.on("click","#logout",function () {
            $.post("user/logout");
            location.reload();
        });
    }else{
        $(".fly-nav-avatar img").attr("src",'static/images/用户.png');
        $(".fly-nav-avatar cite").html('未登录');
    }

    //鼠标移动到头像时显示选项
    $(".fly-nav-avatar").mouseover(function () {
        var data = "";
        if(${sessionScope.user != null}){
            data ="<dd id='userHome'><a href=\"user/home?id=${sessionScope.user.id}\" target='_blank'><i class=\"layui-icon\" style=\"margin-left: 2px; font-size: 22px;\">&#xe68e;</i>我的主页</a></dd>" +
                "<hr style=\"margin: 5px 0;\">" +
                "<dd id='logout'><a href=\"javascript:\" style=\"text-align: center;\">退出</a></dd>";
        }else{
            data = "<dd id='login'><a href=\"javascript:\"><i class=\"layui-icon\">&#xe66f;</i>登录</a></dd>"+
                "<dd id='register'><a href=\"jsp/user/register.jsp\" target='_blank'><img src='static/images/register.png' height='27px' style='margin-right: 8px;'>注册</a></dd>"
        }
        child.html(data);
        child.show();
    });
    //鼠标移出时隐藏选项
    $(".layui-nav-item").mouseleave(function () {
        child.hide();
    });

    /**
     * 设置搜索提示的显示与隐藏
     */
    var searchInp = $(".input-search");
    var searchTipDiv = $(".searchTipDiv");

    searchInp.on("focus keyup",function (event) {
        /*按下Enter键时触发搜索按钮*/
        if(event.keyCode == 13){
            $(".layui-btn").trigger('click');
        }
        showSearchTip();
    });

    /*获取搜索提示数据并显示*/
    function showSearchTip(){
        if(searchInp.val()!='' && searchInp.val()!=' '){
            $.ajax({
                url:"video/getByName/"+searchInp.val().trim()
                ,type:"get"
                ,success:function (data) {
                    if (data.length != 0) {
                        //最多显示10条提示
                        var t = data.length;
                        if (t > 10) {
                            t = 10;
                        }
                        var tipsResult='';
                        for (var i = 0; i < t; i++) {
                            tipsResult += "<a href='javascript:void(0)'>&nbsp;&nbsp;&nbsp;"+data[i].name+"</a>"
                        }
                        searchTipDiv.html(tipsResult);
                        searchTipDiv.css('display','inline-block');
                    }else{
                        searchTipDiv.css('display','none');
                    }
                }
            });
        }else{
            searchTipDiv.css('display','none');
        }
    }

    /*绑定搜索点击事件*/
    searchTipDiv.on('mousedown','a',function () {
        showVideo("video/getByName/" + $(this).text().trim(),1,pageInfo.pageSize);
        location.href="#skip";
    });
    $(".layui-btn").click(function () {
        var value = searchInp.val();
        if(value == '' || value == " "){
            showVideo("video/getAll/",1,pageInfo.pageSize);
        }else{
            showVideo("video/getByName/" + value.trim(),1,pageInfo.pageSize);
        }
        location.href="#skip";
    });

    /*搜索提示div失去焦点时隐藏*/
    searchInp.focusout(function () {
        searchTipDiv.css('display','none');
    });


/**
 * layui弹窗
 */
layui.use('layer', function(){
var layer = layui.layer;

    // 按下ESC按钮关闭弹层
    $('body',document).on('keyup', function (e) {
        if (e.which === 27) {
            layer.close(layer.index);
        }
    });

    //点击登录弹出登录窗口
    child.on("click","#login",function () {
            var html = "<div class=\"loginDiv\">" +
                "<div class=\"input-line\">" +
                "<i></i>" +
                "<input type=\"text\" placeholder=\"用户名/手机号\" class=\"input-text\">" +
                "</div>" +
                "<div class=\"input-line\">" +
                "<i style='background-image: url(\"/video/static/images/密码.png\");'></i>" +
                "<input type=\"password\" placeholder=\"密码\" class=\"input-text\">" +
                "</div>" +
                "<div class=\"input-code-div\">" +
                "<input type=\"text\" placeholder=\"验证码\" class=\"input-code\">" +
                "<img src=\"user/getCode?date="+new Date().getMilliseconds()+"\" class=\"codeImage\"/>" +
                "</div>"+
                "<div>" +
                "<a href=\"jsp/user/register.jsp\" target='_blank'>立即注册</a>" +
                "<a href=\"\">忘记密码?</a>" +
                "</div>"+
                "<input type=\"button\" class=\"btn-login\" value='登 &nbsp;&nbsp;&nbsp;&nbsp;录'>" +
                "</div>";
            //用户登录弹窗
            layer.open({
                title: '用户登录'
                ,type:1
                ,area: ['500px', '400px']
                ,skin:'login-class'
                ,offset:'150px'
                ,content: html
            });
        });
    });

    var body = $("body");

    //验证码切换图片
    body.on("click",".codeImage",function () {
        $(".codeImage").attr("src","user/getCode?date="+new Date().getMilliseconds());
    });

    //登录窗口，按enter键进行登录提交
    body.on("keyup",".input-text,.input-code",function (event) {
        /*按下Enter键时触发*/
        if(event.keyCode == 13){
            $(".btn-login").trigger('click');
        }
    });

    //登录提交
    body.on("click",".btn-login",function () {
        var usernameInp = $(".input-text:eq(0)");
        var pwdInp = $(".input-text:eq(1)");
        var codeInp =$(".input-code");
        //验证用户名是否为空
        if (usernameInp.val() == ""){
            showErrorMsg("用户名不能为空");
            return false;
        }
        //验证密码是否为空
        if (pwdInp.val() == ""){
            showErrorMsg("密码不能为空");
            return false;
        }
        //验证码是否为空
        if (codeInp.val() == ""){
            showErrorMsg("请输入验证码");
            return false;
        }
        //请求用户信息
        $.get("user/login/"+usernameInp.val().trim()+"/"+pwdInp.val().trim()+"/"+codeInp.val().trim().toLowerCase(),function (data) {
            //用户名是否存在
            if(data == null || data ==""){
                showErrorMsg("用户不存在");
                return false;
            }
            //密码是否正确
            if (data == "success") {
                location.reload();
            }else{  //密码不正确
                showErrorMsg(data);
                return false;
            }

        })
    });

    //弹出错误提示窗口
    function showErrorMsg(msg){
        layer.open({
            title: '错误'
            ,id:"msg"
            ,content: msg
            ,offset:'250px'
            ,success:function (layero, index) {
                /*按下Enter键时关闭当前窗口*/
                body.on("keydown",function(event) {
                    if(event.keyCode == 13){
                        layer.close(index);
                    }
                });
            }
        });
    }



</script>
</div>