<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>TEST</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<style>
		.marquee {
			font-size: 60px;
			height: 60px;
		}
		</style>
		
		<script src="<c:url value="/js/jquery.marquee.js" />"></script>
		
		<script>
		$(function() {
			
			RTW.join('Concert', '${command.id}');
			
			RTW.addHandler('Concert', '${command.id}', 'newMessage', function(message) {
				var $m = $DIV({
					cls:'marquee'
				});
				$m.text(message.content);
				$m.appendTo('body');
				$m.marquee();
				$m.bind('finished', function() {
					$(this).remove();
				});
			});
 
		});
		
		</script>
	</head>
	
	<body>
	</body>
</html>
