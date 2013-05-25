<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
	<head>
	
		<title>${command.title} 공연 보기</title>
		
		<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
		<!--[if lt IE 8]>
		<script src="http://ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js"></script>
		<script type="text/javascript">window.attachEvent('onload',function(){CFInstall.check({mode:'overlay'})})</script>
		<![endif]-->
		
		<link rel="shortcut icon" href="<c:url value="/img/favicon.ico"/>">
		
		<style>
		html, body {
			width: 100%;
			height: 100%;
			margin: 0;
			padding: 0;
		}
		body {
			background-image: url('${pageContext.request.contextPath}/img/istock/bg<%= java.lang.Math.round(java.lang.Math.random() * 2) + 1 %>.jpg');
			background-size: 100% 100%;
			padding: 100px 0 200px 0;
		}
		h1 {
			background: #eee;
			padding: 10px;
			margin: 10px 0 0 0;
		}
		h1 a {
			color: #333;
			text-decoration: none;
		}
		#footer-wrapper {
			position: fixed;
			right: 15px;
			bottom: 10px;
			color: #fff;
		}
		.play_border {
			background-color: rgba(0, 0, 0, .3);
		    border: 2px solid rgba(255,255,255,.7);
		    -webkit-border-radius: 100%;
		    -moz-border-radius: 100%;
		    border-radius: 100%;
		    width: 50px;
		    height: 50px;
		    left: 50%;
		    top: 50%;
		    margin-left: -25px;
		    margin-top: -25px;
		    position: absolute;
		    -webkit-box-shadow: 0px 0px 5px 2px rgba(255,255,255,.5);
		    -moz-box-shadow: 0px 0px 5px 2px rgba(255,255,255,.5);
		    box-shadow: 0px 0px 5px 2px rgba(255,255,255,.5);
		    cursor: pointer;
		}
		.play_border:hover{
			background-color: rgba(0,0,0,0.1);
		}
		.play_border:active,.play_border:focus{
			background-color: rgba(0,0,0,0);
		}
		.play_button {
		    position:relative;
		    top: 50%;
		    left: 50%;
		    margin-left: -8px;
		    margin-top: -16px;
		    width: 0;
		    height: 0;
		    border-top: 16px solid transparent;
		    border-bottom: 16px solid transparent;
		    border-left: 16px solid rgba(255,255,255,.8);
		} 
		</style>
		
		<script>
		$(function() {
			var n = 0;
			var f = function() {
				var img = new Image();
				img.src = '${liveThumbnailAddr}&' + (n++);
				img.onload = function() {
					$('#thumb').attr('src', img.src);
				};
			};
			f();
			setInterval(f, 3000);
		});
		</script>
		
	</head>
	<body>
		
		<div style="width: 773px; margin: 0 auto;">
			
			<div style="width: 480px; background: #fff; float: left; border: 1px solid #333; border-radius:10px; padding: 10px 0; box-shadow: 0px 0px 5px rgba(0, 0, 0, 1);">
				<p style="padding: 0 10px;">
					아래 이미지는 실시간 공연 캡쳐 영상입니다.<br>
					공연을 보시려면 로그인 해 주시기 바랍니다.
				</p>
				<div style="position:relative; cursor:pointer;" onclick="popup('<c:url value="/concert/${command.id}" />', 'Concert', 1000, 700);location.href='${pageContext.request.contextPath}/band/${command.bandInfo.id}';">
					<img id="thumb" style="width: 100%; border: 0;" src="<spring:eval expression="@userfileConfig.baseUrl" />/concertthumb/${command.id}">
					<div class="play_border" style="width: 100px; height: 100px; margin-left: -50px; margin-top: -50px;">
					    <div class="play_button"></div>
					</div>
				</div>
			
			</div>
			
			<div style="width: 273px; background: #fff; float: right; border: 1px solid #333; border-radius:10px; box-shadow: 0px 0px 5px rgba(0, 0, 0, 1);">
				<sec:authorize access="isAnonymous()">
				<div style="padding: 10px; font-size: 14px; text-align: center;">
					<p style="margin: 0 0 10px 0;">공연을 보시려면 로그인이 필요합니다!</p>
					
					<!-- FACEBOOK login -->
					<form style="padding:0; margin:0;" id="facebook-login-form" action="${pageContext.request.contextPath}/signin/facebook" method="POST">
						<input type="hidden" name="scope" value="email" />
						<input type="hidden" name="redirect_uri" value="/c/${command.id}">
					</form>
					<!-- TWITTER login -->
					<form style="padding:0; margin:0;" id="twitter-login-form" action="${pageContext.request.contextPath}/signin/twitter" method="POST">
					</form>
					
					<a href="javascript:$('#facebook-login-form').submit(); void(0)" class="facebook_connect">
						<img src="${pageContext.request.contextPath}/img/fb-login.png">
					</a>
					<a href="javascript:$('#twitter-login-form').submit(); void(0)" class="twitter_connect">
						<img src="${pageContext.request.contextPath}/img/tw-login.png">
					</a>
					<a href="${pageContext.request.contextPath}/signin" style="float: left; padding-top: 10px; color: #999;">IndiCrowd 로그인</a>
					<a href="${pageContext.request.contextPath}/user/join" style="float: right; padding-top: 10px; color: #999;">회원가입</a>
					<div style="clear:both;"></div>
				</div>
				</sec:authorize>
				
				<sec:authorize access="isAuthenticated()">
				</sec:authorize>
			
				<h1>
					<a href="javascript:popup('<c:url value="/concert/${command.id}" />', 'Concert', 1000, 700);location.href='${pageContext.request.contextPath}/band/${command.bandInfo.id}'; void(0)">${command.title}<br><span style="font-size:16px; color:#999;">공연 보기</span></a>
				</h1>
				
				<div style="padding: 10px;">
					<a style="color: #000; text-decoration: none;" href="${pageContext.request.contextPath}/band/${command.bandInfo.id}"><h3>공연 밴드 - ${command.bandInfo.name} <span style="color: #999; font-weight: normal;">${band.category}</span></h3></a>
					<p>${command.bandInfo.description}</p>
				</div>
				
				<c:if test="${command.description != null}">
				<div style="padding: 10px;">
					공연 소개 - ${command.description}
				</div>
				</c:if>
					
			</div>
		
		</div>
				
		<div id="footer-wrapper">
			<div id="footer">
				<a href="http://www.indicrowd.com" style="color:#fff; text-decoration: none;">&copy; <img src="${pageContext.request.contextPath}/img/indicrowd.png" style="height: 12px; border: 0;"></a>
			</div>
		</div>
				
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
	