<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>教师登录</title>
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
<div id="login_box">
    <h2>教师登录</h2>
    <form method="post">
        <div id="form_info">
            <span>手机号：</span><input type="text" name="phone" id="phone"/><br>
            <p class="error_msg" id="phone_error">手机号不能为空！</p>
            <span>密码：</span><input type="password" name="spwd" id="spwd"/><br>
            <p class="error_msg" id="spwd_error">密码不能为空！</p>
            <a href="resetPwd.jsp">忘记密码？</a>
            <a href="teaRegister.jsp">立即注册&nbsp;|&nbsp;</a>
            <input type="submit" value="登  录" id="login_btn"/>
        </div>
    </form>
</div>

<%
    String phone = request.getParameter("phone");
    String spwd = request.getParameter("spwd");
    if (phone == "" || phone == null) {
%>
<script language="JavaScript">
    document.getElementById("phone_error").style.visibility = "visible";
    document.getElementById("spwd_error").style.visibility = "hidden";
</script>
<%
} else if (spwd == "" || spwd == null) {
%>
<script language="JavaScript">
    document.getElementById("phone_error").style.visibility = "hidden";
    document.getElementById("spwd_error").style.visibility = "visible";
</script>
<%
    } else {
        session.setAttribute("phone", phone);
        session.setAttribute("spwd", spwd);
        response.sendRedirect("questionInput.jsp");
    }
%>
</body>
</html>
