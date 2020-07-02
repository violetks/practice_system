<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>增添试题</title>
    <link rel="stylesheet" href="../css/questionInput.css">
</head>
<body>
<%-----------选择上传试题类型-------------%>
<div id="q_type">
    <ul>
        <li><a onclick="gotoSingleChoice()">单选题</a></li>
        <li><a onclick="gotoFillBlank()">填空题</a></li>
        <li><a onclick="gotoProgram()">编程题</a></li>
    </ul>
</div>

<%-----------可变内容部分-------------%>
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

    function gotoSingleChoice() {
        var changeContent = document.getElementById('changeContent');
        changeContent.src = "${pageContext.request.contextPath}/teacher/inputSingleChoice.jsp";
    }

    function gotoFillBlank() {
        var changeContent = document.getElementById('changeContent');
        changeContent.src = "${pageContext.request.contextPath}/teacher/inputFillBlank.jsp";
    }

    function gotoProgram() {
        var changeContent = document.getElementById('changeContent');
        changeContent.src = "${pageContext.request.contextPath}/teacher/inputProgram.jsp";
    }
</script>
</body>
</html>
