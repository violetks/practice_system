<%@ page import="com.violetks.entity.Student" %>
<%@ page import="com.violetks.entity.Record" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Record> recordList = dao.getExResult(student.getSid(), 1);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${student.getsName() }的练习记录</title>
    <link rel="stylesheet" href="../css/base.css">
    <link rel="stylesheet" href="../css/exerciseSet.css">
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
        <li>欢迎：${student.getsName() }</li>
        <li><a href="../logout.jsp" target="_top">退出</a></li>
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
