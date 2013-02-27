<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>TEST</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<style>
			#video-wrapper {
				float: left;
				width: 70%;
			}
			#chat-wrapper {
				float: left;
				width: 30%;
			}
			#stage-wrapper {
				float: left;
				width: 30%;
			}
		</style>
		
		<script type="text/javascript" src="<c:url value="/js/jwplayer.js" />"></script>
		<script>
		$(function() {
			
			jwplayer("jwpalyer").setup({
		        file: "<c:url value="/img/test.mp4" />",
		        image: "<c:url value="/img/test.jpg" />"
		    });
			
			RTW.join('Concert', '${command.id}');
			RTW.addHandler('Concert', '${command.id}', 'newMessage', function(message) {
				console.log(message);
				$('#messages').append($LI(message.sender.nickname + ': ' + message.content));
			});
			
			$('#chat').submit(function() {
				$.post('${pageContext.request.contextPath}/concert/chat', {
					concertId: '${command.id}'
					, content: $('#message').val()
				}, function(data) {
					console.log(data);
				}, 'json');
				$('#message').val('');
				return false;
			});
			
		});
		</script>
		
	</head>
	
	<body>
		
		<div>
			<div id="video-wrapper">
				<div id="jwpalyer">Loading the player...</div>
			</div>
			
			<div id="chat-wrapper">
				<ul id="messages">
				</ul>
				<form id="chat">
					<input id="message">
					<input type="submit">
				</form>
			</div>
			
			<div id="stage-wrapper">
				stage
			</div>
		</div>
		
	</body>
</html>
