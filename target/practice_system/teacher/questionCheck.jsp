<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>对比相似度</title>
    <link rel="stylesheet" href="../css/inputQuestion.css">
</head>
<body>
<h3>对比代码相似度</h3>
<p class="info_msg">注意，一次只能对比两个学生的代码。相似度为1.0时完全相同。</p>
<p><span>代码段一：</span><textarea rows="25" cols="35" id="codeStr1"></textarea>
    <span>代码段二：</span><textarea rows="25" cols="35" id="codeStr2"></textarea></p>
<p id="errorMsg"></p>
<p><input type="submit" class="add_btn" value="开始检测" onclick="checkSame()"/></p>

<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>

<script type="text/javascript">
    // 点击对比相似度
    function checkSame() {
        var str1 = $("#codeStr1").val();
        var str2 = $("#codeStr2").val();

        $.ajax({
            url: "${pageContext.request.contextPath}/CheckSameServlet",
            async: true,
            type: "post",
            dataType: "text",
            data: {
                "codeStr1": str1,
                "codeStr2": str2
            },
            success: function (msg) {
                if (msg) {
                    $("#errorMsg").attr("class","error_msg_show").text(msg);
                } else {
                    $("#errorMsg").attr("class","error_msg");
                }
            }
        });
    }
</script>
</body>
</html>
