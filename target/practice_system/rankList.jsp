<%@ page import="com.violetks.entity.Student" %>
<%@ page import="com.violetks.dao.BaseDaoImpl" %>
<%@ page import="com.violetks.entity.RankList" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Student student = (Student) session.getAttribute("student");
    if(student.getSid()==0){
        response.sendRedirect("studentLogin.jsp");
    }
    BaseDaoImpl dao = new BaseDaoImpl();
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>年级排行榜</title>
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/rankList.css">
</head>
<body onload="goPage(1,10)">
<%-----------导航条-------------%>
<div id="nav">
    <h1>Java练习系统</h1>
    <ul>
        <li><a href="index.jsp">首页</a></li>
        <li><a href="categorySet.jsp">试题分类</a></li>
        <li><a href="exerciseSet.jsp" target="view_window">练习记录</a></li>
        <%--<li>阶段检测</li>--%>
        <li style="color: blue">排行榜</li>
        <li>欢迎：<%=student.getName() %></li>
        <li><a href="logout.jsp" target="_top">退出</a></li>
    </ul>
</div>

<div>
    <%-----------表头-------------%>
    <table width="60%" border="0" align="center" id="topTable">
        <caption><h2>年级排行榜</h2></caption>
        <%
            List<RankList> rankList = dao.getExResult(0);
        %>
        <tr align="center">
            <td><b>学号</b></td>
            <td><b>姓名</b></td>
            <td><b>完成数量</b></td>
        </tr>
        <tr><td colspan="7"><hr></td></tr>
    </table>

    <%-----------表格区域-------------%>
    <table width="60%" border="0" align="center" id="questionTable">
        <%
            for (int i=0;i<rankList.size();i++){
                RankList list = rankList.get(i);
        %>
        <tr align="center">
            <td width="10%"><%=list.getSid()%></td>
            <td width="10%"><%=list.getName() %></td>
            <td width="10%"><%=list.getAmount() %></td>
        </tr>
        <% } %>
    </table>
    <%-----------分页区域-------------%>
    <table width="70%" align="right" >
        <tr><td><div id="changePages"></div></td></tr>
    </table>
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
            tempStr += "<a href=\"#\" onClick=\"goPage("+(currentPage-1)+","+psize+")\">&nbsp;<上一页</a>"
        }else{
            tempStr += "首页";
            tempStr += " <上一页";
        }

        if(currentPage<totalPage){
            tempStr += "<a href=\"#\" onClick=\"goPage("+(currentPage+1)+","+psize+")\">&nbsp;下一页></a>";
            tempStr += "<a href=\"#\" onClick=\"goPage("+(totalPage)+","+psize+")\">&nbsp;尾页</a>";
        }else{
            tempStr += " 下一页>";
            tempStr += " 尾页";
        }
        document.getElementById("changePages").innerHTML = tempStr;
    }
</script>
</body>
</html>
