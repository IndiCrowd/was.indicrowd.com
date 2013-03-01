<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>TEST</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		
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

			RTW.addConnectHandler('Concert', '${command.id}', function(userInfos) {
				for (var connectId in userInfos) {
					addImg(connectId, userInfos[connectId]);
				}
			});
			
			RTW.join('Concert', '${command.id}', function(data) {
				addImg(data.connectId, data.userInfo);
			}, function(data) {
				$('#connect-' + data.connectId).remove();
			});
			
			RTW.addHandler('Concert', '${command.id}', 'newMessage', function(message) {
				$('#messages').append($LI({cls: 'message'}, $SPAN({
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

			var openStreamSubscriber = function ()
			{
				// open the flash StreamPublisher
		        var flashvars = {};
		        flashvars.serverSubscribeStr = '${command.id}';
		        flashvars.clientPublishStr = '${userId}';
		        // TODO: Change url that is client default image.
				flashvars.clientDefaultImage = '<c:url value="/img/concert/" />profile1.jpg';
		        
		        var params = {};
		        params.quality = 'high';
	            params.bgcolor = 'transparent';
		        params.allowscriptaccess = 'sameDomain';
		        params.allowfullscreen = 'true';
		        
		        var attributes = {};
		        attributes.id = 'StreamSubscriber';
		        attributes.name = 'StreamSubscriber';
		        attributes.align = 'middle';
		        
		        swfobject.embedSWF(
		            '<c:url value="/swf/StreamSubscriber.swf" />', 'StreamSubscriber', 
		            '480', '360', 
		            swfVersionStr, xiSwfUrlStr, 
		            flashvars, params, attributes);
		        
		        return $('#StreamSubscriber');
			};
			
			openStreamSubscriber();
 
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
					<div id="StreamSubscriber">
					</div>
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
					<div id="messages-wrapper">
						<ul id="messages">
						</ul>
					</div>
					<div id="form-wrapper">
						<form>
							<input id="message">
							<input type="submit">
						</form>
					</div>
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
