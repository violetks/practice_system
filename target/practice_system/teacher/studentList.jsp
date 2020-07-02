<%@ page import="com.violetks.dao.StudentDao" %>
<%@ page import="com.violetks.entity.Student" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生列表</title>
    <link rel="stylesheet" href="../css/questionList.css">
</head>
<body>
<h2>学生列表</h2>
<%
    StudentDao dao = new StudentDao();
    List<Student> sClassList = dao.getStudentClass();
%>
<%-----------选择班级分类-------------%>
<div id="q_type">
    <h3>按班级分类</h3>
    <ul>
        <%
            for (int i = 0; i < sClassList.size(); i++) {
                Student student = sClassList.get(i);
        %>
        <li><a onclick="viewClass(<%=i%>)" class="s_class"><%=student.getsClass() %>
        </a></li>
        <% } %>
    </ul>
</div>

<%-----------学生列表部分-------------%>
<div id="change_box">
    <iframe id="changeContent" width="100%" height="500px" frameborder="0"></iframe>
</div>

<script type="text/javascript">
    // 点击 li 标签，给它加一个 class 样式
    var li = document.querySelectorAll('#q_type li');
    for (var i = 0; i < li.length; i++) {
        li[i].onclick = function () {
            // 先移除其他li的class
            for (var i = 0; i < li.length; i++) li[i].className = '';
            this.className = 'selected';
        }
    }

    function viewClass(i) {
        var sClass = document.getElementsByClassName('s_class');
        var changeContent = document.getElementById('changeContent');
        changeContent.src = "${pageContext.request.contextPath}/teacher/viewStudent.jsp?sClass=" + sClass[i].innerText;
    }
</script>
</body>
</html>
