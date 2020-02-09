<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="static java.lang.System.out" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Java练习系统-首页</title>
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
        /*********** 欢迎文字部分 **********/
        #content_box{
            width: 800px;
            margin: 30px auto;
            font-family: 宋体;
        }
        #content_box h3{
            text-align: center;
        }
        #welcome_box{
            text-indent: 2em;
        }
        /*********** 选择登录身份 **********/
        #choose_box{
            width: 700px;
            margin: 240px auto;
        }
        #choose_box a{
            color: #333;
            font-size: 18px;
            text-decoration: none;
        }
        .top p{
            text-align: center;
        }
        .top p:first-child{
            font-size: 22px;
            color: #333;
            margin-bottom: 0;
        }
        .top p:last-child{
            font-size: 12px;
            color: #999;
            font-family: Arial;
        }
        .choose_user{
            overflow: hidden;
        }
        .box{
            float: left;
            width: 285px;
            height: 285px;
            border-radius: 5px;
            text-align: center;
            margin: 0 32px;
            background-color: white;
        }
        .pic{
            margin-top: 60px;
            margin-bottom: 20px;
        }
        .btn{
            width: 96px;
            height: 30px;
            font-size: 14px;
            margin: 20px auto 0;
            line-height: 30px;
            text-align: center;
            background: transparent;
            color: #fff;
            border: 1px solid #fff;
            border-radius: 15px;
        }
    </style>
</head>
<body>
<%-----------导航条-------------%>
<div id="nav">
    <h1>Java练习系统</h1>
    <ul>
        <li><a href="index.jsp">首页</a></li>
        <li>试题分类</li>
        <li>练习记录</li>
        <li>阶段检测</li>
        <li>排行榜</li>
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
            <a href="javascript:void(0);">
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

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
    $(function(){
        // 鼠标移入移出样式改变
        $(".box").hover(function () {
            $(this).find("p").eq(1).css({"color":"white"});
            $(this).css({"background": "#0075B6"});
        },function () {
            $(this).find("p").eq(1).css({"color":"#333"});
            $(this).css({"background": "white"});
        })
    })
</script>
</body>
</html>
