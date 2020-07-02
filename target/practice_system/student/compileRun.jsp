<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>运行结果</title>
    <link rel="stylesheet" href="../css/base.css">
</head>
<body>

<%-----------导航条-------------%>
<div id="nav">
    <h1>Java练习系统</h1>
    <ul>
        <li><a href="../index.jsp">首页</a></li>
        <li><a href="categorySet.jsp">试题分类</a></li>
        <li><a href="exerciseSet.jsp">练习记录</a></li>
        <li><a href="rankList.jsp">排行榜</a></li>
        <li>欢迎：${student.getsName()}</li>
        <li><a href="../logout.jsp" target="_top">退出</a></li>
    </ul>
</div>

<table width="50%" border="0" align="center">
    <tr>
        <td width="96"><div align="right"><b>提交题号</b></div></td>
        <td>${question.getQid()}</td>
    </tr>
    <tr>
        <td width="96"><div align="right"><b>编译结果</b></div></td>
        <td width="100">${jCR.isCompileResult()?"成功":"失败"}</td>
    </tr>
    <tr>
        <td width="96"><div align="right"><b>运行结果</b></div></td>
        <td width="100">${jCR.isRunResult()?"成功":"失败"}</td>
    </tr>
    <tr>
        <td width="96"><div align="right"><b>运行时间</b></div></td>
        <td width="100">${jCR.getRuntime()}ms</td>
    </tr>
    <tr>
        <td width="96"><div align="right"><b>代码通过率</b></div></td>
        <td width="100">${jCR.getScore()}%</td>
    </tr>
    <tr>
        <td width="96"><div align="right"><b>异常信息</b></div></td>
        <td width="100">${jCR.getExceptionString()}</td>
    </tr>
</table>
</body>
</html>