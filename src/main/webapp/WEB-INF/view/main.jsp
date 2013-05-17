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
										<c:if test="${comingUpConcertList.size() == 0}">
											<iframe width="100%" height="100%" src="http://www.youtube.com/embed/7YJfqK6QmWs" frameborder="0" allowfullscreen></iframe>
										</c:if>
										<c:forEach items="${comingUpConcertList}" var="concert" end="0">
											<img src="<spring:eval expression="@userfileConfig.baseUrl" />/concertthumb/${concert.id}" style="width: 100%; height: 100%;">
											<div onclick="popup('<c:url value="/concert/${concert.id}" />', 'Concert', 1000, 700);" class="concert-content" style="width: 59%;">
												<h4 style="line-height: 1.4em;">${concert.title} - ${concert.bandInfo.name}</h4>
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
										<div style="padding: 0 10px; height: 100%; position:relative;">
											<c:if test="${comingUpConcertList.size() == 0}">
												<p style="padding: 10px 10px 0 10px;">앞으로 다가오는 공연이 없습니다.<br>공연을 예약해보세요!</p>
												<center><a href="<c:if test="${principal != 'anonymousUser' && principal.userBand != null && principal.userBand.size() > 0}"><c:url value="/concert/reserve" /></c:if><c:if test="${!(principal != 'anonymousUser' && principal.userBand != null && principal.userBand.size() > 0)}">javascript:alert('현재 속해 있는 밴드가 없습니다.\n밴드 생성 페이지로 이동합니다.');location.href='<c:url value="/band/create" />';</c:if>" class="btn btn-primary btn-large"><i class="icon-download-alt icon-white"></i> 공연을 예약하세요!</a></center>
												<img src="${pageContext.request.contextPath}/img/b.png" style="width: 94%; bottom:0; position:absolute;">
											</c:if>
											<c:forEach items="${comingUpConcertList}" var="concert" begin="1">
											<div style="height: 50%; position: relative;">
												<img src="<spring:eval expression="@userfileConfig.baseUrl" />/concertthumb/${concert.id}" style="width: 100%; height: 100%;">
												<div onclick="popup('<c:url value="/concert/${concert.id}" />', 'Concert', 1000, 700);" class="concert-content">
													<h4 style="line-height: 1.4em;">${concert.title} - ${concert.bandInfo.name}</h4>
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
													<h4 style="line-height: 1.4em;">${concert.title} - ${concert.bandInfo.name}</h4>
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
				
					<sec:authorize access="isAnonymous()">
					
					<div class="wrapper" style="margin-bottom: 15px;">
				
					<!-- FACEBOOK login -->
					<form style="padding:0; margin:0;" id="facebook-login-form" action="${pageContext.request.contextPath}/signin/facebook" method="POST">
						<input type="hidden" name="scope" value="email" />
					</form>
					<!-- TWITTER login -->
					<form style="padding:0; margin:0;" id="twitter-login-form" action="${pageContext.request.contextPath}/signin/twitter" method="POST">
					</form>
					
					<a href="javascript:$('#facebook-login-form').submit(); void(0)" class="facebook_connect" style="width: 48%; float: left; font-size: 14px;">
						<div class="img"><i class="fa-icon-facebook"></i></div>
						<div class="text">페이스북 로그인</div>
					</a>
					<a href="javascript:$('#twitter-login-form').submit(); void(0)" class="twitter_connect" style="width: 48%; float: right; font-size: 14px;">
						<div class="img"><i class="fa-icon-twitter"></i></div>
						<div class="text">트위터 로그인</div>
					</a>
					<div style="clear:both;"></div>
					
					</div>
					
					</sec:authorize>
					
					<div class="wrapper">
						<div style="line-height: 3em;">
							<a href="javascript:$('#tutorial').show(); void(0)" class="btn btn-info"><i class="icon-question-sign icon-white"></i> 튜토리얼</a>
							<a href="${pageContext.request.contextPath}/about" class="btn btn-success"><i class="icon-comment icon-white"></i> IndiCrowd 소개</a>
						</div>
						<div style="margin-top: 10px; text-align: center;">
							<a href="https://www.facebook.com/IndiCrowd" target="_blank"><i class="fa-icon-facebook-sign"></i> 페이스북으로 피드백을 남겨주세요.</a>
						</div>
					</div>
					
					<div class="wrapper" style="margin-top: 15px;">
						<div class="perfectum">
							<div class="title"><h3>공지사항</h3></div>
							<table class="table table-striped">
								  <tbody>
									<c:forEach items="${notices}" var="article">
										<tr>
											<td><a href="${pageContext.request.contextPath}/article/${article.id}">${article.title}</a></td>                              
										</tr>         
									</c:forEach>                   
								  </tbody>
							 </table>
						</div>
					</div>
					
					<div class="wrapper" style="margin-top: 15px;">
						<div class="pull-left" style="padding-top: 4px; padding-right: 5px;">
							<img src="${pageContext.request.contextPath}/img/001_15.png">
						</div>
						<h3 class="pull-left">Best Hot Bands! (${bands.size()})</h3>
						<div style="clear:both;"></div>
					</div>
					<c:forEach items="${bands}" var="band">
					<div class="wrapper" style="margin-top: 15px;">
						<div class="widget" style="width: 50%; float:left;">
							<div class="flex-image">
								<a href="${pageContext.request.contextPath}/band/${band.id}"><img src="<spring:eval expression="@userfileConfig.baseUrl" />/bandthumb/${band.id}" alt="" /><a href="${pageContext.request.contextPath}/band/${band.id}">
							</div>
						</div>
						<div style="width: 45%; float:right;">
							<div class="team-name" style="text-align: left; padding: 0 0 10px 0;">
								<a href="${pageContext.request.contextPath}/band/${band.id}">
								${band.name}
								<br>
								<span>${band.category}</span>
								</a>
							</div>
							<p class="text-info" style="margin: 0;">
								<a href="${pageContext.request.contextPath}/band/${band.id}">${band.description.length() > 30 ? band.description.substring(0, 30).concat('...') : band.description}</a>
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
		<a href="javascript:$('#tutorial').hide(); void(0)" class="btn btn-large btn-danger" style="margin-top: 50px;"><i class="icon-remove icon-white"></i> 튜토리얼 닫기</a>
	</div>
	

	</body>
</html>
	