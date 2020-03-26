<%@ page import="com.violetks.entity.Student" %>
<%@ page import="com.violetks.dao.BaseDaoImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>编程题</title>
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/programSet.css">
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
<%-----------表格区域-------------%>
<div id="table_area">
    <table border="0" align="center">
        <caption><h2>编程题练习集</h2><hr></caption>
        <tr align="center">
            <td><b>试题集名称</b></td>
            <td><b>试题总数</b></td>
            <td><b>已解决数量</b></td>
            <td><b>更新时间</b></td>
            <td><b>进入试题集</b></td>
        </tr>
        <tr align="center">
            <td>入门训练</td>
            <td><%=dao.getCount(0) %></td>
            <td><%=dao.getResolvedCount(student.getSid(),0,1) %></td>
            <td><%=dao.getLastTime(0) %></td>
            <td>
                <form action="questionSet.jsp" method="post">
                    <input type="hidden" name="category" value="0" />
                    <input type="submit" class="enter_btn" value="进入试题集" />
                </form>
            </td>
        </tr>
        <tr align="center">
            <td>基础练习</td>
            <td><%=dao.getCount(1) %></td>
            <td><%=dao.getResolvedCount(student.getSid(),1,1) %></td>
            <td><%=dao.getLastTime(1) %></td>
            <td>
                <form action="questionSet.jsp" method="post">
                    <input type="hidden" name="category" value="1" />
                    <input type="submit" class="enter_btn" value="进入试题集" />
                </form>
            </td>
        </tr>
        <tr align="center">
            <td>算法训练</td>
            <td><%=dao.getCount(2) %></td>
            <td><%=dao.getResolvedCount(student.getSid(),2,1) %></td>
            <td><%=dao.getLastTime(2) %></td>
            <td>
                <form action="questionSet.jsp" method="post">
                    <input type="hidden" name="category" value="2" />
                    <input type="submit" class="enter_btn" value="进入试题集" />
                </form>
            </td>
        </tr>
        <tr align="center">
            <td>算法提高</td>
            <td><%=dao.getCount(3) %></td>
            <td><%=dao.getResolvedCount(student.getSid(),3,1) %></td>
            <td><%=dao.getLastTime(3) %></td>
            <td>
                <form action="questionSet.jsp" method="post">
                    <input type="hidden" name="category" value="3" />
                    <input type="submit" class="enter_btn" value="进入试题集" />
                </form>
            </td>
        </tr>
        <tr align="center">
            <td><b>试题总数：</b></td>
            <td><%=dao.getLastQid() %></td>
        </tr>
    </table>
</div>
<%}%>
</body>
</html>
