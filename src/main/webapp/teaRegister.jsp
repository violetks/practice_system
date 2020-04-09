<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>教师账号注册</title>
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/stuRegister.css">
</head>
<body>
<div id="register_box">
    <h2>教师注册</h2>
    <hr>
    <form action="${pageContext.request.contextPath}/TeaRegisterServlet" method="post" onsubmit="return checkAll()">
        <input type="hidden" name="form" value="true"/>
        <div id="form_info">
            <span>姓名：</span><input type="text" name="tName" id="tName" placeholder="请输入姓名"
                                   onblur="checkName()" required="required"/><br>
            <p class="error_msg" id="tname_error"></p>

            <span>密码：</span><input type="password" name="tpwd" id="tpwd" placeholder="请输入密码"
                                   onblur="checkPassword()" required="required"/><br>
            <p class="error_msg" id="tpwd_error"></p>

            <span>确认密码：</span><input type="password" name="confirmPwd" id="confirmPwd" placeholder="请确认密码"
                                     onblur="confirmPassword()" required="required" style="width:220px"/><br>
            <p class="error_msg" id="confirm_error"></p>

            <span>院系：</span><input type="text" name="dept" id="dept" placeholder="请输入所属院系"
                                   required="required"/>
            <p class="error_msg"></p>

            <span>电话：</span><input type="text" name="phone" id="phone" placeholder="请输入手机号"
                                   onblur="checkPhone()" required="required"/><br>
            <p class="${msg!=null?'error_msg_show':'error_msg'}" id="phone_error">${msg}</p>

            <span>验证码：</span><input type="text" name="SmsCheck" id="SmsCheck" placeholder="请输入验证码"
                                    onblur="checkSms()" required="required" style="width:125px"/>
            <input type="button" id="sendSmsBtn" name="sendSmsBtn" value="获取验证码"/>
            <br>
            <p class="error_msg" id="sms_error"></p>

            <input type="submit" value="注  册" id="register_btn">
        </div>
    </form>
</div>

<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>

<script type="text/javascript">
    // 1. 验证姓名
    function checkName() {
        var tName = document.getElementById("tName").value;
        var tnameError = document.getElementById("tname_error");
        // 姓名的规则：昵称的长度为1-15，包含任意的字母、数字、中文，不可以使用其他符号
        var reg = /^([\u4e00-\u9fa5]|[a-zA-Z0-9]){1,15}$/i;
        if (!reg.test(tName)) {
            tnameError.style.display = "block";
            document.getElementById("tName").style.marginBottom = "0px";
            tnameError.innerText = "昵称的长度为1-15，包含任意的字母、数字、中文，不可以使用其他符号";
            return false;
        } else {
            tnameError.style.display = "none";
            document.getElementById("tName").style.marginBottom = "30px";
            return true;
        }
    }

    // 2. 验证密码
    function checkPassword() {
        var tpwd = document.getElementById("tpwd").value;
        var tpwdError = document.getElementById("tpwd_error");
        // 密码的规则： 6-16，包含任意的字母、数字，不可以使用其他符号
        var reg = /^([a-zA-Z0-9]){6,16}$/i;
        if (!reg.test(tpwd)) {
            tpwdError.style.display = "block";
            document.getElementById("tpwd").style.marginBottom = "0px";
            tpwdError.innerText = "密码的长度为 6-16，包含任意的字母、数字，不可以使用其他符号";
            return false;
        } else {
            tpwdError.style.display = "none";
            document.getElementById("tpwd").style.marginBottom = "30px";
            return true;
        }
    }

    // 3. 确认密码
    function confirmPassword() {
        var tpwd = document.getElementById("tpwd").value;
        var confirmPwd = document.getElementById("confirmPwd").value;
        var confirmError = document.getElementById("confirm_error");
        //密码的规则： 6-16，包含任意的字母、数字，不可以使用其他符号
        var reg = /^([a-zA-Z0-9]){6,16}$/i;
        //确认密码输入符合规则  
        if (reg.test(confirmPwd)) {
            if (tpwd !== confirmPwd) {
                confirmError.style.display = "block";
                document.getElementById("confirmPwd").style.marginBottom = "0px";
                confirmError.innerText = "两次输入的密码不一致！";
                return false;
            } else {
                confirmError.style.display = "none";
                document.getElementById("confirmPwd").style.marginBottom = "30px";
                return true;
            }
        }
        //确认输入密码不符合规则
        else {
            confirmError.style.display = "block";
            document.getElementById("confirmPwd").style.marginBottom = "0px";
            confirmError.innerText = "密码的长度为 6-16，包含任意的字母、数字，不可以使用其他符号";
            return false;
        }
    }

    // 4. 验证手机号
    function checkPhone() {
        var phone = document.getElementById("phone").value;
        var phoneError = document.getElementById("phone_error");
        var reg = /^1(3|4|5|6|7|8|9)\d{9}$/i;
        if (!reg.test(phone)) {
            phoneError.style.display = "block";
            document.getElementById("phone").style.marginBottom = "0px";
            phoneError.innerText = "手机号格式错误！";
            return false;
        } else {
            phoneError.style.display = "none";
            document.getElementById("phone").style.marginBottom = "30px";
        }
    }

    // 5. 判断是否输入验证码
    function checkSms() {
        var SmsCheck = document.getElementById("SmsCheck").value;
        var smsError = document.getElementById("sms_error");
        if (SmsCheck === "" || SmsCheck === null) {
            smsError.style.display = "block";
            document.getElementById("SmsCheck").style.marginBottom = "0px";
            smsError.innerText = "请输入验证码";
            return false;
        } else {
            smsError.style.display = "none";
            document.getElementById("SmsCheck").style.marginBottom = "30px";
            return true;
        }
    }

    // 6. 点击发送验证码
    $("#sendSmsBtn").on("click", function () {
        var phone = $("input[name=phone]").val();
        if (phone === "" || phone === null) {
            $("#sms_error").css("display","block");
            $("#SmsCheck").css("margin-bottom","0px");
            $("#sms_error").text("请先输入手机号");
            return false;
        } else {
            $("#sms_error").css("display","none");
            $("#SmsCheck").css("margin-bottom","30px");

            $.ajax({
                url: "/SmsServlet",
                async: true,
                type: "post",
                dataType: "text",
                data: {"phone": phone},
                success: function (data) {
                    if (data === 'fail') {
                        alert("发送验证码失败");
                        return false;
                    }
                }
            });
            return true;
        }
    });

    // 7. 检查用户所有的输入的是否符合规则
    function checkAll() {
        var sname = checkName();
        var spwd = checkPassword();
        var confirmPwd = confirmPassword();
        var phone = checkPhone();
        var sms = checkSms();
        return sid && sname && spwd && confirmPwd && phone && sms;
    }
</script>
</body>
</html>
