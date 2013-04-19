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
		<style>
		html, body {
			background-image: url('${pageContext.request.contextPath}/img/purty_wood.png');
			padding:0;
			margin:0;
			width:100%;
			height:100%;
		}
		#under-footer {
			position: fixed;
			width: 100%;
			bottom: 0;
		}
		</style>
	</head>
	<body>
	
	<div id="wrapper" style="padding-bottom:50px;">
		<div class="container">
			<div class="row gallery">
				
				<div class="perfectum span8 affix">
					<div id="panel" class="box wrapper" style="margin: 0;">
						<div class="wrap">
							<div class="box-header" style="height: 37px; padding:0 0 0 12px;">
								<h3><i class="icon-music"></i><span class="break"></span>뜨거운 열기를 느껴라!</h3>
							</div>
							<div class="box-content" style="padding: 0;">
								<div style="height: 60%;">
									<div style="width: 59%; height: 100%; float: left;">
										<div style="padding: 0 10px;">
											<h4>On Air!</h4>
										</div>
									</div>
									<div style="border-left:1px solid #ccc; width: 39%; height: 100%; float: right;">
										<div style="padding: 0 10px;">
											<h4>Coming Up!</h4>
										</div>
									</div>
								</div>
								<div style="border-top:1px solid #ccc; height: 40%;">
									<div style="padding: 0 10px;">
										<h4>History</h4>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
	
				<script>
				var f = function() {
					$('#panel .box-content').css({
						height: $(window).height() - 220
					});
				};
				f();
				$(window).resize(f);
				</script>
				
				
				
				<div class="span4 pull-right">
					<div class="wrapper">
						<div class="pull-left" style="padding-top: 4px; padding-right: 5px;">
							<img src="${pageContext.request.contextPath}/img/001_15.png">
						</div>
						<h3 class="pull-left">Hot Bands for this week!</h3>
						<div style="clear:both;"></div>
					</div>
					<% for (int i = 0 ; i < 100 ; i++) { %>
					<div class="wrapper" style="margin-top: 15px;">
						<div class="widget" style="width: 50%; float:left;">
							<div class="flex-image">
								<img src="${pageContext.request.contextPath}/img/band/broccoli.jpg">
							</div>
						</div>
						<div style="width: 45%; float:right;">
							<div class="team-name" style="text-align: left; padding: 0 0 10px 0;">
								브로콜리 너마저
								<br>
								<span>Rock Folk</span>
							</div>
							<p class="text-info" style="margin: 0;">
								<a href="#">문화콘서트 난장 브로콜리 너마저 - 앵콜요청금지</a>
							</p>
						</div>
						<div style="clear:both;"></div>
					</div>
					<div class="wrapper" style="margin-top: 15px;">
						<div class="widget" style="width: 50%; float:left;">
							<div class="flex-image">
								<img src="${pageContext.request.contextPath}/img/band/10cm.jpg">
							</div>
						</div>
						<div style="width: 45%; float:right;">
							<div class="team-name" style="text-align: left; padding: 0 0 10px 0;">
								10cm
								<br>
								<span>Rock Folk</span>
							</div>
							<p class="text-info" style="margin: 0;">
								<a href="#">10cm - Fine Thank You And You</a>
							</p>
						</div>
						<div style="clear:both;"></div>
					</div>
					
					<div class="wrapper" style="margin-top: 15px;">
						<div class="widget" style="width: 50%; float:left;">
							<div class="flex-image">
								<img src="${pageContext.request.contextPath}/img/band/elrvjdtm.jpg">
							</div>
						</div>
						<div style="width: 45%; float:right;">
							<div class="team-name" style="text-align: left; padding: 0 0 10px 0;">
								딕펑스
								<br>
								<span>Rock</span>
							</div>
							<p class="text-info" style="margin: 0;">
								<a href="#">슈퍼스타K 4 - PSY_Gangnam Style</a>
							</p>
						</div>
						<div style="clear:both;"></div>
					</div>
					<% } %>
				</div>
			</div>
		</div>
	</div>
	
	<%--
	
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
	
	--%>

	</body>
</html>
	