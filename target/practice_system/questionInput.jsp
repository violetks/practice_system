<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>增添试题</title>
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/questionInput.css">
</head>
<body>
20180501教师输入试题页面
<table width="100%" height="12%" border="0" align="center" bgcolor="#7b7b7b">
    <tr>
        <td width="70%"><table width="70%" border="0" align="center">
            <tr align="center">
                <td width="40%"><p class="style4">后台管理</p></td>
                <td width="9%"><span class="style9">试题输入</span></td>
                <td width="9%"><span class="style9">试题分类</span></td>
                <td width="9%"><span class="style9">试题修改</span></td>
                <td width="9%"><span class="style9">用户管理</span></td>
                <td width="9%"><span class="style9"><a href="rankList.jsp" target="view_window">排行榜</a></span></td>
                <td width="8%"><span class="style9"><a href="index.jsp">返回首页</a></span></td>
            </tr>
        </table></td>
    </tr>
</table>
<p>&nbsp;</p>
<p>&nbsp;</p>
<form action="questionAdd.jsp" method="post">
    <table align="center" width="60%">
        <tr>
            <td colspan="2">试题名称：<input type="text" name="name" style="width:300px"></td>
        </tr>
        <tr>
            <td colspan="2">练习知识点 :<input type="text" name="keyword" style="width:280px"></td>
        </tr>
        <tr>
            <td>试题内容 :</td>
        </tr>
        <tr>
            <td><textarea rows="5" cols="70" name="content" style="overflow:auto"></textarea></td>
        </tr>
        <tr><td><p>&nbsp;</p></td></tr>
        <tr>
            <td>难度：<input type="radio" name="category" value="0" checked>入门训练<input type="radio" name="category" value="1">基础练习
                <input type="radio" name="category" value="2">算法练习 <input type="radio" name="category" value="3">算法提高<br>
            </td>
        </tr>
        <tr><td><p>&nbsp;</p></td></tr>
        <tr><td>
            是否需要控制台输入数据：<input type="radio" name="input" value="yes" onclick="changeDiv2()" checked>是<input type="radio" name="input" value="no" onclick="changeDiv1()">否<br>
        </td></tr>
        <tr><td> <p>&nbsp;</p></td></tr>
        <tr><td>注意，在下列文本框输入时，一个框中多于一个数，各数用空格隔开。</td></tr>
        <tr><td>
            <div id="div1">
                <table align="center" width="80%">
                    <tr><td>测试输入1<br><input type="text" name="in" style="width:100px"/></td>
                        <td>测试答案1 <br><textarea rows="6" cols="30" name="answer"  style="overflow:auto">
</textarea></td></tr>
                    <tr><td> 测试输入2<br><input type="text" name="in" style="width:100px"/></td>
                        <td> 测试答案2<br><textarea rows="6" cols="30" name="answer" style="overflow:auto">
</textarea></td></tr>
                    <tr><td>测试输入3<br><input type="text" name="in" style="width:100px"/></td>
                        <td>测试答案3<br><textarea rows="6" cols="30" name="answer" style="overflow:auto">
</textarea></td></tr>
                    <tr><td>测试输入4<br><input type="text" name="in" style="width:100px"/></td>
                        <td>测试答案4<br><textarea rows="6" cols="30" name="answer" style="overflow:auto">
</textarea></td></tr>
                    <tr><td> 测试输入5<br><input type="text" name="in" style="width:100px"/></td>
                        <td>测试答案5<br><textarea rows="6" cols="30" name="answer" style="overflow:auto">
</textarea></td></tr>

                    <tr><td>
                        <input type="submit" value="添加新题"/>
                    </td></tr>
                </table>
            </div>
        </td> </tr>
        <tr><td>
            <div id="div2" style=display:none;>
                <table align="center" width="80%">
                    <tr><td>
                        测试答案<br><textarea rows="6" cols="50" name="a"  style="overflow:auto"></textarea><br>
                        样例输出<br><textarea rows="6" cols="50" name="e"  style="overflow:auto"></textarea><br>
                        <br>
                        <input type="submit" value="添加新题"/>
                    </td> </tr>
                </table>
            </div>
        </td> </tr>
    </table>
</form>

<script type="text/javascript">
    function changeDiv1() {
        document.getElementById("div1").style.display="none";
        document.getElementById("div2").style.display="";
    }
    function changeDiv2() {
        document.getElementById("div2").style.display="none";
        document.getElementById("div1").style.display="";
    }
</script>
</body>
</html>
