<%@ page import="com.violetks.entity.Student" %>
<%@ page import="com.violetks.dao.QuestionDao" %>
<%@ page import="com.violetks.dao.RecordDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Student s = (Student) session.getAttribute("student");
    // 获取试题类型
    int qType = Integer.parseInt(request.getParameter("qType"));
    QuestionDao questionDao = new QuestionDao();
    RecordDao recordDao = new RecordDao();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%if (qType == 0) {%>选择题
        <% } else if (qType == 2) {%>填空题
        <% } else if (qType == 4) {%>编程题
        <% } else {%>其他<%} %></title>
    <link rel="stylesheet" href="../css/base.css">
    <link rel="stylesheet" href="../css/programSet.css">
</head>
<body>
<%-----------导航条-------------%>
<div id="nav">
    <h1>Java练习系统</h1>
    <ul>
        <li><a href="../index.jsp">首页</a></li>
        <li><a href="categorySet.jsp">试题分类</a></li>
        <li><a href="exerciseSet.jsp">练习记录</a></li>
        <li><a href="rankList.jsp">排行榜</a></li>
        <li>欢迎：${student.getsName()}</li>
        <li><a href="../logout.jsp" target="_top">退出</a></li>
    </ul>
</div>
<%-----------表格区域-------------%>
<div id="table_area">
    <table border="0" align="center">
        <caption><h2><%if (qType == 0) {%>选择题
            <% } else if (qType == 2) {%>填空题
            <% } else if (qType == 4) {%>编程题
            <% } else {%>其他<%} %>练习集</h2>
            <hr>
        </caption>
        <tr align="center">
            <td><b>难度等级</b></td>
            <td><b>试题总数</b></td>
            <td><b>已解决数量</b></td>
            <td><b>更新时间</b></td>
            <td><b>进入试题集</b></td>
        </tr>
        <tr align="center">
            <td>较易</td>
            <td><%=questionDao.getCountByTypeAndLevel(qType, 0) %>
            </td>
            <td><%=recordDao.getResolvedCount(s.getSid(), 0, qType, 1) %>
            </td>
            <td><%if (questionDao.getLastTime(qType, 0) == null) {%>暂无
                <%} else {%>
                <%=questionDao.getLastTime(qType, 0) %>
                <%}%>
            </td>
            <td>
                <a href="questionLevelSet.jsp?qType=<%=qType%>&qLevel=0">进入试题集</a>
            </td>
        </tr>
        <tr align="center">
            <td>容易</td>
            <td><%=questionDao.getCountByTypeAndLevel(qType, 1) %>
            </td>
            <td><%=recordDao.getResolvedCount(s.getSid(), 1, qType, 1) %>
            </td>
            <td><%if (questionDao.getLastTime(qType, 1) == null) {%>暂无
                <%} else {%>
                <%=questionDao.getLastTime(qType, 1) %>
                <%}%>
            </td>
            <td>
                <a href="questionLevelSet.jsp?qType=<%=qType%>&qLevel=1">进入试题集</a>
            </td>
        </tr>
        <tr align="center">
            <td>难</td>
            <td><%=questionDao.getCountByTypeAndLevel(qType, 2) %>
            </td>
            <td><%=recordDao.getResolvedCount(s.getSid(), 2, qType, 1) %>
            </td>
            <td><%if (questionDao.getLastTime(qType, 2) == null) {%>暂无
                <%} else {%>
                <%=questionDao.getLastTime(qType, 2) %>
                <%}%>
            </td>
            <td>
                <a href="questionLevelSet.jsp?qType=<%=qType%>&qLevel=2">进入试题集</a>
            </td>
        </tr>
        <tr align="center">
            <td>较难</td>
            <td><%=questionDao.getCountByTypeAndLevel(qType, 3) %>
            </td>
            <td><%=recordDao.getResolvedCount(s.getSid(), 3, qType, 1) %>
            </td>
            <td><%if (questionDao.getLastTime(qType, 3) == null) {%>暂无
                <%} else {%>
                <%=questionDao.getLastTime(qType, 3) %>
                <%}%>
            </td>
            <td>
                <a href="questionLevelSet.jsp?qType=<%=qType%>&qLevel=3">进入试题集</a>
            </td>
        </tr>
        <tr align="center">
            <td><b>试题总数：</b></td>
            <td><%=questionDao.getCountByType(qType) %>
            </td>
        </tr>
    </table>
</div>
</body>
</html>
