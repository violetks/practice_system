<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生登录</title>
    <style type="text/css">
        body{margin: 0;padding: 0;background-color: #f7f9fa;}
        #login_box{
            width: 500px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            border-radius: 5px;
            background-color: white;
        }
        #login_box h2{
            text-align: center;
        }
        form{
            margin-left: 100px;
        }
        input{
            width: 200px;
            height: 25px;
            border: 1px solid #999999;
        }
        .login_btn{
            width: 250px;
            height: 30px;
            font-size: 14px;
            line-height: 30px;
            background: #0075B6;
            color: #fff;
            border: 1px solid #fff;
            border-radius: 15px;
        }
    </style>
</head>
<body>
<div id="login_box">
    <h2>学生登录</h2>
    <form method="post">
        学号：<input type="text" name="sid" /><br><br>
        密码：<input type="password" name="spwd"/><br><br>
        <input type="submit" value="登 录" class="login_btn">
    </form>
</div>

<%-- sid 是学号 --%>
<%
    String sid = request.getParameter("sid");
    String spwd = request.getParameter("spwd");
    if(sid =="" || sid==null){
        out.print("<script>alert('学号不能为空！');</script>");
    }else if (spwd == "" || spwd==null) {
        out.print("<script>alert('密码不能为空！');</script>");
    }else {
        session.setAttribute("sid",sid);
        session.setAttribute("spwd",spwd);
        response.sendRedirect("categorySet.jsp");
    }
%>
</body>
</html>
