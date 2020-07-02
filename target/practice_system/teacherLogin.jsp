<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>教师登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>
<div id="login_box">
    <h2>教师登录</h2>
    <form action="${pageContext.request.contextPath}/TeaLoginServlet" method="post" onsubmit="return checkAll()">
        <input type="hidden" name="form" value="true"/>
        <div id="form_info">
            <p class="${msg!=null?'error_msg_show':'error_msg'}" id="errorMsg">${msg}</p>
            <span>电话：</span><input type="text" name="phone" id="phone" placeholder="请输入手机号"
                                   onblur="checkPhone()"/><br>
            <p class="error_msg" id="phone_error"></p>

            <span>密码：</span><input type="password" name="tpwd" id="tpwd" placeholder="请输入密码"
                                   onblur="checkPassword()"/><br>
            <p class="error_msg" id="tpwd_error"></p>

            <a href="resetPwd.jsp">忘记密码？</a>
            <a href="teaRegister.jsp">立即注册&nbsp;|&nbsp;</a>
            <input type="submit" value="登  录" id="login_btn"/>
        </div>
    </form>
</div>

<script type="text/javascript">
    // 1. 验证手机号
    function checkPhone() {
        var phone = document.getElementById("phone").value;
        var phoneError = document.getElementById("phone_error");
        if (phone === "" || phone === null) {
            phoneError.style.display = "block";
            document.getElementById("phone").style.marginBottom = "0px";
            phoneError.innerText = "手机号不能为空！";
            return false;
        } else {
            phoneError.style.display = "none";
            document.getElementById("phone").style.marginBottom = "30px";
            return true;
        }
    }

    // 2. 验证密码
    function checkPassword() {
        var tpwd = document.getElementById("tpwd").value;
        var tpwdError = document.getElementById("tpwd_error");
        if (tpwd === "" || tpwd === null) {
            tpwdError.style.display = "block";
            document.getElementById("tpwd").style.marginBottom = "0px";
            tpwdError.innerHTML = "密码不能为空！";
            return false;
        } else {
            tpwdError.style.display = "none";
            document.getElementById("tpwd").style.marginBottom = "30px";
            return true;
        }
    }

    // 3.检查用户所有的输入的是否符合规则
    function checkAll() {
        var tphone = checkPhone();
        var tpwd = checkPassword();
        return tphone && tpwd;
    }
</script>
</body>
</html>
