<%@ page import="com.violetks.fileUtil.FileInput" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>试题添加结果</title>
    <link rel="stylesheet" href="../css/base.css">
    <link rel="stylesheet" href="../css/questionAdd.css">
</head>
<body>
<b>后台管理</b>
<b>试题输入</b>
<b>试题分类</b>
<b>试题修改</b>
<b>用户管理</b>
<b>排行榜</b>
<b>返回首页</b>
<%!
    public String[][] StrSplit(String s) {//把多行文本拆分成二维数组
        String[] s1 = s.split("\\n|\r\n");//把多行拆分
        String a[][] = new String[s1.length][];
        for (int i = 0; i < s1.length; i++) {
            a[i] = s1[i].split("\\s+");
        }
        return a;
    }

    public boolean isSpace(String[] str) {
        if (str == null) return true;
        for (int i = 0; i < str.length; i++) {
            if (str[i].trim() == "" || str[i] == null) {
                return true;
            }
        }
        return false;
    }

    FileInput fi = new FileInput();
//    int qid = 0;
%>
<a href="questionInput.jsp" onclick="javascript:history.back(-1);">
    返回试题输入</a>

<table width="40%" border="0" align="center">
    <tr>
        <%
            //String[] a1=answer1.split("\\n|\r\n");//把多行拆分

            <%--if (dao.addQuestion(question)) { %>--%>
        <%--<%="试题已写入数据库"%><br/>--%>
        <%--<%}%>--%>
        <%--<% //获得试题表中试题的最后题号--%>
<%--//            qid = dao.getLastQid();--%>
            <%--if (qid == 0) {--%>
        <%--%>--%>
        <%--<%="没有获取到题号，测试答案不能生成。<br/>" %>--%>
        <%--<%--%>
            <%--}--%>
            <%--//  qid=qid+1;//新增题号大小？不用的--%>
        <%--%>--%>
        <%--<%="新建第" + qid + "题"%><br/>--%>

        <% if (fi.createDir(qid)) {%><%="文件夹生成" %><br/>
        <% if (input.equals("yes")) {
            String in[] = request.getParameterValues("in");
            String answer[] = request.getParameterValues("answer");
            //for(int i=0;i<answer.length;i++){//answer is or isnot null
            //if(){
            //}
            //}
            // if(){//answer is null
            if (!isSpace(in)) {
                for (int i = 0; i < in.length; i++) {
                    if (fi.createFile(qid, "input" + qid + "0" + (i + 1), StrSplit(in[i]))) {%>
        <%="测试输入文件"%><%=i + 1%><%="生成<br>" %><% }%>
        <br/>
        <%if (fi.createFile(qid, "answer" + qid + "0" + (i + 1), StrSplit(answer[i]))) { %>
        <%="测试答案文件"%><%=i + 1%><%="生成<br>" %><% }%>
        <br/>
        <%
                }
            }
            //}
        } else {
            String answer = request.getParameter("a");
            String example = request.getParameter("e");
            if (fi.createFile(qid, "answer" + qid + "01", StrSplit(answer))) {
        %><%="测试答案文件生成<br>" %> <% }%><br>
        <%if (fi.createFile(qid, "example" + qid + "01", StrSplit(example))) { %>
        <%="测试样例文件生成<br/>" %> <% }%><br>
        <%}%>
        <%} else {%>
        <%="文件夹生成失败<br/>"%><%} %>
    </tr>
</table>
</body>
</html>
