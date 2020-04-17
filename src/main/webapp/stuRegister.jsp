<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生账号注册</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/stuRegister.css">
</head>
<body>
<div id="register_box">
    <h2>学生注册</h2>
    <hr>
    <form action="${pageContext.request.contextPath}/StuRegisterServlet" method="post" onsubmit="return checkAll()">
        <input type="hidden" name="form" value="true"/>
        <div id="form_info">
            <span>学号：</span><input type="text" name="sid" id="sid" placeholder="请输入学号"
                                   onblur="checkSid()" required="required"/><br>
            <p class="${msg!=null?'error_msg_show':'error_msg'}" id="sid_error">${msg}</p>

            <span>姓名：</span><input type="text" name="sName" id="sName" placeholder="请输入姓名"
                                   onblur="checkName()" required="required"/><br>
            <p class="error_msg" id="sname_error"></p>

            <span>密码：</span><input type="password" name="spwd" id="spwd" placeholder="请输入密码"
                                   onblur="checkPassword()" required="required"/><br>
            <p class="error_msg" id="spwd_error"></p>

            <span>确认密码：</span><input type="password" name="confirmPwd" id="confirmPwd" placeholder="请确认密码"
                                     onblur="confirmPassword()" required="required" style="width:220px"/><br>
            <p class="error_msg" id="confirm_error"></p>

            <span>设置性别：</span>
            <label><input class="sex_btn" name="sex" type="radio" value="0" checked/>保密</label>
            <label><input class="sex_btn" name="sex" type="radio" value="1"/>男</label>
            <label><input class="sex_btn" name="sex" type="radio" value="2"/>女</label><br>
            <p class="error_msg"></p>

            <span>年级：</span><input type="text" list="grades_list" name="sGrade" placeholder="请选择年级"
                                   required="required"/><br>
            <datalist id="grades_list">
                <option label="大一" value="大一"/>
                <option label="大二" value="大二"/>
                <option label="大三" value="大三"/>
                <option label="大四" value="大四"/>
                <option label="其他" value="其他"/>
            </datalist>
            <p class="error_msg"></p>

            <span>班级：</span><input type="text" name="sClass" id="sClass"
                                   placeholder="请输入班级，例：通信三班" required="required"/><br>
            <p class="error_msg"></p>

            <span>院系：</span><input type="text" name="dept" id="dept" placeholder="请输入所属院系"
                                   required="required"/>
            <p class="error_msg"></p>

            <input type="submit" value="注  册" id="register_btn">
        </div>
    </form>
</div>

<script type="text/javascript">
    // 1. 验证学号
    function checkSid() {
        var sid = document.getElementById("sid").value;
        var sidError = document.getElementById("sid_error");
        // 学号的规则： 长度为8-10，只能是数字
        var reg = /^\d{8,10}$/;
        if (!reg.TestScanner(sid)) {
            sidError.style.display = "block";
            document.getElementById("sid").style.marginBottom = "0px";
            sidError.innerText = "学号长度为8-10，只能是数字";
            return false;
        } else {
            sidError.style.display = "none";
            document.getElementById("sid").style.marginBottom = "30px";
            return true;
        }
    }

    // 2. 验证姓名
    function checkName() {
        var sName = document.getElementById("sName").value;
        var snameError = document.getElementById("sname_error");
        // 姓名的规则：昵称的长度为1-15，包含任意的字母、数字、中文，不可以使用其他符号
        var reg = /^([\u4e00-\u9fa5]|[a-zA-Z0-9]){1,15}$/i;
        if (!reg.TestScanner(sName)) {
            snameError.style.display = "block";
            document.getElementById("sName").style.marginBottom = "0px";
            snameError.innerText = "昵称的长度为1-15，包含任意的字母、数字、中文，不可以使用其他符号";
            return false;
        } else {
            snameError.style.display = "none";
            document.getElementById("sName").style.marginBottom = "30px";
            return true;
        }
    }

    // 3. 验证密码
    function checkPassword() {
        var spwd = document.getElementById("spwd").value;
        var spwdError = document.getElementById("spwd_error");
        // 密码的规则： 6-16，包含任意的字母、数字，不可以使用其他符号
        var reg = /^([a-zA-Z0-9]){6,16}$/i;
        if (!reg.TestScanner(spwd)) {
            spwdError.style.display = "block";
            document.getElementById("spwd").style.marginBottom = "0px";
            spwdError.innerText = "密码的长度为 6-16，包含任意的字母、数字，不可以使用其他符号";
            return false;
        } else {
            spwdError.style.display = "none";
            document.getElementById("spwd").style.marginBottom = "30px";
            return true;
        }
    }

    // 4. 确认密码
    function confirmPassword() {
        var spwd = document.getElementById("spwd").value;
        var confirmPwd = document.getElementById("confirmPwd").value;
        var confirmError = document.getElementById("confirm_error");
        //密码的规则： 6-16，包含任意的字母、数字，不可以使用其他符号
        var reg = /^([a-zA-Z0-9]){6,16}$/i;
        //确认密码输入符合规则  
        if (reg.TestScanner(confirmPwd)) {
            if (spwd !== confirmPwd) {
                confirmError.style.display = "block";
                document.getElementById("confirmPwd").style.marginBottom = "0px";
                confirmError.innerText = "两次输入的密码不一致！";
                return false;
            } else {
                confirmError.style.display = "none";
                document.getElementById("confirmPwd").style.marginBottom = "30px";
                return true;
            }
        }
        //确认输入密码不符合规则
        else {
            confirmError.style.display = "block";
            document.getElementById("confirmPwd").style.marginBottom = "0px";
            confirmError.innerHTML = "密码的长度为 6-16，包含任意的字母、数字，不可以使用其他符号";
            return false;
        }
    }

    // 5.检查用户所有的输入的是否符合规则
    function checkAll() {
        var sid = checkSid();
        var sname = checkName();
        var spwd = checkPassword();
        var confirmPwd = confirmPassword();
        return sid && sname && spwd && confirmPwd;
    }
</script>
</body>
</html>
