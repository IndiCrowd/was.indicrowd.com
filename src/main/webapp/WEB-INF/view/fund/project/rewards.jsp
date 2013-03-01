<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

	<head>
		<title>프로젝트 보상 입력</title>
	</head>

	<body>
	
		<div id="page-title">
		
			<h2>프로젝트 보상 입력</h2>
		
		</div>
	
		<div id="wrapper">
			<div id="content">
				<a href="<c:url value="/fund/project/${command.id}/open" />">보상 입력 완료</a>
			</div>
		</div>

	</body>
</html>
