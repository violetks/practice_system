<%@ page import="com.violetks.entity.Student" %>
<%@ page import="com.violetks.entity.Question" %>
<%@ page import="com.violetks.fileUtil.FileOutput" %>
<%@ page import="com.violetks.dao.ProgramDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>进入单个编程题</title>
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/question.css">
</head>
<body>
<%!
    FileOutput fo = new FileOutput();
%>

<%
    //    Student student = (Student) session.getAttribute("student");
//    if (student.getSid() == 0) {
//        response.sendRedirect("studentLogin.jsp");
//    }
    ProgramDao dao = new ProgramDao();
    String qid = request.getParameter("qid");

    Question question = dao.getQuestionItem(Integer.parseInt(qid));
    if (question == null) {
        response.sendRedirect("programLevelSet.jsp");
    } else {
        session.setAttribute("question", question);
%>

<%-----------导航条-------------%>
<div id="nav">
    <h1>Java练习系统</h1>
    <ul>
        <li><a href="index.jsp">首页</a></li>
        <li><a href="categorySet.jsp">试题分类</a></li>
        <li><a href="exerciseSet.jsp">练习记录</a></li>
        <%--<li>阶段检测</li>--%>
        <li><a href="rankList.jsp">排行榜</a></li>
        <li>欢迎：${student.getsName()}</li>
        <li><a href="logout.jsp" target="_top">退出</a></li>
    </ul>
</div>

<!-- 左边试题详情部分 -->
<div id="left_box">
    <a id="first_a" href="programLevelSet.jsp?q_level=<%=question.getqLevel() %>"
       onclick="javascript:history.back(-1);">返回试题集</a>
    <div id="question_content">
        <h2 style="display: inline;">题目名称：</h2><span><%=question.getqName()%></span><br>
        <h2>题目描述</h2>
        <div class="question_box"><%=question.getqContent() %>
        </div>
        <h2 style="display: inline;">关键字：</h2><span class="keyword"><%=question.getqKeyword()%></span><br>
        <h2>样例输入1：</h2><% String str = fo.readFile(qid, "input", 1);%>
        <pre><%=str %></pre>
        <h2>样例输出1：</h2>
        <%
            if (fo.readFile(qid, "input", 1).equals("无")) {
                str = fo.readFile(qid, "example", 1);
            } else {
                str = fo.readFile(qid, "answer", 1);
            }
        %>
        <pre><%=str %></pre>
        <h2>样例输入2：</h2><% str = fo.readFile(qid, "input", 2);%>
        <pre><%=str %></pre>
        <h2>样例输出2：</h2><% str = fo.readFile(qid, "answer", 2);%>
        <pre><%=str %></pre>
    </div>
</div>
<!-- 右边代码运行部分 -->
<div id="right_box">
    <h2>输入源代码：</h2>
    <form name="form" action="compileRun.jsp" method="post" onsubmit="getCode()">
                <textarea id="codeArea" name="codeStr" rows="20" cols="60" placeholder="源代码提交时注意：
                1.类名改为“Main”;
                2.import语句不能少;
                3.删掉输入/输出提示信息的代码;
                4.删掉代码中的package;"></textarea>
        <input type="submit" id="submitCode" value="提交代码"/>
    </form>
</div>

<script type="text/javascript">
    function getCode() {
        var str = document.getElementById("codeArea").value;  // 获取文本框输入值
        var arr = str.split(" ");
        arr.forEach(function (value, index, array) {
            if (array.indexOf("class") === -1) {
                alert("请输入源代码！");
                return false
            } else {
                return true
            }
        })
    }
</script>
<%}%>
</body>
</html>
