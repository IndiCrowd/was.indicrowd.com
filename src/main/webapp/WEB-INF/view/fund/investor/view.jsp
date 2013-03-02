<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

	<head>
		<title>후원 보기</title>
	</head>

	<body>
	
		<div id="page-title">
		
			<h2>후원 보기</h2>
		
		</div>
	
		<div id="wrapper">
			<div id="content">
				<p>
					amount : ${command.amount}
				</p>
				<p>
					creator : ${command.userInfo.nickname}
				</p>
				<p>
					investDate : ${command.investDate}
				</p>
			</div>
		</div>

	</body>
</html>
