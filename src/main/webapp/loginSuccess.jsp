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
account:  <c:out value="${user.account}" /><br>
password:  <c:out value="${user.password}" /><br>
member_id:  <c:out value="${user.member.id}" /><br>
member_name:  <c:out value="${user.member.name}" /><br>
member_name:  <c:out value="${user.member.email}" /><br>

</body>
</html>