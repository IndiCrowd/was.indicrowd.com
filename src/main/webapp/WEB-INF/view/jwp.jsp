<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>TEST</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script type="text/javascript" src="<c:url value="/js/jwplayer.js" />"></script>
	</head>
	
	<body>
	
		<div id="myElement">Loading the player...</div>

		<script type="text/javascript">
		    jwplayer("myElement").setup({
		        file: "<c:url value="/img/test.mp4" />",
		        image: "<c:url value="/img/test.jpg" />"
		    });
		</script>
		
	</body>
</html>
