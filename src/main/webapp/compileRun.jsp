<%@ page import="com.violetks.entity.Student" %>
<%@ page import="com.violetks.entity.Question" %>
<%@ page import="com.violetks.complierun.JavaCompileRun" %>
<%@ page import="java.io.File" %>
<%@ page import="com.violetks.dao.BaseDaoImpl" %>
<%@ page import="com.violetks.entity.Record" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>运行结果</title>
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/compileRun.css">
</head>
<body>
<%
    final String inputPath = "C://Users//Xionglin//IdeaProjects//practice_system//src//main//resources//answer/";
    final String outputPath = "C://Users//Xionglin//IdeaProjects//practice_system//src//main//resources//output/";

    Student student=(Student) session.getAttribute("student");
    Question question=(Question) session.getAttribute("question");
    int qid = question.getQid();
    session.setAttribute("qid",qid);
    String codeStr = request.getParameter("codeStr");
    if(codeStr==null){
        response.sendRedirect("question.jsp");
    }else{
        JavaCompileRun jCR = new JavaCompileRun(codeStr);
        try{
            jCR.codeCompile(codeStr,qid,student.getSid());
        }catch(Exception e){
            jCR.setExceptionString("编译时异常");
        }
        if (!jCR.isCompileResult()||!jCR.isRunResult()) {
            session.setAttribute("jcr",jCR);
        }else{
            // 和答案文件进行比较，如果5个答案，比对成功一次得20分;如果只一个答案可对比，成功满分100
            // 检测答案文件夹中的文件个数，确定比较次数
            File f1 = new File(inputPath + qid);
            File[] fs = f1.listFiles();
            int score = 0;
            if(fs != null && fs.length > 5){//答案和输入文件个数
                for (int j=1; j<6; j++) {
                    String file1 = outputPath + student.getSid()+"/"+qid+"0"+j+".txt";
                    String file2 = inputPath + qid +"/answer"+qid+"0"+j+".txt";
                    if (jCR.fileCompare(file1,file2)) {
                        score += 20;
                        jCR.setScore(score);
                    }
                }
            }else{
                String file1 = outputPath + student.getSid()+"/"+qid+"01.txt";
                String file2 = inputPath + qid +"/answer"+qid+"01.txt";
                if (jCR.fileCompare(file1,file2)) {
                    score += 100;
                    jCR.setScore(score);
                }
            }
            session.setAttribute("jcr",jCR);
        }
%>
<%
    BaseDaoImpl dao = new BaseDaoImpl();
    if(student==null){
        response.sendRedirect("studentLogin.jsp");
    }
    // 练习记录
    Record record = new Record();
    record.setS(student);
    record.setQ(question);
    int result = 0;
    if(jCR.isCompileResult() && jCR.isRunResult() && jCR.getScore()==100){
        result = 1;
    }
    record.setResult(result);
    record.setCategory(question.getCategory());
    //避免运行成功结果重复写入,结果不正确也不写入数据库
    assert student != null;
    if(dao.getExResult(student.getSid(),question.getQid(),1)<1&&jCR.getScore()==100){
        dao.addExciseRecord(record);
    }
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
        <li><a href="logout.jsp" target="_top">退出</a></li>
    </ul>
</div>

<table width="50%" border="0" align="center">
    <tr>
        <td><p>&nbsp;</p></td>
    </tr>
    <tr>
        <td height="25" colspan="5">
            <b>&gt;&gt;
                <a href="question.jsp?qid=<%=question.getQid() %>" onclick="javascript:history.back(-1);">返回试题</a>
            </b>
        </td>
    </tr>
    <tr>
        <td><p>&nbsp;</p> </td>
    </tr>
    <tr>
        <td width="96"><div align="right"><b>提交题号</b></div></td>
        <td><%=question.getQid()%></td>
    </tr>
    <tr>
        <td width="96"><div align="right"><b>编译结果</b></div></td>
        <td width="100"><%=jCR.isCompileResult()?"成功":"失败" %></td>
    </tr>
    <tr>
        <td width="96"><div align="right"><b>运行结果</b></div></td>
        <td width="100"><%=jCR.isRunResult()?"成功":"失败" %></td>
    </tr>
    <tr>
        <td width="96"><div align="right"><b>运行时间</b></div></td>
        <td width="100"><%=jCR.getRuntime() %></td>
    </tr>
    <tr>
        <td width="96"><div align="right"><b>试题得分</b></div></td>
        <td width="100"><%=jCR.getScore() %></td>
    </tr>
    <tr>
        <td width="96"><div align="right"><b>异常信息</b></div></td>
        <td width="100"><%=jCR.getExceptionString() %></td>
    </tr>
    <tr>
        <td> &nbsp;</td>
    </tr>
    <tr>
        <td colspan=6><div align="center"><b>详细记录</b></div></td>
    </tr>
    <tr>
        <td> &nbsp;</td>
    </tr>
    <tr>
        <td width="100"><div align="center"><b>评测点序号</b></div></td>
        <td width="107"><div align="center"><b>评测结果</b></div></td>
        <td width="117"><div align="center"><b>得分</b></div></td>
        <td width="117"><div align="center"><b>下载评测数据</b></div></td>
    </tr>
    <tr align="center">
        <td width="100">待实现</td>
        <td width="107">待实现</td>
        <td width="117">待实现</td>
        <td width="117">待实现</td>
    </tr>
</table>
<%} %>
</body>
</html>