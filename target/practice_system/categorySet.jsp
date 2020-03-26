<%@ page import="com.violetks.entity.Student" %>
<%@ page import="com.violetks.dao.BaseDaoImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>试题分类</title>
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/categorySet.css">
</head>
<body>
<%
    String sid = null;
    String spwd = null;
    sid = (String) session.getAttribute("sid");
    spwd = (String) session.getAttribute("spwd");
    if (sid == null||spwd == null){
        response.sendRedirect("studentLogin.jsp");
    }else {
        BaseDaoImpl dao = new BaseDaoImpl();
        Student student = dao.getStudent(Integer.parseInt(sid),spwd);
        if(student.getSid()==0){
            response.sendRedirect("studentLogin.jsp");
        }
        session.setAttribute("student",student);
%>
<%-----------导航条-------------%>
<div id="nav">
    <h1>Java练习系统</h1>
    <ul>
        <li><a href="index.jsp">首页</a></li>
        <li>试题分类</li>
        <li><a href="exerciseSet.jsp" target="view_window">练习记录</a></li>
        <li>阶段检测</li>
        <li><a href="rankList.jsp" target="view_window">排行榜</a></li>
        <li>欢迎：<%=student.getName() %></li>
        <li>退出</li>
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
<%}%>
</body>
</html>