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
		</style>
		
	</head>
	<body>
		
		<div style="width: 480px; background: #fff; margin: 0 auto; border: 1px solid #333; border-radius:10px; padding: 10px 0; box-shadow: 0px 0px 5px rgba(0, 0, 0, 1);">
			
			<div>
				<a href="javascript:popup('<c:url value="/concert/${command.id}" />', 'Concert', 1000, 700);location.href='${pageContext.request.contextPath}/band/${command.bandInfo.id}';"><img style="width: 100%; border: 0;" src="${liveThumbnailAddr}"></a>
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
		
		</div>
		
	</body>
</html>
	