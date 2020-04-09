<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生登录</title>
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
<div id="login_box">
    <h2>学生登录</h2>
    <form action="${pageContext.request.contextPath}/StuLoginServlet" method="post" onsubmit="return checkAll()">
        <input type="hidden" name="form" value="true"/>
        <div id="form_info">
            <p class="${msg!=null?'error_msg_show':'error_msg'}" id="errorMsg">${msg}</p>
            <span>学号：</span><input type="text" name="sid" id="sid" placeholder="请输入学号" onblur="checkSid()"/><br>
            <p class="error_msg" id="sid_error"></p>

            <span>密码：</span><input type="password" name="spwd" id="spwd" placeholder="请输入密码"
                                   onblur="checkPassword()"/><br>
            <p class="error_msg" id="spwd_error"></p>

            <a href="resetPwd.jsp">忘记密码？</a>
            <a href="stuRegister.jsp">立即注册&nbsp;|&nbsp;</a>
            <input type="submit" value="登  录" id="login_btn"/>
        </div>
    </form>
</div>

<script type="text/javascript">
    // 1. 验证学号
    function checkSid() {
        var sid = document.getElementById("sid").value;
        var sidError = document.getElementById("sid_error");
        if (sid === "" || sid === null) {
            sidError.style.display = "block";
            document.getElementById("sid").style.marginBottom = "0px";
            sidError.innerText = "学号不能为空！";
            return false;
        } else {
            sidError.style.display = "none";
            document.getElementById("sid").style.marginBottom = "30px";
            return true;
        }
    }

    // 2. 验证密码
    function checkPassword() {
        var spwd = document.getElementById("spwd").value;
        var spwdError = document.getElementById("spwd_error");
        if (spwd === "" || spwd === null) {
            spwdError.style.display = "block";
            document.getElementById("spwd").style.marginBottom = "0px";
            spwdError.innerHTML = "密码不能为空！";
            return false;
        } else {
            spwdError.style.display = "none";
            document.getElementById("spwd").style.marginBottom = "30px";
            return true;
        }
    }

    // 3.检查用户所有的输入的是否符合规则
    function checkAll() {
        var sid = checkSid();
        var spwd = checkPassword();
        return sid && spwd;
    }
</script>
</body>
</html>
