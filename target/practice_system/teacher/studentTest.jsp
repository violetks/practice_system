<%@ page import="com.violetks.fileUtil.CodeOutput" %>
<%@ page import="com.violetks.dao.StudentDao" %>
<%@ page import="com.violetks.entity.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="com.violetks.dao.RecordDao" %>
<%@ page import="com.violetks.entity.Record" %>
<%@ page import="com.violetks.dao.MarkDao" %>
<%@ page import="com.violetks.entity.Mark" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    RecordDao recordDao = new RecordDao();
    StudentDao dao = new StudentDao();
    List<Student> studentList = dao.getStudentLists();
    MarkDao markDao = new MarkDao();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生作业</title>
    <link rel="stylesheet" href="../css/studentTest.css">
</head>
<body>
<%!
    CodeOutput co = new CodeOutput();
%>

<p class="${msg!=null?'error_msg_show':'error_msg'}" id="errorMsg">${msg}</p>

<p class="info_msg">点击题目名称，可展开查看详细内容，并进行评分。</p>

<%-----------表格区域-------------%>
<div id="table_area">
    <%-----------表头-------------%>
    <table border="0" align="center" id="tableTh">
        <caption><h2>学生作业</h2></caption>
        <tr align="center">
            <td><b>编号</b></td>
            <td><b>学号</b></td>
            <td><b>学生姓名</b></td>
            <td><b>试题类型</b></td>
            <td><b>题目名称</b></td>
            <td><b>提交时间</b></td>
            <td><b>满分</b></td>
            <td><b>得分</b></td>
            <td><b>是否批阅</b></td>
        </tr>

        <%
            int count = 0;  // 设置递增行号
            for (int i = 0; i < studentList.size(); i++) {
                Student student = studentList.get(i);
                int sid = student.getSid();

                // 根据学号查询练习记录
                List<Record> recordList = recordDao.getExciseResult(sid);
                for (int j = 0; j < recordList.size(); j++) {
                    Record record = recordList.get(j);
                    int qType = record.getQuestion().getqType();
                    count++;

                    // 查询评分记录
                    Mark m = markDao.getMark(sid, record.getQid());
        %>

        <form action="${pageContext.request.contextPath}/AddMarkServlet" method="post">
            <tr align="center">
                <td><%=count %>
                    <input type="hidden" name="qid" value="<%=record.getQid() %>"/>
                </td>
                <td><%=sid %>
                    <input type="hidden" name="sid" value="<%=sid %>"/>
                </td>
                <td><%=student.getsName() %>
                </td>
                <td><%if (qType == 0) {%><span class="single_tag">单选题</span>
                    <%} else if (qType == 2) {%><span class="fill_tag">填空题</span>
                    <%} else {%><span class="program_tag">编程题</span><%}%>
                </td>
                <td style="width: 150px">
                    <a class="qName" onclick="showDetail(<%=count %>)"><%=record.getQuestion().getqName() %>
                    </a>
                </td>
                <td><%=record.getSubmitTime() %>
                </td>
                <td><%=record.getQuestion().gettScore() %>
                    <input type="hidden" name="tScore" value="<%=record.getQuestion().gettScore() %>"/>
                </td>
                <td><%if (m == null) {%>暂无
                    <% } else {%><%=m.getsScore()%>
                    <% } %>
                </td>
                <td><%if (m == null) {%><span class="mark_tag">未批阅</span>
                    <% } else {%><span class="marked_tag">已批阅</span><%}%>
                </td>
            </tr>

            <tr class="open_tr">
                <td colspan="6">
                    <div class="qDetails">
                        <h4>查看详细信息</h4>
                        <% if (qType == 0 || qType == 2) {%>
                        <p><span>正确答案：</span><%=record.getQuestion().getqAnswer() %>
                        </p>
                        <p><span>学生答案：</span><%=record.getsAnswer() %>
                        </p>
                        <%} else {%>
                        <span>学生代码：</span>
                        <pre><%= co.readFile(sid, record.getQid()) %></pre>
                        <span>运行结果：</span><%=record.getsAnswer() %>
                        <% if (record.getsRate() != 0) {%>
                        <p><span>代码正确率：</span><%=record.getsRate() %><span>%</span>
                        </p>
                        <%}%>
                        <%}%>
                        <span>评分</span><input type="text" name="sScore"/>
                        <input type="submit" class="add_btn" value="提交"/>
                    </div>
                </td>
            </tr>
        </form>
        <% } %>
        <% } %>
    </table>
</div>

<script type="text/javascript">
    // 展开行
    function showDetail(i) {
        var num = i - 1;
        var openRow = document.getElementsByClassName("open_tr");
        if (openRow[num].style.display == "table-row") {
            openRow[num].style.display = "none";
        } else {
            openRow[num].style.display = "table-row";
        }
    }
</script>
</body>
</html>
