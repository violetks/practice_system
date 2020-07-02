<%@ page import="com.violetks.dao.StudentDao" %>
<%@ page import="com.violetks.entity.Student" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    StudentDao dao = new StudentDao();
    // 获取studentList.jsp 的 url 参数
    // 要加引号否则SQL查询出错
    String sClass = "'"+request.getParameter("sClass")+"'";
    List<Student> studentList = dao.getStudentList(sClass);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>查看学生列表</title>
    <link rel="stylesheet" href="../css/viewQuestion.css">
</head>
<body>
<%-----------表格区域-------------%>
<div id="table_area">
    <%-----------表头-------------%>
    <table border="0" align="center" id="tableTh">
        <tr align="center">
            <td><b>学号</b></td>
            <td><b>学生姓名</b></td>
            <td><b>性别</b></td>
            <td><b>年级</b></td>
            <td><b>班级</b></td>
            <td><b>院系</b></td>
        </tr>
    </table>

    <%-----------表格区域-------------%>
    <table align="center" id="questionTable">
        <%
            for (int i = 0; i < studentList.size(); i++) {
                Student student = studentList.get(i);
        %>
        <tr align="center">
            <td><%=student.getSid() %></td>
            <td><%=student.getsName() %></td>
            <td><%if (student.getsSex() == 1) {%>男
                <% } else if (student.getsSex() == 2) {%>女
                <% } else {%>保密<%} %>
            </td>
            <td><%=student.getsGrade() %></td>
            <td><%=student.getsClass() %></td>
            <td><%=student.getsDept() %></td>
        </tr>
        <% } %>
    </table>
</div>
</body>
</html>
