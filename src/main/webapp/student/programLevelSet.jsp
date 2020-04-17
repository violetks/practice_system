<%@ page import="com.violetks.entity.Student" %>
<%@ page import="com.violetks.entity.Question" %>
<%@ page import="java.util.List" %>
<%@ page import="com.violetks.dao.ProgramDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ProgramDao dao = new ProgramDao();
    int q_level=Integer.parseInt(request.getParameter("q_level"));
    List<Question> questionList =dao.getQuestionListByLevel(q_level);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>每类试题集</title>
    <link rel="stylesheet" href="../css/base.css">
    <link rel="stylesheet" href="../css/questionSet.css">
</head>
<body onload="goPage(1,6)">
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
<%-----------表格区域-------------%>
<div id="table_area">
    <a id="first_a" href="programSet.jsp?sid="${student.getSid()} onclick="javascript:history.back(-1);">
        返回试题分类
    </a>

    <%-----------表头-------------%>
    <table border="0" align="center" id="tableTh">
        <tr align="center">
            <td><b>试题编号</b></td>
            <td style="width: 150px"><b>试题名称</b></td>
            <td><b>关键字</b></td>
            <td><b>难度等级</b></td>
            <td><b>完成状态</b></td>
            <td><b>进入试题</b></td>
            <td><b>提交记录</b></td>
        </tr>
    </table>

    <%-----------表格区域-------------%>
    <table border="0" align="center" id="questionTable">
        <%
            for (int i = 0; i< questionList.size(); i++){
                Question question = questionList.get(i);
                int qid = question.getQid();
        %>
        <tr align="center">
            <td><%=qid %></td>
            <td style="width: 150px"><%=question.getqName() %></td>
            <td><%=question.getqKeyword() %></td>
            <td><%if (question.getqLevel()==0){%><%="较易" %>
                <% }else if(question.getqLevel()==1){%><%="容易" %>
                <% }else if(question.getqLevel()==2){%><%="难" %>
                <% }else{%><%="较难" %><%} %>
            </td>
            <%--<td><%if (dao.getExResult(student.getSid(), question.getQid(),2,1)>=1){ %> <%="已完成" %>--%>
                <%--<% }else{%><%="未完成" %><%} %>--%>
            <%--</td>--%>
            <td>未完成</td>
            <td>
                <form action="programQItem.jsp" method="post">
                    <input type="hidden" name="qid" value=<%=qid %> />
                    <input type="submit" class="enter_btn" value="进入试题" />
                </form>
            </td>
            <td>提交记录</td>
            <%--<td><%=dao.getExResult(student.getSid(), question.getQid(),2,1) %></td>--%>
        </tr>
        <% } %>
    </table>
    <%-----------分页区域-------------%>
    <div id="changePages"></div>
</div>

<script type="text/javascript">
    <%------分页-------%>
    function goPage(pno,psize){
        var questionTable = document.getElementById("questionTable");//获取table
        var pageNum = questionTable.rows.length;//得到记录总数
        var pageSize =psize;//一页显示pageSize条记录
        var totalPage = 0;
        //计算总页数
        if(pageNum/pageSize > parseInt(pageNum/pageSize)){
            totalPage=parseInt(pageNum/pageSize)+1;
        }else{
            totalPage=parseInt(pageNum/pageSize);
        }
        //当前页数
        var currentPage = pno;
        //获取当前页第一条、最后一条记录的行号
        var startRow = (currentPage - 1) * pageSize+1;
        var endRow = currentPage * pageSize;
        endRow = (endRow > pageNum)? pageNum : endRow;
        //修改table中当前页对应的行的属性为显示，非本页的记录为隐藏
        for(var i=1;i<(pageNum+1);i++){
            var irow = questionTable.rows[i-1];
            if(i>=startRow && i<=endRow){
                irow.style.display = "block";
            }else{
                irow.style.display = "none";
            }
        }

        var tempStr = "共"+pageNum+"条记录 分"+totalPage+"页 当前第"+currentPage+"页  ";
        if(currentPage>1){
            tempStr += "<a href=\"#\" onClick=\"goPage("+(1)+","+psize+")\">首页</a>";
            tempStr += "<a href=\"#\" onClick=\"goPage("+(currentPage-1)+","+psize+")\"><上一页</a>"
        }else{
            tempStr += "<a>首页</a>";
            tempStr += "<a><上一页</a>";
        }

        if(currentPage<totalPage){
            tempStr += "<a href=\"#\" onClick=\"goPage("+(currentPage+1)+","+psize+")\">下一页></a>";
            tempStr += "<a href=\"#\" onClick=\"goPage("+(totalPage)+","+psize+")\">尾页</a>";
        }else{
            tempStr += "<a>下一页></a>";
            tempStr += "<a>尾页</a>";
        }
        document.getElementById("changePages").innerHTML = tempStr;
    }
</script>
</body>
</html>
