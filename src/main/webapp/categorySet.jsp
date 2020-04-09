<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>试题分类</title>
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/categorySet.css">
</head>
<body>
<%-----------导航条-------------%>
<div id="nav">
    <h1>Java练习系统</h1>
    <ul>
        <li><a href="index.jsp">首页</a></li>
        <li>试题分类</li>
        <li><a href="exerciseSet.jsp">练习记录</a></li>
        <%--<li>阶段检测</li>--%>
        <li><a href="rankList.jsp">排行榜</a></li>
        <li>欢迎：${student.getsName()}</li>
        <li><a href="logout.jsp" target="_top">退出</a></li>
    </ul>
</div>
<%-----------选择试题类型-------------%>
<div id="choose_box">
    <div class="top">
        <p>选择试题类型</p>
        <p>CHOOSE TEST TYPE</p>
    </div>
    <div class="choose_test">
        <div class="box">
            <a href="chooseSet.jsp">
                <p id="choose_p">选择题</p>
                <p class="btn">进入试题</p>
            </a>
        </div>
        <div class="box">
            <a href="fillblankSet.jsp">
                <p id="fill_p">填空题</p>
                <p class="btn">进入试题</p>
            </a>
        </div>
        <div class="box">
            <a href="programSet.jsp">
                <p id="program_p">编程题</p>
                <p class="btn">进入试题</p>
            </a>
        </div>
    </div>
</div>
</body>
</html>