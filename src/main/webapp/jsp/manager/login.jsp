<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>管理员登录</title>
    <base href="<%=basePath%>">
    <script src="static/plugins/layui/layui.js"></script>
    <style type="text/css">
        body{background: #eeeeee;}
        .login-div{width: 30%;margin: 150px auto;background: #fff;border-radius: 5px;}
        .title-div{height: 40px;background: #8FCDA0;border-top-left-radius: 5px;border-top-right-radius: 5px;}
        .title-text{display: inline-block;margin: 6px 20px;color: #232323;}
        .login-form{padding: 15px 0;}
        .login-form div{margin-bottom: 20px;}
        .login-form label{display: inline-block;font-size: 15px;color: black;font-weight: 600; width: 100px;text-align: right;}
        .login-form input{margin-left: 10px; width: 50%;height: 30px;color: #000;font-size: 15px; outline: none;padding-left: 8px; border: 1px solid #a09d94;border-radius: 5px;}
        .login-form div:nth-child(3) input{width: 25%;}
        .login-form input[type='submit']{margin: 10px 0 20px 125px;padding: 0;background: #1ac4f9;color: #fff;border: 0;width: 30%;cursor: pointer;}
        .login-form input[type='submit']:hover{background: #1ba5f9;}
        .code-img{height: 30px;vertical-align: middle;cursor: pointer;}
    </style>
</head>
<body>
    <div class="login-div">
        <div class="title-div">
            <span class="title-text">管理员登录</span>
        </div>

        <form class="login-form" method="post">
            <div>
                <label for="name">用户名：</label>
                <input type="text" id="name" name="name" placeholder="请输入用户名">
            </div>
            <div>
                <label for="password">密 码：</label>
                <input type="password" id="password" name="password" placeholder="请输入密码">
            </div>
            <div>
                <label for="verify">验证码：</label>
                <input type="text" id="verify" name="code" placeholder="请输入验证码">
                <img src="manager/getCode?date=<%=new Date().getTime()%>" class="code-img"  alt="">
            </div>
            <input type="submit" value="登录">
        </form>
    </div>

<script>
    var code = document.getElementsByClassName("code-img").item(0);
    code.onclick = function () {
        code.src="manager/getCode?date="+new Date().getMilliseconds();
    };
    layui.use(['jquery','layer'],function () {
        var $ = layui.jquery
            ,layer = layui.layer;

        $("form").submit(function () {
            return false;
        });

        $("input[type=submit]").click(function(){
            var name = $("input[name='name']").val();
            var password = $("input[name='password']").val();
            var code = $("input[name='code']").val();

            $.ajax("manager/login",{
                type:'post'
                ,data:{"name":name,"password":password,"code":code}
                ,dataType:"json"
                ,success:function (data) {
                    if(data.loginCode == 0){
                        layer.open({
                            offset:'200px'
                            ,id:'msg'
                            ,content:data.loginMsg
                            ,success:function (layero, index) {
                                /*按下Enter键时关闭当前窗口*/
                                $("body").on("keydown", function (event) {
                                    if (event.keyCode == 13) {
                                        layer.close(index);
                                    }
                                })
                            }
                        });
                    }else if (data.loginCode == 1){
                        location.href="manager/toIndex";
                    }
                }
            });
        });


    })
</script>
</body>
</html>
