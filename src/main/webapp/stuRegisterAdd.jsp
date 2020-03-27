<%@ page import="com.violetks.entity.Student" %>
<%@ page import="com.violetks.dao.BaseDaoImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>注册处理页</title>
</head>
<body>
<%--获取stuRegister.jsp表单提交的数据，实现注册--%>
<%!
    String sid = "";
    String sName = "";
    String spwd = "";
    String sex = "";
    String grades = "";
    String classInfo = "";
%>
<%
    request.setCharacterEncoding("UTF-8");  // 防止中文乱码
    sid = request.getParameter("sid");
    sName = request.getParameter("sName");
    spwd = request.getParameter("spwd");
    sex = request.getParameter("sex");
    grades = request.getParameter("grades");
    classInfo = request.getParameter("classInfo");

    Student student = new Student();
    student.setSid(Integer.parseInt(sid));
    student.setName(sName);
    student.setPassword(spwd);
    student.setSex(Integer.parseInt(sex));
    student.setGrades(grades);
    student.setClassInfo(classInfo);
    BaseDaoImpl dao = new BaseDaoImpl();
    if (dao.addStudent(student)){
%>
<script language="JavaScript">
    alert("注册成功！");
</script>
<jsp:forward page="studentLogin.jsp"/>
<%}else{%>
<script language="JavaScript">
    alert("注册失败，请重试！");
</script>
<%}%>
</body>
</html>
