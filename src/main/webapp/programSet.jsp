<%@ page import="com.violetks.entity.Student" %>
<%@ page import="com.violetks.dao.StudentDao" %>
<%@ page import="com.violetks.dao.ProgramDao" %>
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
//    Student s = (Student) session.getAttribute("student");
//    if (s == null){
//        response.sendRedirect("studentLogin.jsp");
//    }else {
//        StudentDao dao = new StudentDao();
        ProgramDao programDao = new ProgramDao();
//        Student student = dao.getStudent(s);
//        if(student.getSid()==0){
//            response.sendRedirect("studentLogin.jsp");
//        }
//        session.setAttribute("student",student);
%>
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
<%-----------表格区域-------------%>
<div id="table_area">
    <table border="0" align="center">
        <caption><h2>编程题练习集</h2><hr></caption>
        <tr align="center">
            <td><b>难度等级</b></td>
            <td><b>试题总数</b></td>
            <td><b>已解决数量</b></td>
            <td><b>更新时间</b></td>
            <td><b>进入试题集</b></td>
        </tr>
        <tr align="center">
            <td>较易</td>
            <td><%=programDao.getCount(0) %></td>
            <td>getResolvedCount(student.getSid(),0,2,1) %></td>
            <td><%=programDao.getLastTime(0) %></td>
            <td>
                <form action="programLevelSet.jsp" method="post">
                    <input type="hidden" name="q_level" value="0" />
                    <input type="submit" class="enter_btn" value="进入试题集" />
                </form>
            </td>
        </tr>
        <tr align="center">
            <td>容易</td>
            <td><%=programDao.getCount(1) %></td>
            <td>getResolvedCount(student.getSid(),1,2,1) %></td>
            <td><%=programDao.getLastTime(1) %></td>
            <td>
                <form action="programLevelSet.jsp" method="post">
                    <input type="hidden" name="q_level" value="1" />
                    <input type="submit" class="enter_btn" value="进入试题集" />
                </form>
            </td>
        </tr>
        <tr align="center">
            <td>难</td>
            <td><%=programDao.getCount(2) %></td>
            <td>getResolvedCount(student.getSid(),2,2,1) %></td>
            <td><%=programDao.getLastTime(2) %></td>
            <td>
                <form action="programLevelSet.jsp" method="post">
                    <input type="hidden" name="q_level" value="2" />
                    <input type="submit" class="enter_btn" value="进入试题集" />
                </form>
            </td>
        </tr>
        <tr align="center">
            <td>较难</td>
            <td><%=programDao.getCount(3) %></td>
            <td>getResolvedCount(student.getSid(),3,2,1) %></td>
            <td><%=programDao.getLastTime(3) %></td>
            <td>
                <form action="programLevelSet.jsp" method="post">
                    <input type="hidden" name="q_level" value="3" />
                    <input type="submit" class="enter_btn" value="进入试题集" />
                </form>
            </td>
        </tr>
        <tr align="center">
            <td><b>试题总数：</b></td>
            <td><%=programDao.getProgramCount(4) %></td>
        </tr>
    </table>
</div>
<%--<%}%>--%>
</body>
</html>
