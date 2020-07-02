<%@ page import="com.violetks.dao.QuestionDao" %>
<%@ page import="com.violetks.entity.Question" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>进入单个填空题</title>
    <link rel="stylesheet" href="../css/base.css">
    <link rel="stylesheet" href="../css/questionTest.css">
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
<%
    QuestionDao questionDao = new QuestionDao();
    String qid = request.getParameter("qid");

    Question question = questionDao.getQuestionItem(Integer.parseInt(qid));
    if (question == null) {
        response.sendRedirect("questionLevelSet.jsp");
    } else {
        session.setAttribute("question", question);
%>

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

<!-- 试题详情部分 -->
<div id="question_content">
    <form name="form" action="${pageContext.request.contextPath}/QuestionTestServlet" method="post">
        <p class="${msg!=null?'error_msg_show':'error_msg'}" id="errorMsg">${msg}</p>

        <p><span class="fill_tag"><%if (question.getqType() == 2) {%>填空题<%}%></span>
            <% if (question.getqName() == null) {%>
            <%=question.getqContent() %>
        <%} else {%><%=question.getqName() %>
        <p><%=question.getqContent() %></p>
        <%}%>
            <span>（<%=question.gettScore()%>分）</span>
        </p>
        <p><span>难度：</span><span class="keyword">
            <%if (question.getqLevel() == 0) {%>较易
            <%} else if (question.getqLevel() == 1) {%>容易
            <%} else if (question.getqLevel() == 2) {%>难
            <%} else {%>较难<% } %>
        </span>
            <span>关键字：</span><span class="keyword"><%=question.getqKeyword() %></span></p>

        <p class="info_msg">注意，在下列文本框输入时，多个正确答案用“|”隔开。</p>
        <p><textarea class="mytextarea" name="qAnswer"></textarea></p>

        <p><input type="submit" class="add_btn" value="提交"/></p>
    </form>
</div>
<%}%>
</body>
</html>
