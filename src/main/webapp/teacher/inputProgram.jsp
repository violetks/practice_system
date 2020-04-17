<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>上传编程题</title>
    <%--<script src="tinymce/zh_CN.js"></script>--%>
    <script src="https://cdn.bootcss.com/tinymce/5.2.1/tinymce.min.js"></script>
    <script>
        tinymce.init({
            // 使输入内容插入数据库时不带<p>标签
            forced_root_block:"",
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
${msg}
${msg1}
${msg2}
${msg3}
${msg4}
<form action="${pageContext.request.contextPath}/AddProgramServlet?qType=4" method="post">
    试题名称：<input type="text" name="qName" style="width:300px"><br>
    练习知识点 :<input type="text" name="qKeyword" style="width:280px"><br>
    试题内容 :<textarea class="mytextarea" name="qContent"></textarea><br>
    难度 ：<input type="radio" name="qLevel" value="0" checked>较易
    <input type="radio" name="qLevel" value="1">容易
    <input type="radio" name="qLevel" value="2">难
    <input type="radio" name="qLevel" value="3">较难<br>
    是否需要控制台输入数据：
    <input type="radio" name="qInput" value="yes" onclick="changeDiv2()" checked>是
    <input type="radio" name="qInput" value="no" onclick="changeDiv1()">否<br>
    <p>注意，在下列文本框输入时，一个框中多于一个数，各数用空格隔开。</p>

    <%--需要控制台输入数据--%>
    <div id="div1">
        测试输入1：<input type="text" name="in" style="width:100px"/><br>
        测试答案1：<textarea rows="6" cols="30" name="answer"></textarea><br>
        测试输入2：<input type="text" name="in" style="width:100px"/><br>
        测试答案2：<textarea rows="6" cols="30" name="answer"></textarea><br>
        测试输入3：<input type="text" name="in" style="width:100px"/><br>
        测试答案3：<textarea rows="6" cols="30" name="answer"></textarea><br>
        测试输入4：<input type="text" name="in" style="width:100px"/><br>
        测试答案4：<textarea rows="6" cols="30" name="answer"></textarea><br>
        测试输入5：<input type="text" name="in" style="width:100px"/><br>
        测试答案5：<textarea rows="6" cols="30" name="answer"></textarea><br>
        <input type="submit" value="添加新题"/>
    </div>

    <%--不需要控制台输入数据--%>
    <div id="div2" style=display:none;>
        测试答案：<textarea rows="6" cols="50" name="a" style="overflow:auto"></textarea><br>
        样例输出：<textarea rows="6" cols="50" name="e" style="overflow:auto"></textarea><br>
        <input type="submit" value="添加新题"/>
    </div>
</form>

<script type="text/javascript">
    // 不需要控制台输入数据
    function changeDiv1() {
        document.getElementById("div1").style.display = "none";
        document.getElementById("div2").style.display = "block";
    }

    // 需要控制台输入数据
    function changeDiv2() {
        document.getElementById("div2").style.display = "none";
        document.getElementById("div1").style.display = "block";
    }

    // 判断输入是否为空
    // function isSpace(arr){
    //     if (arr === null) return true;
    //     for (var i = 0; i < arr.length; i++) {
    //         if (arr[i].trim() == "" || arr[i] == null) {
    //             return true;
    //         }
    //     }
    //     return false;
    // }
</script>
</body>
</html>
