<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
	
		<title>${command.title} 공연 보기</title>
		
		<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
		<!--[if lt IE 8]>
		<script src="http://ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js"></script>
		<script type="text/javascript">window.attachEvent('onload',function(){CFInstall.check({mode:'overlay'})})</script>
		<![endif]-->
		
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
		h1 {
			background: #eee;
			padding: 10px;
			margin: 10px 0 0 0;
		}
		h1 a {
			color: #333;
			text-decoration: none;
		}
		</style>
		
	</head>
	<body>
		
		<div style="width: 500px; background: #fff; margin: 100px auto; border: 1px solid #333; border-radius:10px; padding: 10px 0; box-shadow: 0px 0px 5px rgba(0, 0, 0, 1);">
			
			<div>
				<a href="javascript:popup('<c:url value="/concert/${command.id}" />', 'Concert', 1000, 700);location.href='${pageContext.request.contextPath}/band/${command.bandInfo.id}';"><img style="width: 100%;" src="http://www.indicrowd.com/img/g.jpg"></a>
			</div>
		
			<h1>
				<a href="javascript:popup('<c:url value="/concert/${command.id}" />', 'Concert', 1000, 700);location.href='${pageContext.request.contextPath}/band/${command.bandInfo.id}';">${command.title} 공연 보기</a>
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
		
	</body>
</html>
	