<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
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
		
		<script src="<c:url value="/js/jquery-1.8.2.min.js" />"></script>
		<jsp:include page="../script-import.jsp" />
		
        <script type="text/javascript" src="<c:url value="/js/swfobject.js" />" ></script>
		<script type="text/javascript">
            // For version detection, set to min. required Flash Player version, or 0 (or 0.0.0), for no version detection. 
            var swfVersionStr = '11.1.0';
            // To use express install, set to playerProductInstall.swf, otherwise the empty string. 
            var xiSwfUrlStr = '<c:url value="/swf/playerProductInstall.swf" />';
        </script>
        
        <!--[if lte IE 9]>
		<script>
		$(function() {
			$('#using-chrome').show();
		});
		</script>
		<![endif]-->
		
		
		<link href='http://fonts.googleapis.com/css?family=Raleway:100' rel='stylesheet'>
		
		<style>
			html, body {
				background: #333;
				margin: 0;
				padding: 0;
			}
			#background {
				width: 100%;
				height: 700px;
				position:absolute;
				top:0;
			}
			#wrapper {
				width: 100%;
				height: 700px;
				position:absolute;
				top:0;
			}
			
			h1 { 
				font-size: 22px;
			  text-align: center;
			  text-transform: uppercase;
			  padding: 1px;
			  font-family: 'Raleway';
			  position: relative;
			  background: #333;
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
				background: #333;
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
				height: 360px;
				width: 480px;
			}
			#userface-wrapper {
				background: #333;
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
			
			#smartphone-wrapper {
				display: none;
			}
			
			#info-wrapper {
				background: #333;
				background: rgba(0, 0, 0, .5);
				border-radius: 5px;
				position: absolute;
				width: 520px;
				height:20px;
				left: 60px;
				top: 500px;
				z-index: 100;
				padding-left: 5px;
			}
			#info {
				padding-top: 3px;
				backgroud: #000;
				color: #fff;
			}
			#info span {
				padding-right: 10px;
			}
			#info label {
				padding-right: 5px;
				font-weight: bold;
			}
			#info a {
				color: #fff;
			}
			
			#function-wrapper {
				background: #333;
				background: rgba(0, 0, 0, .5);
				border-radius: 5px;
				position: absolute;
				width: 320px;
				height: 50px;
				left: 620px;
				top: 295px;
			}
			#function {
				padding-left: 10px;
				padding-top: 18px;
			}
			#function a {
				border: 3px solid #999;
				background: orange;
				color:#fff;
				font-weight:bold;
				border-radius: 5px;
				padding: 5px 10px;
				text-decoration: none;
			}
			
			#chat-wrapper {
				background: #333;
				background: rgba(0, 0, 0, .5);
				border-radius: 5px;
				position: absolute;
				width: 320px;
				height: 310px;
				left: 620px;
				top: 360px;
			}
			#chat {
				padding: 20px;
			}
			
			#messages-wrapper {
				color: #fff;
				height: 231px;
				overflow-y: scroll;
				margin-bottom: 10px;
			}
			#messages {
				list-style: none;
				margin: 0;
				padding: 0;
			}
			.message {
				margin-bottom: 5px;
			}
			#form-wrapper {
			}
			
			#stage-wrapper {
				background: #333;
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
				background: #fff;
				background: rgba(255, 255, 255, .5);
				padding: 5px;
				margin: 4px;
				float: left;
			}
			#stage div {
				background: #fff;
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
			#changeBGForm {
				display:none;
				background:#fff;
				padding: 10px;
				z-index: 10000;
				background: rgba(255, 255, 255, .8);
				border-radius: 10px;
			}
			#changeBGForm input{
				border: 3px solid #999; border-radius: 5px; padding: 5px;
				background: #fff;
			}
			#changeBGForm button{
				float: right;
				border: 3px solid #999; background: orange; color:#fff; font-weight:bold; border-radius: 5px; padding: 5px; width: 100px;
				margin-right: 5px;
			}
			
			@media (max-width: 900px)
			{
				html, body {
					height: 500px;
				}
				#wrapper {
					background: rgba(0, 0, 0, .5);
					height: 500px;
				}
				#background {
					width: 100%;
					height: 500px;
				}
				
				h1 {
					font-size: 12px;
					background: none;
				}
				
				#concert-wrapper {
					left: 0;
					top: 70px;
					width: 100%;
					height: 200px;
					background: none;
				}
				
				#concert {
					padding: 0;
					width: 100%;
					height: 200px;
				}
				
				#info-wrapper, #userface-wrapper, #function-wrapper, #footer-wrapper {
					display: none;
				}
				
				#stage-wrapper {
					left: 0;
					top: 295px;
					width: 100%;
					background: none;
				}
				
				#stage {
					padding:0;
					overflow: hidden;
				}
				
				#chat-wrapper {
					left: 0;
					top: 368px;
					width: 100%;
					height: 120px;
					background: none;
				}
				
				#chat {
					padding:0;
				}
				
				
				#messages-wrapper {
					height: 70px;
				}
				
				#smartphone-wrapper {
					position: absolute;
					left: 5px;
					top: 275px;
					color: #fff;
					display: block;
				}
			}
		</style>
		
		<script>
		function removeArrElement(arr,idx){
			return (idx<0 || idx>arr.length) ? arr : arr.slice(0, idx).concat(arr.slice(idx+1, arr.length));
		}
		var userImgs = {};
		var userQueue = [];
		var queueSize = 2;
		var key = Math.random();
		var addMessage = function(message,key) {
			addUserIntoQueue(message.sender.id);
			if ($('#messages').find('.message').size() > 100) {
				// 100개가 넘으면 맨 위에 것을 지워줌
				$('#messages').find('.message:first').remove();
			}
			
			var t = $('#messages-wrapper').scrollTop();
			$('#messages-wrapper').scrollTop(100000000000);
			var t2 = $('#messages-wrapper').scrollTop();
			
			var $img;
			if(key == null) key = 0;
			$('#messages').append($DIV({cls:'message'+key},$LI({cls: 'message'}, 
				$img = $IMG({style: {flt:'left', width:20, height:20, marginRight: 5}, src: message.sender.socialImageUrl ? message.sender.socialImageUrl : '<spring:eval expression="@userfileConfig.baseUrl" />/profilephoto/' + message.sender.id + '?' + key}),
				$DIV({
					style : {
						flt:'left',
						wordBreak: 'break-all',
						width: 220
					}
				}, $SPAN({style: {fontWeight: 'bold', color:'orange'}}, message.sender.nickname), $BR(), message.content), 
				$DIV({style:{clear:'both'}})))
			);
			
			// 스크롤이 맨 아래일때만 자동으로 아래로 내려줌, 아닐경우 스크롤 유지.
			if (t < t2) {
				$('#messages-wrapper').scrollTop(t);
			} else {
				$('#messages-wrapper').scrollTop(100000000000);
			}
			
			$img.load(function() {
				$('#messages-wrapper').scrollTop(100000000000);
			});
			
			
			
			
		};
		$(window).click(function() {
			$('.userImgMenu').fadeOut(function() {
				$(this).remove();
			});
		});
		function getUserImgsListCount(){
			var count = 0;
			for ( property in userImgs ) count++;
			return count;
		}
		function removeUserFromAudience(userId){
			console.log('removeUserFromAudience'+userId);
			//var shiftedUser = userQueue.shift();
			console.log('beforeLength:'+userQueue.length);
			var removeIndex= -1;
			for(var i=0; i<userQueue.length;i++){
				if(userQueue[i] == userId) {
					removeIndex = i;
					console.log('remove '+i+"!!!!")
				}
			}
			
			if(removeIndex > -1){
				userQueue=removeArrElement(userQueue,removeIndex);

				console.log('afterLength:'+userQueue.length);
				return true;
			}else{
				$('#user-' + userId).fadeOut();
				return false;
			}
			
		}
		function shiftUserFromAudience(){
			var shiftedUser = userQueue.shift();
			console.log('shiftedUser:'+shiftedUser);
			$('#user-' + shiftedUser).fadeOut();
		}
		function addUserIntoAudience(userId){
			console.log('addUserIntoAudience:'+userId)
			$('#user-' + userId).fadeIn();
			userQueue.push(userId);
			
			
		}
		function addUserIntoQueue(userId){
			if(userImgs[userId] != undefined){
				console.log(userQueue.length+','+queueSize)
				if(userQueue.length == queueSize){
					if(removeUserFromAudience(userId)==false){
						shiftUserFromAudience();
					}
					addUserIntoAudience(userId);
				}else if(userQueue.length > queueSize){
					console.log("Exception!!!!");
				}else{
					addUserIntoAudience(userId);
				}
			}
			
		}
		function addUserWhenQueueIsNotFull(userId){
			console.log(userQueue.length+',,'+queueSize);
			if(userQueue.length < queueSize){
				addUserIntoAudience(userId);
			}
		}
		
		var addImg = function(connectId, userInfo) {
			
			if (userImgs[userInfo.id] === undefined) {
				
				
				var $img = $IMG({
					//id : 'connect-' + connectId,
					id : 'user-' + userInfo.id,
					style : {
						width: 50,
						height: 50,
						display: 'none'
					},
					src: userInfo.socialImageUrl ? userInfo.socialImageUrl : '<spring:eval expression="@userfileConfig.baseUrl" />/profilephoto/' + userInfo.id + '?' + key
				}).appendTo('#stage');
				
				addUserWhenQueueIsNotFull(userInfo.id);
				userImgs[userInfo.id] = 1;
				$img.click(function(e) {
					$('.userImgMenu').fadeOut(function() {
						$(this).remove();
					});
					var $ul = $UL({
						cls: 'userImgMenu',
						style: {
							position:'absolute',
							top: e.pageY,
							left: e.pageX,
							background: '#fff',
							listStyle : 'none',
							padding: 0,
							margin: 0,
							textAlign: 'center'
						}
					},
					$LI({
						style: {
							border: '1px solid #000',
							listStyle : 'none',
							padding: '5px 10px',
							margin: 0
						}
					}, $A({style: {color:'#000', textDecoration: 'none'}, href:'${pageContext.request.contextPath}/user/' + userInfo.id, target:'_blank'},'유저 정보 보기')),
					userInfo.socialImageUrl ? $LI({
						style: {
							border: '1px solid #000',
							listStyle : 'none',
							padding: '5px 10px',
							margin: 0,
							marginTop: -1
						}
					}, $A({style: {color:'#000', textDecoration: 'none'}, href:userInfo.socialProfileUrl, target:'_blank'}, userInfo.socialProviderId)) : ''
					).appendTo('body').hide().fadeIn();
					
					setTimeout(function() {
						$ul.fadeOut(function() {
							$ul.remove();
						});
					}, 5000);
					
					e.stopPropagation();
				});
				
			} else {
				userImgs[userInfo.id]++;
			}
			
		};
		var removeImg = function (userInfo){
			removeUserFromAudience(userInfo.id);
			console.log('removeImg:'+userInfo.id);
			userImgs[userInfo.id]--;
			if (userImgs[userInfo.id] === 0) {
				
				delete userImgs[userInfo.id];
				$('#user-' + userInfo.id).remove();
			}
			
		}
		var iconFeedFunction = function(iconFeed) {
			addUserIntoQueue(iconFeed.sender.id);
			var randomId = "x" + randomString(8);
			
			var top = $('#user-' + iconFeed.sender.id).offset().top + $('#user-' + iconFeed.sender.id).height() - 140;
			var left = $('#user-' + iconFeed.sender.id).offset().left;
			
			if (iconFeed.item.isRepeat === true) {

				var $div = $DIV({
					id : randomId,
					style: {
						background: 'url(<spring:eval expression="@userfileConfig.baseUrl" />/itemimage/' + iconFeed.item.id + ')',
						width: 150,
						height: 150,
						position: 'absolute',
						top: top,
						left: left,
						zIndex: 100000
					}
				});
				
				if($div!=null){
					$div.sprite({fps: 12, no_of_frames: iconFeed.item.frameCount/*, rewind: iconFeed.item.isRewind*/}).appendTo('body');
				}
				
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
						top: top,
						left: left,
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
			
		};
		function displayMessageOnUser(message){
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
		}
		$(function() {
			
			
			
			$('#chat form').submit(function() {
				POST('${pageContext.request.contextPath}/concert/chat', {
					concertId: '${command.id}'
					, content: $('#message').val()
					, type: ''
				}, function(data) {
					console.log(data);
				});
				$('#message').val('');
				return false;
			});
			
			var bg = '<c:if test="${!command.hasBg}"><c:url value="/img/istock/bg1.jpg" /></c:if><c:if test="${command.hasBg}"><spring:eval expression="@userfileConfig.baseUrl" />/concertbg/${command.id}</c:if>';
			
			$('#background').css({
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
				removeImg(data.userInfo);
			});
			
			
			
			GET('<c:url value="/concert/${command.id}/chat/cachedList" />', function(command) {
				for (var i in command.list) {
					addMessage(command.list[i]);
				}
				$('#messages-wrapper').scrollTop(100000000000);
			});
			
			RTW.addHandler('Concert', '${command.id}', 'newMessage', function(message) {
				addMessage(message);
				
				displayMessageOnUser(message);
			});
			
			RTW.addHandler('Concert', '${command.id}', 'iconFeed', iconFeedFunction);
			
			RTW.addHandler('Concert', '${command.id}', 'changebg', function(b) {
				
				var bg = '<spring:eval expression="@userfileConfig.baseUrl" />/concertbg/${command.id}?' + Math.random();
				
				$('#background').fadeOut(1000, function() {

					$('#background').css({
						background: 'url(' + bg + ')',
						//background: 'white',
						backgroundSize: 'auto 700px'
					});
					
					setTimeout(function() {
						$('#background').fadeIn(1000);
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

		function useItem(itemId)
		{
			POST('<c:url value="/concert/${command.id}/iconFeed.json" />', {
				itemId: itemId
			});	
		};
		
		$(document).ready(function() {
			
			$(this).gShake(function() {
				useItem(1);
			});
			
		});
		
		function changeBG(e) {
			$('#changeBGForm').show();
			$('#changeBGForm').css({
				position: 'absolute',
				left: e.pageX,
				top: e.pageY
			});
			e.stopPropagation();
		}
		
		$(function() {
			$('#changeBGForm').submit(function() {
				$('#changeBGForm').hide();
			});
			$('#changeBGForm').click(function(e) {
				e.stopPropagation();
			});
			$(window).click(function() {
				$('#changeBGForm').hide();
			});
		});
		</script>
		
		<decorator:head />
		
	</head>
	
	<body>
	
		<div id="using-chrome" style="display: none; padding: 4px; position:absolute; top:0; z-index: 999999; width: 100%; color: #fff; font-size: 10px; background-color: #42A9C7; text-align: center; border-bottom: 1px solid #666;">
			인디크라우드는 구글 크롬 브라우저에 최적화되어있습니다.
		</div>
	
		<div id="background"></div>
	
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
						<label>시작 시간</label> <fmt:formatNumber value="${command.startHours}" pattern="00" />:<fmt:formatNumber value="${command.startMinutes}" pattern="00" /> ~ <fmt:formatNumber value="${command.endHours}" pattern="00" />:<fmt:formatNumber value="${command.endMinutes}" pattern="00" />
					</span>
					<span>
						<label>밴드 정보</label> <a href="${pageContext.request.contextPath}/band/${command.bandInfo.id}" target="_blank">${command.bandInfo.name}</a>
					</span>
				</div>
			</div>
			
			<div id="userface-wrapper">
				<div id="userface-opti">
					<img id="userface" style="width:0px;height:0px;" />
				</div>
			</div>
			
			<div id="smartphone-wrapper">
				스마트폰에서는 기기를 흔들면 박수가 나갑니다.
			</div>
			
			<div id="function-wrapper">
				<div id="function">
					<span id="changeBG" style="display: none;">
						<a href="javascript:;" onclick="changeBG(event);">배경 바꾸기</a>
					</span>
					<span>
						<a href="${pageContext.request.contextPath}/concert/${command.id}/feed" target="_blank">피드백 모아보기</a>
					</span>
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
							<input id="message" style="border: 3px solid #999; border-radius: 5px; padding: 5px; width: 200px;">
							<input type="submit" style="border: 3px solid #999; background: orange; color:#fff; font-weight:bold; border-radius: 5px; padding: 5px; width: 60px;" value="전송">
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
		<form id="changeBGForm" action="<c:url value="/concert/${command.id}/changeBG" />" method="POST" enctype="multipart/form-data" target="changeBGFrame">
			<input type="file" name="bg">
			<br>
			<button type="submit">배경 변경</button>
		</form>
		<iframe name="changeBGFrame" style="display:none;"></iframe>
		
		<script>
		  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
		
		  ga('create', 'UA-40115412-1', 'indicrowd.com');
		  ga('send', 'pageview');
		
		</script>
	</body>
	
</html>
