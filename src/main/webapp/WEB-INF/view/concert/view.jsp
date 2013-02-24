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
			
			/*
			 *  François 'cahnory' Germain
			 */
			.ui-tooltip, .ui-tooltip-top, .ui-tooltip-right, .ui-tooltip-bottom, .ui-tooltip-left {
			  color:#ffffff;
			  cursor:normal;
			  display:-moz-inline-stack;
			  display:inline-block;
			  font-size:12px;
			  font-family:arial;
			  padding:.5em 1em;
			  position:relative;
			  text-align:center;
			  text-shadow:0 -1px 1px #111111;
			  -webkit-border-top-left-radius:4px ;
			  -webkit-border-top-right-radius:4px ;
			  -webkit-border-bottom-right-radius:4px ;
			  -webkit-border-bottom-left-radius:4px ;
			  -khtml-border-top-left-radius:4px ;
			  -khtml-border-top-right-radius:4px ;
			  -khtml-border-bottom-right-radius:4px ;
			  -khtml-border-bottom-left-radius:4px ;
			  -moz-border-radius-topleft:4px ;
			  -moz-border-radius-topright:4px ;
			  -moz-border-radius-bottomright:4px ;
			  -moz-border-radius-bottomleft:4px ;
			  border-top-left-radius:4px ;
			  border-top-right-radius:4px ;
			  border-bottom-right-radius:4px ;
			  border-bottom-left-radius:4px ;
			  -o-box-shadow:0 1px 2px #000000, inset 0 0 0 1px #222222, inset 0 2px #666666, inset 0 -2px 2px #444444;
			  -moz-box-shadow:0 1px 2px #000000, inset 0 0 0 1px #222222, inset 0 2px #666666, inset 0 -2px 2px #444444;
			  -khtml-box-shadow:0 1px 2px #000000, inset 0 0 0 1px #222222, inset 0 2px #666666, inset 0 -2px 2px #444444;
			  -webkit-box-shadow:0 1px 2px #000000, inset 0 0 0 1px #222222, inset 0 2px #666666, inset 0 -2px 2px #444444;
			  box-shadow:0 1px 2px #000000, inset 0 0 0 1px #222222, inset 0 2px #666666, inset 0 -2px 2px #444444;
			  background-color:#3b3b3b;
			  background-image:-moz-linear-gradient(top,#555555,#222222);
			  background-image:-webkit-gradient(linear,left top,left bottom,color-stop(0,#555555),color-stop(1,#222222));
			  filter:progid:DXImageTransform.Microsoft.gradient(startColorStr=#555555,EndColorStr=#222222);
			  -ms-filter:progid:DXImageTransform.Microsoft.gradient(startColorStr=#555555,EndColorStr=#222222);
			}
			.ui-tooltip:after, .ui-tooltip-top:after, .ui-tooltip-right:after, .ui-tooltip-bottom:after, .ui-tooltip-left:after {
			  content:"\25B8";
			  display:block;
			  font-size:2em;
			  height:0;
			  line-height:0;
			  position:absolute;
			}
			.ui-tooltip:after, .ui-tooltip-bottom:after {
			  color:#2a2a2a;
			  bottom:0;
			  left:1px;
			  text-align:center;
			  text-shadow:1px 0 2px #000000;
			  -o-transform:rotate(90deg);
			  -moz-transform:rotate(90deg);
			  -khtml-transform:rotate(90deg);
			  -webkit-transform:rotate(90deg);
			  width:100%;
			}
			.ui-tooltip-top:after {
			  bottom:auto;
			  color:#4f4f4f;
			  left:-2px;
			  top:0;
			  text-align:center;
			  text-shadow:none;
			  -o-transform:rotate(-90deg);
			  -moz-transform:rotate(-90deg);
			  -khtml-transform:rotate(-90deg);
			  -webkit-transform:rotate(-90deg);
			  width:100%;
			}
			.ui-tooltip-right:after {
			  color:#222222;
			  right:-0.375em;
			  top:50%;
			  margin-top:-.05em;
			  text-shadow:0 1px 2px #000000;
			  -o-transform:rotate(0);
			  -moz-transform:rotate(0);
			  -khtml-transform:rotate(0);
			  -webkit-transform:rotate(0);
			}
			.ui-tooltip-left:after {
			  color:#222222;
			  left:-0.375em;
			  top:50%;
			  margin-top:.1em;
			  text-shadow:0 -1px 2px #000000;
			  -o-transform:rotate(180deg);
			  -moz-transform:rotate(180deg);
			  -khtml-transform:rotate(180deg);
			  -webkit-transform:rotate(180deg);
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
			#info p {
				padding: 3px;
			}
			#info label {
				padding-right: 10px;
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
			
			for (var i = 1 ; i <= 8 ; i++) {
				var $img = $IMG({
					src: '<c:url value="/img/concert/" />profile' + i + '.jpg'
				}).appendTo('#stage');
				
				$img.mouseover(function() {
					var $span = $SPAN({
						cls : 'ui-tooltip',
						style : {
							position : 'absolute',
							top : $(this).offset().top,
							left : $(this).offset().left
						}
					}, 'TEST!!').appendTo('body');
					$span.css({
						display : 'none',
						left : '-=' + (($span.outerWidth() - $img.outerWidth()) / 2) + 'px',
						top : '-=' + $span.outerHeight() + 'px'
					});
					$span.fadeIn(100);
					setTimeout(function() {
						$span.fadeOut(function() {
							$(this).remove();
						});
					}, 2000);
				});
			}
			
			var addImg = function(connectId, userInfo) {
				if ($('#user-' + userInfo.id).size() === 0) { 
					$IMG({
						id : 'connect-' + connectId,
						cls : 'user-' + userInfo.id,
						src: '<c:url value="/img/concert/" />profile4.jpg'
					}).appendTo('#stage').hide().fadeIn();
				}
			};

			RealtimeWebClient.addConnectHandler('Concert', '${command.id}', function(userInfos) {
				for (var connectId in userInfos) {
					addImg(connectId, userInfos[connectId]);
				}
			});
			
			RealtimeWebClient.join('Concert', '${command.id}', function(data) {
				addImg(data.connectId, data.userInfo);
			}, function(data) {
				$('#connect-' + data.connectId).remove();
			});
			
			RealtimeWebClient.addHandler('Concert', '${command.id}', 'newMessage', function(message) {
				$('#messages').append($LI($SPAN({
					style : {
						fontWeight: 'bold'
					}
				}, message.sender.nickname), ': ' + message.content));
				
				$('.user-' + message.sender.id).each(function() {
					var $img = $(this);
					var $span = $SPAN({
						cls : 'ui-tooltip',
						style : {
							position : 'absolute',
							top : $img.offset().top,
							left : $img.offset().left
						}
					}, message.content).appendTo('body');
					$span.css({
						display : 'none',
						left : '-=' + (($span.outerWidth() - $img.outerWidth()) / 2) + 'px',
						top : '-=' + $span.outerHeight() + 'px'
					});
					$span.fadeIn(100);
					setTimeout(function() {
						$span.fadeOut(function() {
							$(this).remove();
						});
					}, 2000);
				});
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
					<iframe width="480" height="360" src="http://www.youtube.com/embed/JFPcMlNml0s?autoplay=1" frameborder="0" allowfullscreen></iframe>
				</div>
			</div>
			
			<div id="info-wrapper">
				<div id="info">
					<p>
						<label>공연 이름</label> ${command.title}
					</p>
					<p>
						<label>시작 시간</label> 12:20
					</p>
					<p>
						<label>종료 시간</label> 14:20
					</p>
					<p>
						<label>밴드 정보</label> test
					</p>
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
