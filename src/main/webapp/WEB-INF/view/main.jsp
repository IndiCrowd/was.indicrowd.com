<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<sec:authentication property="principal" var="principal" />

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>TEST</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
	</head>
	
	<body>
	
		<sec:authorize access="isAuthenticated()">
		${principal.username}
		</sec:authorize>
		
		<a href="${pageContext.request.contextPath}/user/join">회원가입</a>
		<sec:authorize access="isAnonymous()">
			<a href="${pageContext.request.contextPath}/signin">로그인</a>
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			<a href="${pageContext.request.contextPath}/signout">로그아웃</a>
		</sec:authorize>
		
	</body>
</html>
