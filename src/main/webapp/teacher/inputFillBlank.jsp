<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>上传填空题</title>
    <link rel="stylesheet" href="../css/inputQuestion.css">
    <%--<script src="tinymce/zh_CN.js"></script>--%>
    <script src="https://cdn.bootcss.com/tinymce/5.2.1/tinymce.min.js"></script>
    <script>
        tinymce.init({
            // 使输入内容插入数据库时不带<p>标签
            forced_root_block: "",
            selector: '.mytextarea',
            // language: 'zh_CN',
            plugins: "print preview searchreplace code codesample fullscreen link autolink charmap hr table advlist lists autoresize autosave",
            toolbar1: 'searchreplace | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify outdent indent | blockquote undo redo | removeformat subscript superscript | code codesample',
            toolbar2: 'restoredraft hr bullist numlist link table forecolor backcolor fullscreen',
            fontsize_formats: '12px 14px 16px 18px 24px 36px 48px 56px 72px',
            font_formats: '微软雅黑=Microsoft YaHei,Helvetica Neue,PingFang SC,sans-serif;苹果苹方=PingFang SC,Microsoft YaHei,sans-serif;宋体=simsun,serif;仿宋体=FangSong,serif;黑体=SimHei,sans-serif;Arial=arial,helvetica,sans-serif;Arial Black=arial black,avant garde;Book Antiqua=book antiqua,palatino;',
            width: 710
        });
    </script>
</head>
<body>
<form action="${pageContext.request.contextPath}/AddQuestionServlet?qType=2" method="post">
    <p class="${msg!=null?'error_msg_show':'error_msg'}" id="errorMsg">${msg}</p>

    <p><span>试题名称（可选）：</span><input type="text" name="qName" style="width:300px"></p>
    <p class="info_msg">注意，输入试题内容时，要填的空用下划线表示。</p>
    <p><h3>试题内容：</h3></p>
    <p><textarea class="mytextarea" name="qContent"></textarea></p>
    <p><span>练习知识点：</span><input type="text" name="qKeyword" placeholder="可以多个，用“,”分隔" style="width:284px"></p>
    <p><span>难度：</span>
        <input type="radio" name="qLevel" value="0" checked>较易
        <input type="radio" name="qLevel" value="1">容易
        <input type="radio" name="qLevel" value="2">难
        <input type="radio" name="qLevel" value="3">较难</p>

    <p class="info_msg">注意，在下列文本框输入时，多个正确答案用“|”隔开。</p>
    <p><h3>正确答案：</h3></p>
    <p><textarea class="mytextarea" name="qAnswer"></textarea></p>
    <p><span>题目得分：</span><input type="number" name="tScore"></p>

    <p><input type="submit" class="add_btn" value="添加新题"/></p>
</form>
</body>
</html>
