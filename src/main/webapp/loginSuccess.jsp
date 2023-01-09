<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
Member: ${sessionScope.user.member.id}<br>
Email: ${sessionScope.user.member.email}<br>
Account: ${sessionScope.user.account}<br>
Password: ${sessionScope.user.password}

</body>
</html>