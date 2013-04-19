<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
			background-image: url('${pageContext.request.contextPath}/img/landingbg.jpg');
			background-size: 100% 100%;
		}
		a.circle {
			display: block;
			width: 150px;
			height: 50px;
			border-radius: 75px;
			padding-top: 100px;
			text-decoration: none;
			color: #fff;
		}
		
		a.circle:hover {
			animation: myfirst 1s;
			-webkit-animation: myfirst 1s infinite alternate; /* Safari and Chrome */
		}
		
		@keyframes myfirst
		{
		to {transform: scale(1.2)}
		}
		
		@-webkit-keyframes myfirst /* Safari and Chrome */
		{
		to {-webkit-transform: scale(1.2)}
		}
		</style>
		
	</head>
	<body>
		
		<table style="width: 100%; height: 100%;"><tr><td style="text-align: center;">
			<img src="${pageContext.request.contextPath}/img/ment.png">
			<div style="margin: 0 auto; width: 350px; padding-bottom: 10px;">
				<a class="circle" style="float:left; background: #01DFA5;" href="${pageContext.request.contextPath}/main">입장하기</a>
				<a class="circle" style="float:right; background: #A901DB;" href="${pageContext.request.contextPath}/user/join">회원가입</a>
				<div style="clear:both;">
			</div>
		</td></tr></table>
		
	</body>
</html>
	