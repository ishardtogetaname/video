<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>用户注册</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="static/css/movieglobal.css">
    <link rel="stylesheet" href="static/css/register.css">
    <link rel="stylesheet" href="static/plugins/layui/css/layui.css">
    <script src="static/plugins/layui/layui.js"></script>
    <script src="static/plugins/jquery/jquery.js"></script>
</head>
<body>
    <div class="register-header register-container">
        <img src="static/images/logo.png" style="vertical-align: middle;" alt="logo">
        <span class="movie-logo-font">想看视频</span>
        <span class="vertical-line"></span>
        <label>用户注册</label>
    </div>
    <div class="register-content">
        <div class="register-container">
            <form action="user/register" method="post" >
                <div class="register-input-line">
                    <span>用户名：</span>
                    <input type="text" class="register-input" name="username" placeholder="请输入用户名">
                    <label class="register-input-error"></label>
                </div>
                <div class="register-input-line">
                    <span>手机号：</span>
                    <input type="text" class="register-input" name="phone" placeholder="请输入手机号">
                    <label class="register-input-error"></label>
                </div>
                <div class="register-input-line">
                    <span>手机验证码：</span>
                    <input type="text" class="register-input" style='width: 150px' placeholder="请输入验证码">
                    <a class="register-btn">获取验证码</a>
                    <label class="register-input-error"></label>
                </div>
                <div class="register-input-line">
                    <span>上传头像：</span>
                    <input type="hidden" name="img" value="">
                    <div class="layui-upload-drag" style="float: left" id="upload">
                        <i class="layui-icon"></i>
                        <p>点击上传，或将图片拖拽到此处</p>
                    </div>
                    <div class="register-image-div"></div>
                </div>
                <div class="register-input-line">
                    <span>密码：</span>
                    <input type="password" class="register-input" name="password" placeholder="请输入密码">
                    <label class="register-input-error"></label>
                </div>
                <div class="register-input-line">
                    <span>确认密码：</span>
                    <input type="password" class="register-input" placeholder="再次输入密码">
                    <label class="register-input-error"></label>
                </div>
                <div class="register-input-agree-line">
                    <input type="checkbox" id="agree" style="vertical-align: middle;" >我同意<a href="#">《服务协议》</a>、<a
                        href="#">《隐私政策》</a>
                    <label class="register-input-error" style="float: none;"></label>
                </div>
                <div class="register-input-submit-line">
                    <input type="submit" class="register-input-submit-btn" onclick="return submitClick()" value="注 册">
                </div>
            </form>
        </div>
    </div>

<script type="text/javascript">

    /**
     * 表单信息验证
     */
    //用户名验证
    var username = $(".register-input:eq(0)");
    var nameError = $(".register-input-error:eq(0)");
    username.blur(function () {
        nameVerify();
    });
    function nameVerify() {
        if (username.val() == "" || username.val()==null){
            nameError.css("color","red").html("用户名不能为空！");
            return false;
        }else if(/^[\w\u4e00-\u9fa5]{3,15}$/.test(username.val())){
            nameError.css("color","green").html("✔");
            return true;
        }else{
            nameError.css("color","red").html("请输入3-15个数字、汉字、字母或下划线");
            return false;
        }
    }

    //手机号验证
    var phoneInp = $(".register-input:eq(1)");
    var phoneErroe = $(".register-input-error:eq(1)");
    phoneInp.blur(function () {
        phoneVerify();
    });
    function phoneVerify() {
        if (phoneInp.val() == "" || phoneInp.val()==null){
            phoneErroe.css("color","red").html("手机号不能为空！");
            return false;
        }else if(/^1[3456789]\d{9}$/.test(phoneInp.val())){
            phoneErroe.css("color","green").html("✔");
            return true;
        }else{
            phoneErroe.css("color","red").html("请输入有效的手机号");
            return false;
        }
    }

    //密码验证
    var pwdInp = $(".register-input:eq(3)");
    var pwdError = $(".register-input-error:eq(3)");
    pwdInp.blur(function () {
        pwdVerify();
    });
    function pwdVerify() {
        if (pwdInp.val() == "" || pwdInp.val()==null){
            pwdError.css("color","red").html("密码不能为空！");
            return false;
        }else if(/^.{6,20}$/.test(pwdInp.val())){
            pwdError.css("color","green").html("✔");
            return true;
        }else{
            pwdError.css("color","red").html("6-20个任意字符");
            return false;
        }
    }

    //确认密码
    var pwdConfirmInp = $(".register-input:eq(4)");
    pwdConfirmInp.blur(pwdConfirmVerify);
    function pwdConfirmVerify(){
        var elem = pwdConfirmInp;
        var error = $(".register-input-error:eq(4)");
        var password = pwdInp.val();

        if (elem.val() == "" || elem.val()==null){
            error.css("color","red").html("确认密码不能为空！");
            return false;
        }else if (elem.val().length < 6 || elem.val().length > 20) {
            error.css("color","red").html("6-20个任意字符");
            return false;
        }else if(elem.val() == password ){
            error.css("color","green").html("✔");
            return true;
        }else{
            error.css("color","red").html("密码不一致");
            return false;
        }
    }

    //手机验证码验证
    var codeInp = $(".register-input:eq(2)");
    codeInp.blur(codeVerify);
    function codeVerify(){
        var elem = codeInp;
        var error = $(".register-input-error:eq(2)");
        if(elem.val() == "" || elem.val()==null){
            error.css("color","red").html("请输入验证码！");
            return false;
        }else if (elem.val() == "9527"){
            error.css("color","green").html("✔");
            return true;
        }else {
            error.css("color","red").html("验证码不正确");
            return false;
        }
    }

    //协议选项验证
    var agree = $(":checkbox");
    agree.click(function () {
        isCheck();
    });
    function isCheck() {
        if(!agree.is(":checked")){
            $(".register-input-error:eq(5)").css("color","red").html("请同意服务协议、隐私政策");
            return false;
        }else{
            $(".register-input-error:eq(5)").css("color","green").html("");
            return true;
        }
    }

    //控制表单提交
    function submitClick() {
        var codeFlag = codeVerify();
        var nameFlag = nameVerify();
        var phoneFlag = phoneVerify();
        var pwdFlag = pwdVerify();
        var pwdConfirmFlag = pwdConfirmVerify();
        var isAgree = isCheck();

        var flag = codeFlag && pwdFlag && nameFlag && phoneFlag && pwdConfirmFlag && isAgree;
        return  flag;
    }



layui.use(["layer",'upload'],function () {
    var layer = layui.layer
    ,upload = layui.upload;

    var btn = $(".register-btn");
    btn.one("click",btnClick);
    /**
     * 手机验证码计时器
     */
    function btnClick() {
        var time = 60;
        btn.html(time + "s");
        btn.css({background:"#ededed",cursor:"default"});
        layer.msg("发送成功");

        var timer = setInterval(function () {
            time--;
            btn.html(time + "s");
            if (time == 0){
                btn.one("click",btnClick);
                btn.css({background:"#fafafa",cursor:"pointer"});
                btn.html("重新发送");
                clearInterval(timer);
            }
        },1000);
    }

    /**
     * 上传头像
     */
    //拖拽上传
    upload.render({
        elem: '#upload'
        ,url: 'user/imageUpload'
        ,done: function(res){
            if (res.code == 0) {//上传失败
                return layer.msg('上传失败');
            }else if(res.code == 1){
        $(".register-image-div").css({background:"url("+res.src+") no-repeat center","background-size":"100% 100%"});
        $("input[name='img']").val(res.src);
    }}});

});
</script>
</body>
</html>
