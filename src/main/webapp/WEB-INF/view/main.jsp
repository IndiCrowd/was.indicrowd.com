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
		.concert-content {
			position: absolute;
			top: 0;
			padding: 0;
			margin: 0;
			color: #fff;
			width: 100%;
			height: 100%;
			cursor: pointer;
		}
		.concert-content h4 {
			background-color: rgba(0, 0, 0, .5);
			padding: 15px 20px;
			margin: 0;
			font-size: 18px;
			font-weight: bold;
		}
		.concert-content .time {
			display: block;
			text-align: right;
			padding-right: 5px;
			text-shadow: 0px 0px 5px rgba(0, 0, 0, 1);
		}
		.concert-content .onbadge {
			position:absolute;
			bottom: 0;
			color:#fff;
			font-size: 14px;
			font-weight: bold;
			padding: 5px 40px 5px 10px;
			border-top-right-radius: 10px;
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
	</head>
	<body>
	
	<div id="wrapper" style="padding-bottom:50px;">
		<div class="container">
			<div class="row gallery">
				
				<div id="concertPanel" class="perfectum span8 affix" style="margin-bottom: 30px;">
					<div id="panel" class="box wrapper" style="margin: 0;">
						<div class="wrap">
							<div class="box-header" style="height: 37px; padding:0 0 0 12px;">
								<h3><i class="icon-music"></i><span class="break"></span>뜨거운 열기를 느껴라!</h3>
							</div>
							<div class="box-content" style="padding: 0; height: 100%;">
								<div style="height: 60%; position: relative;">
									<div style="width: 59%; height: 100%; float: left;">
										<div style="padding: 0;">
										<c:forEach items="${comingUpConcertList}" var="concert" end="0">
											<img src="<spring:eval expression="@userfileConfig.baseUrl" />/concertthumb/${concert.id}" style="width: 100%; height: 100%;">
											<div onclick="popup('<c:url value="/concert/${concert.id}" />', 'Concert', 1000, 700);" class="concert-content" style="width: 59%;">
												<h4>${concert.title} - ${concert.bandInfo.name}</h4>
												<span class="time">${concert.startHours}시 ${concert.startMinutes}분 부터, ${concert.duration}분 동안!</span>
												<div class="play_border" style="width: 100px; height: 100px; margin-left: -50px; margin-top: -50px;">
												    <div class="play_button"></div>
												</div>
												<div class="onbadge" style="background:red; font-size: 16px;">ON LIVE!</div>
											</div>
										</c:forEach>
										</div>
									</div>
									<div style="border-left:1px solid #ddd; width: 39%; height: 100%; float: right;">
										<div style="padding: 0 10px; height: 100%;">
											<c:forEach items="${comingUpConcertList}" var="concert" begin="1">
											<div style="height: 50%; position: relative;">
												<img src="<spring:eval expression="@userfileConfig.baseUrl" />/concertthumb/${concert.id}" style="width: 100%; height: 100%;">
												<div onclick="popup('<c:url value="/concert/${concert.id}" />', 'Concert', 1000, 700);" class="concert-content">
													<h4>${concert.title} - ${concert.bandInfo.name}</h4>
													<span class="time">${concert.startHours}시 ${concert.startMinutes}분 부터, ${concert.duration}분 동안!</span>
													<div class="play_border">
													    <div class="play_button"></div>
													</div>
													<div class="onbadge" style="background: orange;">COMING UP!</div>
												</div>
											</div>
											</c:forEach>
										</div>
									</div>
									<div style="clear:both;"></div>
								</div>
								<div style="border-top:1px solid #ddd; height: 40%;">
									<div style="padding: 0;">
										
										<c:forEach items="${previousConcertList}" var="concert">
											<div style="width: 33%; float: left; position: relative;">
												<img src="<spring:eval expression="@userfileConfig.baseUrl" />/concertthumb/${concert.id}" style="width: 100%; height: 100%;">
												<div onclick="popup('<c:url value="/concert/${concert.id}" />', 'Concert', 1000, 700);" class="concert-content">
													<h4>${concert.title} - ${concert.bandInfo.name}</h4>
													<span class="time">${concert.startHours}시 ${concert.startMinutes}분 부터, ${concert.duration}분 동안!</span>
													<div class="play_border">
													    <div class="play_button"></div>
													</div>
													<div class="onbadge" style="background: #999;">PREVIOUS</div>
												</div>
											</div>
										</c:forEach>
										
										<div style="clear:both;"></div>
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
					if ($(window).width() < 767) {
						$('#concertPanel').removeClass('affix');
					} else {
						$('#concertPanel').addClass('affix');
					}
				};
				f();
				$(window).resize(f);
				</script>
				
				
				
				<div class="span4 pull-right">
					<div class="wrapper">
						<div style="line-height: 3em;">
							<a href="javascript:$('#tutorial').show();" class="btn btn-info"><i class="icon-question-sign icon-white"></i> 튜토리얼</a>
							<a href="${pageContext.request.contextPath}/about" class="btn btn-success"><i class="icon-comment icon-white"></i> IndiCrowd 소개</a>
						</div>
						<div style="margin-top: 10px; text-align: center;">
							<a href="https://www.facebook.com/IndiCrowd" target="_blank"><i class="fa-icon-facebook-sign"></i> 페이스북으로 피드백을 남겨주세요.</a>
						</div>
					</div>
					
					<div class="wrapper" style="margin-top: 15px;">
						<div class="pull-left" style="padding-top: 4px; padding-right: 5px;">
							<img src="${pageContext.request.contextPath}/img/001_15.png">
						</div>
						<h3 class="pull-left">Hot Bands for This Week!</h3>
						<div style="clear:both;"></div>
					</div>
					<c:forEach items="${bands}" var="band">
					<div class="wrapper" style="margin-top: 15px;">
						<div class="widget" style="width: 50%; float:left;">
							<div class="flex-image">
								<img src="<spring:eval expression="@userfileConfig.baseUrl" />/bandthumb/${band.id}" alt="" />
							</div>
						</div>
						<div style="width: 45%; float:right;">
							<div class="team-name" style="text-align: left; padding: 0 0 10px 0;">
								${band.name}
								<br>
								<span>${band.category}</span>
							</div>
							<p class="text-info" style="margin: 0;">
								<a href="#">${band.description.length() > 30 ? band.description.substring(0, 30).concat('...') : band.description}</a>
							</p>
						</div>
						<div style="clear:both;"></div>
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	
	<div id="tutorial" style="display: none; position: fixed; top: 0; left: 0; z-index: 100000; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.5); text-align: center;">
		<img src="${pageContext.request.contextPath}/img/tutorial.png">
		<br>
		<a href="javascript:$('#tutorial').hide();" class="btn btn-large btn-danger" style="margin-top: 50px;"><i class="icon-remove icon-white"></i> 튜토리얼 닫기</a>
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
	