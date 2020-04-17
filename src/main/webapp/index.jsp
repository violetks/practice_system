<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Java练习系统-首页</title>
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/index.css">
</head>
<body>
<%-----------导航条-------------%>
<div id="nav">
    <h1>Java练习系统</h1>
    <ul>
        <li><a href="index.jsp">首页</a></li>
        <li><a href="student/categorySet.jsp">试题分类</a></li>
        <li><a href="student/exerciseSet.jsp">练习记录</a></li>
        <li><a href="student/rankList.jsp">排行榜</a></li>
        <li><a href="#choose_box">登录</a></li>
    </ul>
</div>
<%-----------欢迎文字部分-------------%>
<div id="content_box">
    <h3>欢迎使用Java练习系统</h3>
    <div id="welcome_box">
        <p>本系统欢迎爱好java编程的同学们。通过使用本系统，同学们可以练习一些重要的编程方法，提高自己的编程水平，提升自己的竞争力。</p>
        <p>本系统的特点：</p>
        <p>1. <b>入门引导：</b>设置入门引导试题，帮助同学们初步掌握简单的Java编程步骤。</p>
        <p>2. <b>试题分组：</b>具有相同难度和特点的试题形成一组，同组的试题具有相关性，帮助同学学习与提高程序设计、算法、数据结构的知识。</p>
        <p>3. <b>不断更新的试题：</b>系统不定期更新试题，保证同学的训练量。</p>
        <p>4. <b>测试管理：</b>可以将练习系统的题目进行分数统计，方便了解各同学的练习情况。</p>
        <p>5. <b>即时评测：</b>提交答案后马上进行评测并给出评测结果，方便同学了解自己程序的不足，对自己的程序进行改进。</p>
    </div>
</div>
<%-----------选择登录身份-------------%>
<div id="choose_box">
    <div class="top">
        <p>选择登录方式</p>
        <p>LOG ON TO WAY</p>
    </div>
    <div class="choose_user">
        <div class="box">
            <a href="teacherLogin.jsp">
                <p class="pic"><img src="http://static.lanqiao.cn/account/images/login/login-teacher.png"></p>
                <p>我是老师</p>
                <p class="btn">点击登录</p>
            </a>
        </div>
        <div class="box">
            <a href="studentLogin.jsp">
                <p class="pic"><img src="http://static.lanqiao.cn/account/images/login/login-student.png"></p>
                <p>我是学生</p>
                <p class="btn">点击登录</p>
            </a>
        </div>
    </div>
</div>
</body>
</html>
