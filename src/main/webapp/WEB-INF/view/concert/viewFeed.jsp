<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>${command.title} 공연 피드백 모아보기</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<style>
		.marquee {
		}
		#footer-wrapper {
			position: absolute;
			right: 15px;
			bottom: 10px;
		}
		</style>
		
		<script src="<c:url value="/js/jquery.marquee.js" />"></script>
		
		<script>
		
		var isSmall = false;
		
		$(function() {
			
			RTW.join('Concert', '${command.id}');
			
			RTW.addHandler('Concert', '${command.id}', 'newMessage', function(message) {
				var $m = $DIV({
					style: {
						fontSize: isSmall ? 20 : 60,
						height: isSmall ? 20 : 60,
					},
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
				$AUDIO(
					{
						id: 'audio_' + randomId,
						src: '<spring:eval expression="@userfileConfig.baseUrl" />/itemsound/' + iconFeed.item.id + '',
						autoplay: 'autoplay', 
						onerror: '$(this).remove();', 
						onended: '$(this).remove();'
					}
				).appendTo('body');
				
				if (iconFeed.item.isRepeat === true) {
				
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
								background: 'url(<spring:eval expression="@userfileConfig.baseUrl" />/itemimage/' + iconFeed.item.id + ')',
								width: 150,
								height: 150
							}
						}).sprite({fps: 12, no_of_frames: iconFeed.item.frameCount/*, rewind: iconFeed.item.isRewind*/}),
						$DIV(
							{
								style: {
									marginTop: isSmall ? -30 : 10,
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
				
				else {
					
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
								background: 'url(<spring:eval expression="@userfileConfig.baseUrl" />/itemimage/' + iconFeed.item.id + ')',
								width: 150,
								height: 150
							}
						}).sprite({fps: 12, no_of_frames: iconFeed.item.frameCount, on_last_frame: function(obj) {
				            obj.destroy();
				            $div.fadeOut(function() {
								$div.remove();
							});
				        }}),
						$DIV(
							{
								style: {
									marginTop: isSmall ? -30 : 10,
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
		
		function changesmall() {
			isSmall = true;
		}
		
		</script>
	</head>
	
	<body>
		'<b>${command.title}</b>' 공연의 채팅이나 피드백을 한번에 보여줍니다.
		<div id="footer-wrapper">
			<div id="footer">
				&copy; IndiCrowd
			</div>
		</div>
	</body>
</html>
