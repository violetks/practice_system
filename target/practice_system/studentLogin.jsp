<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生登录</title>
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/studentLogin.css">
</head>
<body>
<div id="login_box">
    <h2>学生登录</h2>
    <form method="post">
        <div id="form_info">
            <span>学号：</span><input type="text" name="sid" id="sid"/><br>
            <p class="error_msg" id="sid_error">学号不能为空！</p>
            <span>密码：</span><input type="password" name="spwd" id="spwd"/><br>
            <p class="error_msg" id="spwd_error">密码不能为空！</p>
            <a href="resetPwd.jsp">忘记密码？</a>
            <a href="stuRegister.jsp">立即注册&nbsp;|&nbsp;</a>
            <input type="submit" value="登  录" id="login_btn"/>
        </div>
    </form>
</div>

<%-- sid 是学号 --%>
<%
    String sid = request.getParameter("sid");
    String spwd = request.getParameter("spwd");
    if (sid == "" || sid == null) {
%>
<script language="JavaScript">
    document.getElementById("sid_error").style.visibility = "visible";
    document.getElementById("spwd_error").style.visibility = "hidden";
</script>
<%
    } else if (spwd == "" || spwd == null) {
%>
<script language="JavaScript">
    document.getElementById("sid_error").style.visibility = "hidden";
    document.getElementById("spwd_error").style.visibility = "visible";
</script>
<%
    } else {
        session.setAttribute("sid", sid);
        session.setAttribute("spwd", spwd);
        response.sendRedirect("categorySet.jsp");
    }
%>
</body>
</html>
