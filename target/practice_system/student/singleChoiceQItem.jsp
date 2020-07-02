<%@ page import="com.violetks.dao.QuestionDao" %>
<%@ page import="com.violetks.entity.Question" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>进入单个单选题</title>
    <link rel="stylesheet" href="../css/base.css">
    <link rel="stylesheet" href="../css/questionTest.css">
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

        <p><span class="single_tag"><%if (question.getqType() == 0) {%>单选题<%}%></span><%=question.getqName() %>
            <span>（<%=question.gettScore()%>分）</span>
        </p>
        <p><span>难度：</span><span class="keyword">
            <%if (question.getqLevel() == 0) {%>较易
            <%} else if (question.getqLevel() == 1) {%>容易
            <%} else if (question.getqLevel() == 2) {%>难
            <%} else {%>较难<% } %>
        </span>
            <span>关键字：</span><span class="keyword"><%=question.getqKeyword() %></span></p>

        <%
            String str = question.getqContent();
            //判断第一个字符
            if (str.startsWith("[")) {
                str = str.substring(1);
            }

            //判断最后一个字符
            if (str.endsWith("]")) {
                str = str.substring(0,str.length() - 1);
            }
            String[] arr = str.split("\\|");
        %>
        <p><span>（A）</span><input type="radio" name="qAnswer" value="A"><%=arr[0]%></p>
        <p><span>（B）</span><input type="radio" name="qAnswer" value="B"><%=arr[1]%></p>
        <p><span>（C）</span><input type="radio" name="qAnswer" value="C"><%=arr[2]%></p>
        <p><span>（D）</span><input type="radio" name="qAnswer" value="D"><%=arr[3]%></p>

        <p><input type="submit" class="add_btn" value="提交"/></p>
    </form>
</div>
<%}%>
</body>
</html>
