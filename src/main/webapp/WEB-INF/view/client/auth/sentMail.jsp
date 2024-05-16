<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
    <form:form method="post" action="/forgot-password/verify-email/linhnguyenthuy612@gmail.com">
        <div>
            <input type="hidden" name="${_csrf.parameterName}"
                   value="${_csrf.token}"/>

        </div>
        <button type="submit">sent</button>
    </form:form>
</body>
</html>