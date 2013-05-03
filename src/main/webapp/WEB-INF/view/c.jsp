<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
	
		<title>${command.title} 공연 보기</title>
		
	</head>
	<body>
		
		<a href="popup('<c:url value="/concert/${concert.id}" />', 'Concert', 1000, 700);">${command.title} 공연 보기</a>
		
	</body>
</html>
	