<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>教师后台管理</title>
    <link rel="stylesheet" href="../css/base.css">
    <link rel="stylesheet" href="../css/teaManager.css">
</head>
<body>
<%-----------顶部导航条-------------%>
<div id="nav">
    <h1>Java练习系统</h1>
    <ul>
        <li>教师后台管理</li>
        <a href="../index.jsp"><li>首页</li></a>
        <li>欢迎：${teacher.gettName()}</li>
        <a href="../logout.jsp" target="_top"><li>退出</li></a>
    </ul>
</div>

<%-----------左边侧边栏-------------%>
<div id="aside">
    <ul>
        <li><a onclick="gotoQList()">试题列表</a></li>
        <li><a onclick="gotoQInput()">试题输入</a></li>
        <li><a onclick="gotoQCheck()">对比相似度</a></li>
        <li><a>学生管理</a>
            <ul>
                <li tabindex="1"><a onclick="gotoSList()">学生列表</a></li>
                <li tabindex="1"><a onclick="gotoSTest()">学生作业</a></li>
                <li tabindex="1"><a onclick="gotoSRank()">成绩排行</a></li>
            </ul>
        </li>
        <li><a onclick="gotoAdmin()">个人中心</a></li>
    </ul>
</div>

<%-----------中间内容部分-------------%>
<div id="main_box">
    <iframe id="mainContent" width="100%" height="600px"></iframe>
</div>

<script type="text/javascript">
    // 点击 li 标签，给它加一个 class 样式
    var li = document.querySelectorAll('#aside li');
    for (var i = 0; i < li.length; i++) {
        li[i].onclick = function () {
            // 先移除其他li的class
            for (var i = 0; i < li.length; i++) li[i].className = '';
            this.className = 'selected';
        }
    }

    function gotoQList() {
        var mainContent = document.getElementById('mainContent');
        mainContent.src = "${pageContext.request.contextPath}/teacher/questionList.jsp";
    }

    function gotoQInput() {
        var mainContent = document.getElementById('mainContent');
        mainContent.src = "${pageContext.request.contextPath}/teacher/questionInput.jsp";
    }

    function gotoQCheck() {
        var mainContent = document.getElementById('mainContent');
        mainContent.src = "${pageContext.request.contextPath}/teacher/questionCheck.jsp";
    }

    function gotoSList() {
        var mainContent = document.getElementById('mainContent');
        mainContent.src = "${pageContext.request.contextPath}/teacher/studentList.jsp";
    }

    function gotoSTest() {
        var mainContent = document.getElementById('mainContent');
        mainContent.src = "${pageContext.request.contextPath}/teacher/studentTest.jsp";
    }

    function gotoSRank() {
        var mainContent = document.getElementById('mainContent');
        mainContent.src = "${pageContext.request.contextPath}/teacher/studentRank.jsp";
    }

    function gotoAdmin() {
        var mainContent = document.getElementById('mainContent');
        mainContent.src = "${pageContext.request.contextPath}/teacher/teacherAdmin.jsp";
    }
</script>
</body>
</html>
