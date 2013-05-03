<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
	
		<title>IndiCrowd :: 세계최초 온라인 콘서트 서비스</title>
		
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
		}
		a.circle {
			position: relative;
			display: block;
			width: 150px;
			height: 150px;
			border-radius: 80px;
			text-decoration: none;
			color: #fff;
			box-shadow: 0px 0px 5px rgba(0, 0, 0, 1);
		}
		a.circle span {
			top: 100px;
			width: 150px;
			margin-left: -75px;
			position: absolute;
			font-size: 20px;
			font-weight: bold;
			text-shadow: 0px 0px 5px rgba(0, 0, 0, 1);
		}
		
		#footer-wrapper {
			position: absolute;
			right: 15px;
			bottom: 10px;
			color: #fff;
		}
		
		</style>
		
		<script src="<c:url value="/js/jquery-1.9.1.min.js" />"></script>
		<jsp:include page="script-import.jsp" />
		
		<script>
		var $div, n = 1;
		function a1() {
			if ($div == undefined) {
				$div = $DIV({
					id : 'aa' + (n++),
					cls : 'circle',
					style: {
						background: 'url(${pageContext.request.contextPath}/img/istock/micani.png)',
						width: 150,
						height: 150,
						top: 0,
						left: 0,
						position: 'absolute',
						borderRadius: 75
					}
				}).sprite({fps: 12, no_of_frames: 10, on_last_frame: function(obj) {
		            obj.destroy();
		        }}).prependTo('#a1');
				
				$div.mouseout(function() {
					$div.remove();
					$div = undefined;
				});
			}
		}
		
		var $div2;
		function a2() {
			if ($div2 == undefined) {
				$div2 = $DIV({
					id : 'aa' + (n++),
					cls : 'circle',
					style: {
						background: 'url(${pageContext.request.contextPath}/img/istock/manani.png)',
						width: 150,
						height: 150,
						top: 0,
						left: 0,
						position: 'absolute',
						borderRadius: 75
					}
				}).sprite({fps: 12, no_of_frames: 10}).prependTo('#a2');
				
				$div2.mouseout(function() {
					$div2.remove();
					$div2 = undefined;
				});
			}
		}
		</script>
		
		
	</head>
	<body>
		
		<table style="width: 100%; height: 100%; position: absolute; top: 0;"><tr><td style="text-align: center;">
			<img src="${pageContext.request.contextPath}/img/ment.png">
			<p style="color: #fff; font-size: 14px; font-weight: bold; text-shadow: 0px 0px 5px rgba(0, 0, 0, 1); line-height: 2em;">인디크라우드는 인디 문화의 퇴색이라는 사회적 문제를,<br>IT기술로 해결해보자는 목표를 가진 밴드 온라인 공연 시스템입니다.</p>
			<div style="margin: 30px auto 0 auto; width: 350px; padding-bottom: 10px;">
				<a id="a1" onmouseover="a1();" class="circle" style="float:left; background-color: #01DFA5; border: 5px solid #01DFA5; background-image: url(${pageContext.request.contextPath}/img/istock/micani0.png);" href="${pageContext.request.contextPath}/main">
					<span>입장하기</span>
				</a>
				<a id="a2" onmouseover="a2();" class="circle" style="float:right; background-color: #A901DB; border: 5px solid #A901DB; background-image: url(${pageContext.request.contextPath}/img/istock/manani0.png);" href="${pageContext.request.contextPath}/user/join">
					<span>회원가입</span>
				</a>
				<div style="clear:both;">
			</div>
		</td></tr></table>
		
		<div id="footer-wrapper">
			<div id="footer">
				&copy; <img src="${pageContext.request.contextPath}/img/indicrowd.png" style="height: 12px;">
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
	