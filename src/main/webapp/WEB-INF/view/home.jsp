<%--
  Created by IntelliJ IDEA.
  User: Shock
  Date: 2020/7/24
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    Welcome!!!!
<%--    display user name and role--%>
    <p>
        User: <security:authentication property="principal.username"/>
        <br><br>
        Role(s): <security:authentication property="principal.authorities"/>
    </p>
<%--    Add a link to point to /leaders... this is for the managers--%>
    <security:authorize access="hasRole('MANAGER')">
    <p>
        <a href="${pageContext.request.contextPath}/leaders">LeaderShip Meeting</a>
        (Only for Manager peeps)
    </p>
    </security:authorize>
    <security:authorize access="hasRole('ADMIN')">
    <p>
        <a href="${pageContext.request.contextPath}/admins">LeaderShip Meeting</a>
        (Only for Admin peeps)
    </p>
    </security:authorize>
<form:form action="${pageContext.request.contextPath}/logout" method="post">
    <input type="submit" value="Logout"/>
</form:form>
</body>
</html>
