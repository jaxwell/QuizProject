<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>AccessDenied page</title>
</head>
<body>
<div class="generic-container">
    <div class="authbar">
        <span>Dear <strong>${loggedinuser}</strong>, You are not authorized to access this page.</span> <span
            class="floatRight"><a href="<c:url value="/logout" />">Logout</a></span>
    </div>
</div>
</body>
</html>
