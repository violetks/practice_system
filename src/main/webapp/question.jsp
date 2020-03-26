<%@ page import="com.violetks.entity.Student" %>
<%@ page import="com.violetks.dao.BaseDaoImpl" %>
<%@ page import="com.violetks.entity.Question" %>
<%@ page import="com.violetks.fileUtil.FileOutput" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>进入单个试题</title>
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/question.css">
</head>
<body>
<%!
    FileOutput fo = new FileOutput();
%>

<%
    Student student=(Student) session.getAttribute("student");
    if(student.getSid()==0){
        response.sendRedirect("studentLogin.jsp");
    }
    BaseDaoImpl dao = new BaseDaoImpl();
    String qid=request.getParameter("qid");

    Question question = dao.getQuestion(Integer.parseInt(qid));
    if(question==null){
        response.sendRedirect("question.jsp");
    }else{
        session.setAttribute("question",question);
%>

<%-----------导航条-------------%>
<div id="nav">
    <h1>Java练习系统</h1>
    <ul>
        <li><a href="index.jsp">首页</a></li>
        <li><a href="categorySet.jsp">试题分类</a></li>
        <li><a href="exerciseSet.jsp" target="view_window">练习记录</a></li>
        <li>阶段检测</li>
        <li><a href="rankList.jsp" target="view_window">排行榜</a></li>
        <li>欢迎：<%=student.getName() %></li>
        <li>退出</li>
    </ul>
</div>
<%-----------内容部分-------------%>
<div id="content_box">
    <a href="questionSet.jsp?category=<%=question.getCategory() %>" onclick="javascript:history.back(-1);">
        &gt;&gt;返回试题集
    </a>
    <b>试题名称：</b>
    <span><%=question.getName()%></span><br>
    <b>试题内容：</b>
    <p><%=question.getContent() %></p>
</div>
<%-----------表格区域-------------%>
<table width="800px" border="0" align="center">
    <tr>
        <td width="60%"><div align="left"><b>样例输入1:</b>
            <% String str = fo.readFile(qid,"input", 1);%>
            <pre><%=str %></pre></div></td>
        <td width="40%"><div align="left"><b>样例输入2:</b>
            <% str = fo.readFile(qid,"input", 2);%>
            <pre><%=str %></pre></div></td>
    </tr>
    <tr>
        <td width="60%"><div align="left"><b>样例输出1:</b>
            <%if(fo.readFile(qid,"input", 1).equals("无")){
                str = fo.readFile(qid,"example", 1);
            } else{
                str = fo.readFile(qid,"answer", 1);
            }%>
            <pre><%=str %></pre></div></td>
        <td width="40%"><div align="left"><b>样例输出2:</b>
            <% str=fo.readFile(qid,"answer", 2);%>
            <pre><%=str %></pre></div></td>
    </tr>
    <tr>
        <td align="left"><b>输入源代码：</b></td>
    </tr>
    <tr>
        <td>
            <form name="form" action="compileRun.jsp" method="post" onsubmit="getCode()" >
                <textarea id="codeArea" name="codeStr" placeholder="源代码提交时注意：
                1.类名改为“Main”;
                2.import语句不能少;
                3.删掉输入/输出提示信息的代码;
                4.删掉代码中的package;"></textarea>
                <input type="submit" id="submitCode" value="提交代码"/>
            </form>
        </td>
    </tr>
</table>

<script type="text/javascript">
    function getCode(){
        var str = document.getElementById("codeArea").value;  // 获取文本框输入值
        var arr = str.split(" ");
        arr.forEach(function (value, index, array) {
            if (array.indexOf("class")===-1){
                alert("请输入源代码！");
                return false
            }else {
                return true
            }
        })
        // 下面这个for循环，第一次元素是 "public"，就直接跳出循环返回 false 了
        // for(var i=0;i<arr.length;i++){
        //     console.log(arr[i]);
        //     if ()
        //     if(arr[i]==="class"){
        //         // document.getElementById("submitCode").value="请稍后...";   // 提交代码按钮显示文字
        //         // console.log(document.getElementById("submitCode").value);
        //         // document.getElementById("submitCode").disabled=true;
        //         return true;
        //     } else{
        //         console.log("请输入源代码!");
        //         // form.codeStr.focus();
        //         // return false;
        //     }
        // }
    }
</script>
<%}%>
</body>
</html>
