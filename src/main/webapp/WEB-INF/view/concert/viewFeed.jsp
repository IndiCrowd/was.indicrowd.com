<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>공연 피드백 모아보기</title>
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
			
			RTW.addHandler('Concert', '${command.id}', 'iconFeed', function(iconFeed) {

				var $ani;
				var randomId = "x" + randomString(8);
				
				if (iconFeed.iconName === 'yj_hands') {
				
					var $div = $DIV(
						{ style: {
							position: 'absolute',
							top: Math.floor(Math.random() * ($(window).height() - 150)),
							left: Math.floor(Math.random() * ($(window).width() - 170)),
							zIndex: 100000
						} },
						$ani = $DIV({
							id : randomId,
							style: {
								background: 'url(${pageContext.request.contextPath}/img/' + iconFeed.iconName + '.png)',
								width: 150,
								height: 150
							}
						}).sprite({fps: 12, no_of_frames: 3, rewind: true}),
						$DIV(
							{
								style: {
									marginTop: 10,
									textAlign: 'center'
								}
							},
							$SPAN({style:{
								fontSize: 14,
								textAlign: 'center',
								color: '#fff',
								background: '#000',
								padding: '3px 7px',
								borderRadius: 5
							}},iconFeed.sender.nickname)
						)
					).appendTo('body');
					
					setTimeout(function() {
						$div.fadeOut(function() {
							$ani.destroy();
							$div.remove();
						});
					}, 2000);
					
				}
				
				else if (iconFeed.iconName === 'balloons') {
					
					var $div = $DIV(
						{ style: {
							position: 'absolute',
							top: Math.floor(Math.random() * ($(window).height() - 150)),
							left: Math.floor(Math.random() * ($(window).width() - 170)),
							zIndex: 100000
						} },
						$ani = $DIV({
							id : randomId,
							style: {
								background: 'url(${pageContext.request.contextPath}/img/' + iconFeed.iconName + '.png)',
								width: 150,
								height: 150
							}
						}).sprite({fps: 12, no_of_frames: 6, on_last_frame: function(obj) {
				            obj.destroy();
				            $div.fadeOut(function() {
								$div.remove();
							});
				        }}),
						$DIV(
							{
								style: {
									marginTop: 10,
									textAlign: 'center'
								}
							},
							$SPAN({style:{
								fontSize: 14,
								textAlign: 'center',
								color: '#fff',
								background: '#000',
								padding: '3px 7px',
								borderRadius: 5
							}},iconFeed.sender.nickname)
						)
					).appendTo('body');
					
					$div.hide();
					$div.fadeIn();
				
				}
				
			});
 
		});
		
		</script>
	</head>
	
	<body>
	</body>
</html>
