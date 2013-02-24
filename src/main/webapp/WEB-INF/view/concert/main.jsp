<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

	<head>
		<title>공연 보기</title>
		<script>
		function popup(url, title, w, h) {
			var left = (screen.width / 2) - (w / 2);
			var top = (screen.height / 2) - (h / 2) - 40;
			return window.open(url, title, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
		}
		</script>
	</head>

	<body>
	
		<div id="wrapper">
			<c:forEach items="${command.list}" var="command">
				<a href="javascript:popup('<c:url value="/concert/${command.id}" />', 'Concert', 1000, 700);">${command.title} 공연 보기</a><br>
			</c:forEach>
		</div>

	</body>
</html>
