<%@ page import="com.violetks.entity.Student" %>
<%@ page import="com.violetks.dao.BaseDaoImpl" %>
<%@ page import="com.violetks.entity.Record" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Student student = (Student) session.getAttribute("student");
    if(student.getSid()==0){
        response.sendRedirect("studentLogin.jsp");
    }
    BaseDaoImpl dao = new BaseDaoImpl();
    List<Record> recordList = dao.getExResult(student.getSid(), 1);
%>
<html>
<head>
    <meta charset="UTF-8">
    <title><%=student.getName() %>的练习记录</title>
    <style type="text/css">
        body{margin: 0;padding: 0;background-color: #f7f9fa;}
        /*********** 导航条 **********/
        #nav{
            width: 100%;
            height: 80px;
            background-color: #283443;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        #nav h1{
            margin-left: 20px;
        }
        #nav a{
            color: white;
            text-decoration: none;
        }
        #nav ul li{
            float: left;
            margin-right: 20px;
            list-style: none;
        }
        /*********** 表格区域 **********/
        #topTable{
            margin-top: 60px;
        }
        table td{
            height: 25px;
        }
        #topTable a{
            text-decoration: none;
        }
        form{
            margin: 8px auto;
        }
        /*********** 分页区域 **********/
        #changePages{
            margin: 25px auto;
            font-family: 宋体;
        }
        #changePages a{
            text-decoration: none;
        }
    </style>
</head>
<body onload="goPage(1,6)">
<%-----------导航条-------------%>
<div id="nav">
    <h1>Java练习系统</h1>
    <ul>
        <li><a href="index.jsp">首页</a></li>
        <li><a href="categorySet.jsp">试题分类</a></li>
        <li style="color: blue">练习记录</li>
        <li>阶段检测</li>
        <li><a href="rankList.jsp" target="view_window">排行榜</a></li>
        <li>欢迎：<%=student.getName() %></li>
        <li>退出</li>
    </ul>
</div>

<div>
    <%-----------表头-------------%>
    <table width="60%" border="0" align="center" id="topTable">
        <tr align="center">
            <td width="107"><b>试题编号</b></td>
            <td width="207"><b>试题名称</b></td>
            <td width="157"><b>试题类型</b></td>
            <td width="157"><b>提交时间</b></td>
        </tr>
        <tr><td colspan="7"><hr></td></tr>
    </table>

    <%-----------表格区域-------------%>
    <table width="60%" border="0" align="center" id="questionTable">
        <%
            for (int i=0;i<recordList.size();i++){
                Record record = recordList.get(i);
        %>
        <tr align="center">
            <td width="107"><%=record.getId()%></td>
            <td width="207"><%=record.getName() %></td>
            <td width="157"><%if(record.getCategory()==0){%><%="入门训练" %>
                <% }else if(record.getCategory()==1){%><%="基础练习" %>
                <% }else if(record.getCategory()==2){%><%="算法练习" %>
                <% }else{%><%="算法提高" %><%} %>
            </td>
            <td width="157"><%=record.getSubmitTime() %></td>
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
