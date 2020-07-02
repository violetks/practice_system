<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>试题列表</title>
    <link rel="stylesheet" href="../css/questionList.css">
</head>
<body>
<%-----------选择试题类型-------------%>
<div id="q_type">
    <h3>请选择题型</h3>
    <ul>
        <li><a onclick="viewSingleChoice()">单选题</a></li>
        <li><a onclick="viewFillBlank()">填空题</a></li>
        <li><a onclick="viewProgram()">编程题</a></li>
    </ul>
</div>

<%-----------可变内容部分-------------%>
<div id="change_box">
    <p class="info_msg">点击题目名称，可展开查看详细内容。</p>
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

    function viewSingleChoice() {
        var changeContent = document.getElementById('changeContent');
        changeContent.src = "${pageContext.request.contextPath}/teacher/viewQuestion.jsp?qType="+0;
    }

    function viewFillBlank() {
        var changeContent = document.getElementById('changeContent');
        changeContent.src = "${pageContext.request.contextPath}/teacher/viewQuestion.jsp?qType="+2;
    }

    function viewProgram() {
        var changeContent = document.getElementById('changeContent');
        changeContent.src = "${pageContext.request.contextPath}/teacher/viewQuestion.jsp?qType="+4;
    }
</script>
</body>
</html>
