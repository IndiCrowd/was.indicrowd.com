<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sec:authentication property="principal" var="principal" />

<!DOCTYPE html>
<html>

	<head>
		<title>세계최초 온라인 콘서트 서비스</title>
	</head>
	<body>
	
	<!--start: Wrapper-->
	<div id="wrapper">
	
		<!-- start: Row -->
		<div class="row-fluid">
	
			<div class="span12">
	
				<!-- start: Team -->
	
				<div class="gallery">
	
	
					<!-- start: Row -->
	
					<div class="row-fluid">
						<div class="span3">
							
							<h2>Previous concerts</h2>
							
							<div class="wrapper">
								<div class="concert">
									<img src="${pageContext.request.contextPath}/img/band/broccoli.jpg">
									<h4>
										장난아닌 공연
										<span class="time">00:00</span>
									</h4>
								</div>
								<hr>
								<div class="concert">
									<img src="${pageContext.request.contextPath}/img/band/broccoli.jpg">
									<h4>
										끝내주는 공연
										<span class="time">00:00</span>
									</h4>
								</div>
								<hr>
								<div class="concert">
									<img src="${pageContext.request.contextPath}/img/band/broccoli.jpg">
									<h4>
										죽여주는 공연
										<span class="time">00:00</span>
									</h4>
								</div>
								<hr>
								<div class="concert">
									<img src="${pageContext.request.contextPath}/img/band/broccoli.jpg">
									<h4>
										완전 미친 공연
										<span class="time">00:00</span>
									</h4>
								</div>
							</div>
						</div>
	
						<hr class="clean visible-phone">
						
						<div class="span6">
							
							<h1><img src="${pageContext.request.contextPath}/img/on_live_concert.png"></h1>
							
							<div class="wrapper" style="background: #000; border: none;">
							
								<div class="widget">
									<div class="flex-video widescreen">
										<iframe src="http://www.youtube.com/embed/FgAaUI6n44I"
											width="480" height="256" frameborder="0" webkitAllowFullScreen
											mozallowfullscreen allowFullScreen></iframe>
									</div>
								</div>
							</div>
	
						</div>
	
						<hr class="clean visible-phone">
	
						<div class="span3">
						
							<h2>Next concerts</h2>
							
							<div class="wrapper">
								<div class="concert">
									<img src="${pageContext.request.contextPath}/img/band/broccoli.jpg">
									<h4>
										장난아닌 공연
										<span class="time">00:00</span>
									</h4>
								</div>
								<hr>
								<div class="concert">
									<img src="${pageContext.request.contextPath}/img/band/broccoli.jpg">
									<h4>
										끝내주는 공연
										<span class="time">00:00</span>
									</h4>
								</div>
								<hr>
								<div class="concert">
									<img src="${pageContext.request.contextPath}/img/band/broccoli.jpg">
									<h4>
										죽여주는 공연
										<span class="time">00:00</span>
									</h4>
								</div>
								<hr>
								<div class="concert">
									<img src="${pageContext.request.contextPath}/img/band/broccoli.jpg">
									<h4>
										완전 미친 공연
										<span class="time">00:00</span>
									</h4>
								</div>
							</div>
						</div>
	
						<hr class="clean visible-phone">
	
					</div>
					<!-- end: Row -->
	
				</div>
				<!-- end: Team -->
	
			</div>
	
		</div>
		<!-- end: Row -->
		
		<!-- start: Row -->
		<div class="row-fluid">
	
			<div class="span12">
	
				<!-- start: Team -->
	
				<div class="gallery">
			
					<h2>Top Bands for this week</h2>
	
					<!-- start: Row -->
	
					<div class="row-fluid">
						<div class="span3">
							<div class="wrapper">
								<div class="widget">
									<div class="flex-image">
										<img src="${pageContext.request.contextPath}/img/band/10cm.jpg">
									</div>
								</div>
								<div class="team-name">
									밴딩머신 <span> / Rock</span>
								</div>
								<p class="text-info">
									<a href="#">벤딩머신(Vending Machine) - SPR(Live)</a>
								</p>
							</div>
						</div>
	
						<hr class="clean visible-phone">
						<div class="span3">
							<div class="wrapper">
								<div class="widget">
									<div class="flex-image">
										<img src="${pageContext.request.contextPath}/img/band/elrvjdtm.jpg">
									</div>
								</div>
								<div class="team-name">
									딕펑스 <span> / Rock</span>
								</div>
								<p class="text-info">
									<a href="#">슈퍼스타K 4 - PSY_Gangnam Style with [Superstark4
										10회] 딕펑스_"고추잠자리" @생방송 무대</a>
								</p>
							</div>
						</div>
	
						<hr class="clean visible-phone">
	
						<div class="span3">
							<div class="wrapper">
								<div class="widget">
									<div class="flex-image">
										<img src="${pageContext.request.contextPath}/img/band/10cm.jpg">
									</div>
								</div>
								<div class="team-name">
									10cm <span> / Rock Folk</span>
								</div>
								<p class="text-info">
									<a href="#">10cm - Fine Thank You And You</a>
								</p>
							</div>
						</div>
	
						<hr class="clean visible-phone">
	
						<div class="span3">
							<div class="wrapper">
								<div class="widget">
									<div class="flex-image">
										<img src="${pageContext.request.contextPath}/img/band/broccoli.jpg">
									</div>
								</div>
								<div class="team-name">
									브로콜리 너마저 <span> / Rock Folk</span>
								</div>
								<p class="text-info">
									<a href="#">문화콘서트 난장 브로콜리 너마저 - 앵콜요청금지</a>
								</p>
							</div>
						</div>
	
						<hr class="clean visible-phone">
	
					</div>
					<!-- end: Row -->
	
				</div>
				<!-- end: Team -->
	
			</div>
	
		</div>
		<!-- end: Row -->
	
	</div>
	<!--  end wrapper -->
	
	<script src="<c:url value="/js/jquery.movingboxes.min.js" />"></script>
	<script src="<c:url value="/js/broadcast-slider.js" />"></script>

	</body>
</html>
	