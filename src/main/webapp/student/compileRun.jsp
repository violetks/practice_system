<%@ page import="com.violetks.entity.Student" %>
<%@ page import="com.violetks.entity.Question" %>
<%@ page import="com.violetks.complierun.JavaCompileRun" %>
<%@ page import="java.io.File" %>
<%@ page import="com.violetks.entity.Record" %>
<%@ page import="com.violetks.dao.RecordDao" %>
<%@ page import="com.violetks.dao.ProgramDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>运行结果</title>
    <link rel="stylesheet" href="../css/base.css">
</head>
<body>
<%--<%--%>
    <%--RecordDao recordDao = new RecordDao();--%>
    <%--// 练习记录--%>
    <%--Record record = new Record();--%>
    <%--record.setS(student);--%>
    <%--record.setQuestion(question);--%>
    <%--int result = 0;--%>
    <%--if(jCR.isCompileResult() && jCR.isRunResult() && jCR.getScore()==100){--%>
        <%--result = 1;--%>
    <%--}--%>
    <%--record.setResult(result);--%>
<%--//    record.setLevel(question.getLevel());--%>
<%--//    record.setCategory(question.getCategory());--%>
    <%--//避免运行成功结果重复写入,结果不正确也不写入数据库--%>
    <%--assert student != null;--%>
    <%--ProgramDao programDao = new ProgramDao();--%>
    <%--// 查询练习次数--%>
<%--//    if(programDao.getExResult(student.getSid(), question.getQid(),2,1)<1&&jCR.getScore()==100){--%>
<%--//        recordDao.addExciseRecord(record);--%>
<%--//    }--%>
<%--%>--%>

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
        <td><p>&nbsp;</p></td>
    </tr>
    <tr>
        <td height="25" colspan="5">
            <b>&gt;&gt;
                <a href="programQItem.jsp?qid=${question.getQid()} %>" onclick="javascript:history.back(-1);">返回试题</a>
            </b>
        </td>
    </tr>
    <tr>
        <td><p>&nbsp;</p> </td>
    </tr>
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
<%--<%} %>--%>
</body>
</html>