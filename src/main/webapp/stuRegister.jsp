<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生账号注册</title>
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/stuRegister.css">
</head>
<body>
<div id="register_box">
    <h2>学生注册</h2>
    <form action="stuRegisterAdd.jsp" method="post">
        <div id="form_info">
            <span>学号：</span><input type="text" name="sid" id="sid" placeholder="请输入学号" /><br>
            <p class="error_msg" id="sid_error">学号不能为空！</p>
            <span>姓名：</span><input type="text" name="sName" id="sName" placeholder="请输入姓名" /><br>
            <p class="error_msg" id="sname_error">姓名不能为空！</p>
            <span>密码：</span><input type="password" name="spwd" id="spwd" placeholder="请输入密码" /><br>
            <p class="error_msg" id="spwd_error">密码不能为空！</p>
            <span>设置性别：</span>
            <label><input class="sex_btn" name="sex" type="radio" value="0" checked />保密</label>
            <label><input class="sex_btn" name="sex" type="radio" value="1" />男</label>
            <label><input class="sex_btn" name="sex" type="radio" value="2" />女</label><br>
            <p></p>
            <span>年级：</span><input type="text" list="grades_list" name="grades" placeholder="请选择年级" /><br>
            <datalist id="grades_list">
                <option label="大一" value="大一" />
                <option label="大二" value="大二" />
                <option label="大三" value="大三" />
                <option label="大四" value="大四" />
                <option label="其他" value="其他" />
            </datalist>
            <p class="error_msg" id="grades_error">年级不能为空！</p>
            <span>班级：</span><input type="text" name="classInfo" id="classInfo" placeholder="请输入班级，例：通信三班" /><br>
            <p class="error_msg" id="classInfo_error">班级不能为空！</p>
            <input type="submit" value="注  册" id="register_btn">
        </div>
    </form>
</div>
</body>
</html>
