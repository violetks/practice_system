<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>退出登录</title>
</head>
<body>
<% session.invalidate(); %>

<jsp:forward page="index.jsp" />
</body>
</html>
