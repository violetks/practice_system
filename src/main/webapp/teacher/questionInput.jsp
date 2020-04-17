<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>增添试题</title>
    <link rel="stylesheet" href="../css/base.css">
    <link rel="stylesheet" href="../css/questionInput.css">
</head>
<body>
<%-----------选择上传试题类型-------------%>
<div id="q_type">
    <ul>
        <li><a>单选题</a></li>
        <li><a>多选题</a></li>
        <li><a>填空题</a></li>
        <li><a>判断题</a></li>
        <li><a onclick="gotoProgram()">编程题</a></li>
        <li><a>简答题</a></li>
    </ul>
</div>

<%-----------可变内容部分-------------%>
<div id="change_box">
    <iframe id="changeContent" width="100%" height="500px"></iframe>
</div>

<script type="text/javascript">
    function gotoProgram() {
        var changeContent = document.getElementById('changeContent');
        changeContent.src = "${pageContext.request.contextPath}/teacher/inputProgram.jsp";
    }
</script>
</body>
</html>
