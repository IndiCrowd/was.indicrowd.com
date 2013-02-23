<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>TEST</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href='http://fonts.googleapis.com/css?family=Raleway:100' rel='stylesheet'>
		
		<style>
			html, body {
				background: #000;
			}
			#wrapper {
				height: 700px;
			}
			
			h1 { 
				font-size: 22px;
			  text-align: center;
			  text-transform: uppercase;
			  padding: 1px;
			  font-family: 'Raleway';
			  position: relative;
			  background: rgba(0, 0, 0, .5);
			}
			h1:before {
			  content: "";
			  position: absolute;
			  left: 50%;
			  top: -50px;
			  width: 600px;
			  margin-left: -300px;
			  margin-top: -220px;
			  height: 600px;
			  z-index: -1;
			}
			h1 a {
			  display: block;
			  padding: 20px;
			  text-decoration: none;
			  letter-spacing: 30px;
			  -webkit-animation: comein 1.5s 1 ease-in-out forwards;
			  -moz-animation: comein 1.5s 1 ease-in-out forwards;
			}
			@-webkit-keyframes comein {
			   0% { letter-spacing: 50px; color: rgba(255,255,255,0); }
			   70% { letter-spacing: 15px; }
			   100% { letter-spacing: 20px; color: rgba(255,255,255,1) }
			}
			@-moz-keyframes comein {
			   0% { letter-spacing: 50px; color: rgba(255,255,255,0); }
			   70% { letter-spacing: 15px; }
			   100% { letter-spacing: 20px; color: rgba(255,255,255,1) }
			}
			
			#concert-wrapper {
				background: rgba(0, 0, 0, .5);
				border-radius: 5px;
				position: absolute;
				left: 60px;
				top: 90px;
				width: 520px;
				height: 400px;
				z-index: 1000;
			}
			#concert {
				padding: 20px;
				line-height: 0;
			}
			
			#info-wrapper {
				background: rgba(0, 0, 0, .5);
				border-radius: 5px;
				position: absolute;
				width: 320px;
				height: 150px;
				left: 620px;
				top: 90px;
			}
			#info {
				padding: 20px;
				color: #fff;
			}
			
			#chat-wrapper {
				background: rgba(0, 0, 0, .5);
				border-radius: 5px;
				position: absolute;
				width: 320px;
				height: 418px;
				left: 620px;
				top: 260px;
			}
			#chat {
				padding: 20px;
			}
			
			#stage-wrapper {
				background: rgba(0, 0, 0, .5);
				border-radius: 5px;
				position: absolute;
				width: 520px;
				left: 60px;
				top: 510px;
			}
			#stage {
				padding: 16px;
				overflow: auto;
			}
			#stage img {
				background: rgba(255, 255, 255, .5);
				padding: 5px;
				margin: 4px;
				float: left;
			}
			
			#footer-wrapper {
				position: absolute;
				right: 10px;
				bottom: 10px;
			}
			#footer {
				color: #fff;
			}
		</style>
		
		<script>
		$(function() {
			
			RealtimeWebClient.join('Concert', 'hall', function(data) {
				console.log('connect:', data);
			}, function(data) {
				console.log('disconnect:', data);
			});
			
			RealtimeWebClient.join('Concert', '${command.id}');
			RealtimeWebClient.setHandler('Concert', '${command.id}', 'newMessage', function(message) {
				console.log(message);
				$('#messages').append($LI(message.sender.nickname + ': ' + message.content));
			});
			
			$('#chat form').submit(function() {
				$.post('${pageContext.request.contextPath}/concert/chat', {
					concertId: '${command.id}'
					, content: $('#message').val()
				}, function(data) {
					console.log(data);
				}, 'json');
				$('#message').val('');
				return false;
			});
			
			var bg = '<c:url value="/img/concert/concertbg.jpg" />';
			
			$('#wrapper').css({
				background: 'url(' + bg + ')',
				backgroundSize: 'auto 700px'
			});
			
			var isOn = false;
			$('#concert').click(function() {
				if (isOn === false) {
					$IMG({
						src: '<c:url value="/img/concert/cats.jpg" />',
						style : {
							borderRadius : '0 0 5px 5px'
						}
					}).appendTo('#concert');
					isOn = true;
				} else {
					$('#concert img').remove();
					isOn = false;
				}
			});
			
		});
		
		function toogle(el, img1, img2) {
			if (el.src.indexOf(img1) === -1) {
				el.src = img1;
			} else {
				el.src = img2;
			}
		}
		</script>
		
	</head>
	
	<body>
		
		<div id="wrapper">
		
			<h1><a href="#">${command.title}</a></h1>
		
			<div id="concert-wrapper">
				<div id="concert">
					<!-- ?autoplay=1 -->
					<iframe width="480" height="360" src="http://www.youtube.com/embed/JFPcMlNml0s" frameborder="0" allowfullscreen></iframe>
				</div>
			</div>
			
			<div id="info-wrapper">
				<div id="info">
					${command.title}
				</div>
			</div>
			
			<div id="chat-wrapper">
				<div id="chat">
					<ul id="messages">
					</ul>
					<form>
						<input id="message">
						<input type="submit">
					</form>
				</div>
			</div>
			
			<div id="stage-wrapper">
				<div id="stage">
					<img src="<c:url value="/img/concert/profile1.jpg" />">
					<img src="<c:url value="/img/concert/profile2.jpg" />">
					<img src="<c:url value="/img/concert/profile3.jpg" />">
					<img src="<c:url value="/img/concert/profile4.jpg" />">
					<img src="<c:url value="/img/concert/profile5.jpg" />">
					<img src="<c:url value="/img/concert/profile6.jpg" />">
					<img src="<c:url value="/img/concert/profile7.jpg" />">
					<img src="<c:url value="/img/concert/profile8.jpg" />">
				</div>
			</div>
		</div>
		<div id="footer-wrapper">
			<div id="footer">
				&copy; IndiCrowd
			</div>
		</div>
		
	</body>
</html>
