<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>上传单选题</title>
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
<form action="${pageContext.request.contextPath}/AddQuestionServlet?qType=0" method="post">
    <p class="${msg!=null?'error_msg_show':'error_msg'}" id="errorMsg">${msg}</p>

    <p><h3>试题内容：</h3></p>
    <p><textarea class="mytextarea" name="qName"></textarea></p>
    <p><span>练习知识点：</span><input type="text" name="qKeyword" placeholder="可以多个，用“,”分隔" style="width:284px"></p>
    <p><span>难度：</span>
        <input type="radio" name="qLevel" value="0" checked>较易
        <input type="radio" name="qLevel" value="1">容易
        <input type="radio" name="qLevel" value="2">难
        <input type="radio" name="qLevel" value="3">较难</p>
    <p><h3>选项内容：</h3></p>
    <p class="info_msg">注意，输入选项内容时，避免出现“|”符号。</p>
    <p><span>（A）</span><textarea rows="6" cols="30" name="qContent"></textarea></p>
    <p><span>（B）</span><textarea rows="6" cols="30" name="qContent"></textarea></p>
    <p><span>（C）</span><textarea rows="6" cols="30" name="qContent"></textarea></p>
    <p><span>（D）</span><textarea rows="6" cols="30" name="qContent"></textarea></p>
    <p><span>正确答案：</span>
        <input type="radio" name="qAnswer" value="A">（A）
        <input type="radio" name="qAnswer" value="B">（B）
        <input type="radio" name="qAnswer" value="C">（C）
        <input type="radio" name="qAnswer" value="D">（D）</p>
    <p><span>题目得分：</span><input type="number" name="tScore"></p>
    <p><input type="submit" class="add_btn" value="添加新题"/></p>
</form>
</body>
</html>
