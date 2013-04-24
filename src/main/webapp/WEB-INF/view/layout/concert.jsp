<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<sec:authentication property="principal" var="principal" />

<!DOCTYPE html>

<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
		<!--[if lt IE 8]>
		<script src="http://ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js"></script>
		<script type="text/javascript">window.attachEvent('onload',function(){CFInstall.check({mode:'overlay'})})</script>
		<![endif]-->
		<title>IndiCrowd :: <decorator:title /></title>
		
		<style>
			@import url(<c:url value="/css/init.css" />);
		</style>
		
		<script src="<c:url value="/js/jquery-1.9.1.min.js" />"></script>
		<jsp:include page="../script-import.jsp" />
		
        <script type="text/javascript" src="<c:url value="/js/swfobject.js" />" ></script>
		<script type="text/javascript">
            // For version detection, set to min. required Flash Player version, or 0 (or 0.0.0), for no version detection. 
            var swfVersionStr = '11.1.0';
            // To use express install, set to playerProductInstall.swf, otherwise the empty string. 
            var xiSwfUrlStr = '<c:url value="/swf/playerProductInstall.swf" />';
        </script>
		
		
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
				z-index: 50;
			}
			#concert {
				padding: 20px;
				line-height: 0;
			}
			#userface-wrapper {
				background: rgba(0, 0, 0, .5);
				border-radius: 5px;
				position: absolute;
				width: 320px;
				height: 190px;
				left: 620px;
				top: 90px;
			}
			
			#userface-opti {
				padding: 20px;
			}
			
			#userface {
				color: #fff;
			}
			#info-wrapper {
				background: rgba(0, 0, 0, .5);
				border-radius: 5px;
				position: absolute;
				width: 520px;
				height:20px;
				left: 60px;
				top: 500px;
				z-index: 100;
			}
			#info {
				padding-top: 3px;
				padding-left: 20px;
				backgroud: #000;
				color: #fff;
			}
			#info label {
				padding-left: 30px;
				padding-right: 10px;
			}
			#chat-wrapper {
				background: rgba(0, 0, 0, .5);
				border-radius: 5px;
				position: absolute;
				width: 320px;
				height: 418px;
				left: 620px;
				top: 295px;
			}
			#chat {
				padding: 20px;
			}
			
			#messages-wrapper {
				color: #fff;
				height: 345px;
				overflow-y: scroll;
				margin-bottom: 10px;
			}
			#messages {
			}
			.message {
				margin-bottom: 5px;
			}
			#form-wrapper {
			}
			
			#stage-wrapper {
				background: rgba(0, 0, 0, .5);
				border-radius: 5px;
				position: absolute;
				width: 520px;
				left: 60px;
				top: 530px;
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
			var userImgs = {};
			var addImg = function(connectId, userInfo) {
				console.log(userImgs[userInfo.id]);
				if (userImgs[userInfo.id] === undefined) {
					userImgs[userInfo.id] = 1;
					
					$IMG({
						//id : 'connect-' + connectId,
						id : 'user-' + userInfo.id,
						style : {
							width: 50,
							height: 50
						},
						src: userInfo.socialImageUrl ? userInfo.socialImageUrl : '<spring:eval expression="@userfileConfig.baseUrl" />/profilephoto/' + userInfo.id
					}).appendTo('#stage').hide().fadeIn();
					
				} else {
					userImgs[userInfo.id]++;
				}
			};
			
			$('#chat form').submit(function() {
				POST('${pageContext.request.contextPath}/concert/chat', {
					concertId: '${command.id}'
					, content: $('#message').val()
				}, function(data) {
					console.log(data);
				});
				$('#message').val('');
				return false;
			});
			
			var bg = '<c:if test="${!command.hasBG}"><c:url value="/img/concert/concertbg.jpg" /></c:if><c:if test="${command.hasBG}"><spring:eval expression="@userfileConfig.baseUrl" />/concertbg/${command.id}</c:if>';
			
			$('#wrapper').css({
				background: 'url(' + bg + ')',
				//background: 'white',
				backgroundSize: 'auto 700px'
			});
			

			RTW.addConnectHandler('Concert', '${command.id}', function(userInfos) {
				for (var connectId in userInfos) {
					addImg(connectId, userInfos[connectId]);
				}
			});
			
			RTW.join('Concert', '${command.id}', function(data) {
				addImg(data.connectId, data.userInfo);
			}, function(data) {
				userImgs[data.userInfo.id]--;
				if (userImgs[data.userInfo.id] === 0) {
					delete userImgs[data.userInfo.id];
					$('#user-' + data.userInfo.id).remove();
				}
			});
			
			var addMessage = function(message) {
				if ($('#messages').find('.message').size() > 100) {
					// 100개가 넘으면 맨 위에 것을 지워줌
					$('#messages').find('.message:first').remove();
				}
				
				var t = $('#messages-wrapper').scrollTop();
				$('#messages-wrapper').scrollTop(100000000000);
				var t2 = $('#messages-wrapper').scrollTop();
				
				$('#messages').append($LI({cls: 'message'}, $SPAN({
					style : {
						fontWeight: 'bold'
					}
				}, message.sender.nickname), ': ' + message.content));
				
				// 스크롤이 맨 아래일때만 자동으로 아래로 내려줌, 아닐경우 스크롤 유지.
				if (t < t2) {
					$('#messages-wrapper').scrollTop(t);
				} else {
					$('#messages-wrapper').scrollTop(100000000000);
				}
				
			};
			
			GET('<c:url value="/concert/${command.id}/chat/cachedList" />', function(command) {
				for (var i in command.list) {
					addMessage(command.list[i]);
				}
				$('#messages-wrapper').scrollTop(100000000000);
			});
			
			RTW.addHandler('Concert', '${command.id}', 'newMessage', function(message) {
				addMessage(message);
				
				$('#user-' + message.sender.id).each(function() {
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
			
			RTW.addHandler('Concert', '${command.id}', 'iconFeed', function(iconFeed) {
				
				var randomId = "x" + randomString(8);
				
				if (iconFeed.item.isRepeat === true) {

					var $div = $DIV({
						id : randomId,
						style: {
							background: 'url(<spring:eval expression="@userfileConfig.baseUrl" />/itemimage/' + iconFeed.item.id + ')',
							width: 150,
							height: 150,
							position: 'absolute',
							top: 100,
							right: 100,
							zIndex: 100000
						}
					}).sprite({fps: 12, no_of_frames: iconFeed.item.frameCount, rewind: iconFeed.item.isRewind}).appendTo('body');
					
					setTimeout(function() {
						$div.fadeOut(function() {
							$div.destroy();
							$div.remove();
						});
					}, 2000);
				
				}
				
				else {

					var $div = $DIV({
						id : randomId,
						style: {
							background: 'url(<spring:eval expression="@userfileConfig.baseUrl" />/itemimage/' + iconFeed.item.id + ')',
							width: 150,
							height: 150,
							position: 'absolute',
							top: 100,
							right: 100,
							zIndex: 100000
						}
					}).sprite({fps: 12, no_of_frames: iconFeed.item.frameCount, on_last_frame: function(obj) {
			            obj.destroy();
			            $div.fadeOut(function() {
							$div.remove();
						});
			        }}).appendTo('body');
					
					$div.hide();
					$div.fadeIn();
				
				}
			});
			
			RTW.addHandler('Concert', '${command.id}', 'changebg', function(b) {
				
				var bg = '<spring:eval expression="@userfileConfig.baseUrl" />/concertbg/${command.id}';
				
				$('#wrapper').fadeOut(1000, function() {

					$('#wrapper').css({
						background: 'url(' + bg + ')',
						//background: 'white',
						backgroundSize: 'auto 700px'
					});
					
					setTimeout(function() {
						$('#wrapper').fadeIn(1000);
					}, 1000);
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
		
		
		<script>
		function useItem(itemId)
		{
			POST('<c:url value="/concert/${command.id}/iconFeed.json" />', {
				itemId: itemId
			});	
		};
		
		function changeBG(e) {
			$('#changeBGForm').show();
			$('#changeBGForm').css({
				position: 'absolute',
				left: e.pageX,
				top: e.pageY
			});
		}
		
		$(function() {
			$('#changeBGForm').submit(function() {
				$('#changeBGForm').hide();
			});
		});
		</script>
		
		<decorator:head />
		
	</head>
	
	<body>
	
		<div id="wrapper">
		
			<h1><a href="#">${command.title}</a></h1>
		
			<div id="concert-wrapper">
				<div id="concert">
					<decorator:body />				
				</div>
			</div>
			
			
			<div id="info-wrapper">
				<div id="info">
					<span>
						<label>공연 이름</label> ${command.title}
					</span>
					<span>
						<label>시작 시간</label> 12:20
					</span>
					<span>
						<label>종료 시간</label> 14:20
					</span>
					<span>
						<label>밴드 정보</label> test
					</span>
					<span>
						<a href="javascript:;" onclick="changeBG(event);">배경 바꾸기</a>
					</span>
				</div>
			</div>
			
			<div id="userface-wrapper">
				<div id="userface-opti">
					<img id="userface" src="${principal.socialImageUrl}" />
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
		<form id="changeBGForm" action="<c:url value="/concert/${command.id}/changeBG" />" style="display:none;background:#fff;" method="POST" enctype="multipart/form-data" target="changeBGFrame">
			<input type="file" name="bg">
			<button type="submit">배경 변경</button>
		</form>
		<iframe name="changeBGFrame" style="display:none;"></iframe>
	</body>
	
</html>
