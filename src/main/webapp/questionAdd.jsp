<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>试题添加结果</title>
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/questionAdd.css">
</head>
<body>
<table width="100%" height="12%" border="0" align="center" bgcolor="#7b7b7b">
    <tr>
        <td width="70%"><table width="70%" border="0" align="center">
            <tr align="center">
                <td width="40%"><p class="style4">后台管理</p></td>
                <td width="9%"><span class="style9">试题输入</span></td>
                <td width="9%"><span class="style9">试题分类</span></td>
                <td width="9%"><span class="style9">试题修改</span></td>
                <td width="9%"><span class="style9">用户管理</span></td>
                <td width="9%"><span class="style9"><a href="ranklist.jsp" target="view_window">排行榜</a></span></td>
                <td width="8%"><span class="style9"><a href="login.jsp" target="view_window">返回首页</a></span></td>
            </tr>
        </table></td>
    </tr>
</table>
<p>&nbsp;</p>
<p>&nbsp;</p>
<%!public String[][] StrSplit(String s){//把多行文本拆分成二维数组
    String[] s1=s.split("\\n|\r\n");//把多行拆分
    String a[][]=new String[s1.length][];
    for(int i=0;i<s1.length;i++){
        a[i]=s1[i].split("\\s+");
    }

    return a;
}

    public boolean isSpace(String[] str){
        if(str==null) return true;
        for(int i=0;i<str.length;i++){
            if(str[i].trim()==""||str[i]==null){
                return true;
            }
        }
        return false;
    }
    FileInput fi=new FileInput();
    String name="";
    String keyword="";
    String content="";
    String category="";
    String input="";
    int qid=0;
%>
<table width="40%"  border="0" align="center">
    <tr>
        <td height="25" colspan="1"><br><strong>&gt;&gt;
            <a href="question_input.jsp"  onclick="javascript:history.back(-1);">
                返回试题输入</a></strong><br><br></td>
    </tr>
    <tr >

        <%
            name=request.getParameter("name");
            keyword=request.getParameter("keyword");
            content=request.getParameter("content");
            category=request.getParameter("category");
            input=request.getParameter("input");
            //String[] a1=answer1.split("\\n|\r\n");//把多行拆分
            Question question=new Question();
            question.setName(name);
            question.setContent(content);
            question.setKeyword(keyword);
            question.setCategory(Integer.parseInt(category));
            DaoDB dao=new DaoDB();
            if(dao.addQuestion(question)){ %>
        <%="试题已写入数据库"%><br/>
        <%}%>
        <% //获得试题表中试题的最后题号
            qid=dao.getLastQid();
            if(qid==0){
        %>
        <%="没有获取到题号，测试答案不能生成。<br/>" %>
        <%}
            //  qid=qid+1;//新增题号大小？不用的
        %>
        <%="新建第"+qid+"题"%><br/>

        <% if(fi.createDir(qid)){%><%="文件夹生成" %><br/>
        <% if(input.equals("yes")){
            String in[]=request.getParameterValues("in");
            String answer[]=request.getParameterValues("answer");
            //for(int i=0;i<answer.length;i++){//answer is or isnot null
            //if(){
            //}
            //}
            // if(){//answer is null
            if(!isSpace(in)){
                for(int i=0;i<in.length;i++){
                    if(fi.createFile(qid,"input"+qid+"0"+(i+1),StrSplit(in[i])))
                    {%><%="测试输入文件"%><%=i+1%><%="生成<br>" %><% }%><br/>
        <%if(fi.createFile(qid,"answer"+qid+"0"+(i+1),StrSplit(answer[i])))
        { %><%="测试答案文件"%><%=i+1%><%="生成<br>" %><% }%><br/>
        <%}
        }
            //}
        }else{
            String answer=request.getParameter("a");
            String example=request.getParameter("e");
            if(fi.createFile(qid,"answer"+qid+"01",StrSplit(answer)))
            { %><%="测试答案文件生成<br>" %> <% }%><br/>
        <%if(fi.createFile(qid,"example"+qid+"01",StrSplit(example)))
        { %><%="测试样例文件生成<br/>" %> <% }%><br/>
        <%}%>
        <%}else{%>
        <%="文件夹生成失败<br/>"%><%} %>

    </tr>
</table>
<table width="100%" height="12%" border="0" align="center">
    <tr>
        <td height="60%" bgcolor="#7b7b7b"><table width="941" border="0" align="center">
            <tr>
                <td height="20%" colspan="3"><div align="center">
                    <p class="style6"> 制作：电子信息学院熊琳&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        E-mail: <a href="mailto:65732940@qq.com"> 65732940@qq.com</a> <br>
                    </p>
                </div></td>
                <td height="20%"><p align="center" class="style6"><strong>谢谢您的使用！</strong></p>
                    <h4 align="center" class="style11">请提出改进意见！ </h4>
            </tr>
        </table></td>
    </tr>
</table>
</body>
</html>
