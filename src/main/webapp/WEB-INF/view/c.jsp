<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
	
		<title>${command.title} 공연 보기</title>
		
	</head>
	<body>
		
		<a href="javascript:popup('<c:url value="/concert/${command.id}" />', 'Concert', 1000, 700);">${command.title} 공연 보기</a>
		
	</body>
</html>
	