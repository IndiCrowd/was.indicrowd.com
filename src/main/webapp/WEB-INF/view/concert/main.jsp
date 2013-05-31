<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<sec:authentication property="principal" var="principal" />

<!DOCTYPE html>
<html>

	<head>
		<title>뜨거운 열기를 느껴라!</title>
		
		<style>
		.concert-content {
			position: absolute;
			top: 0;
			padding: 0;
			margin: 0;
			color: #fff;
			width: 100%;
			height: 100%;
			cursor: pointer;
			overflow: hidden;
	        -webkit-background-size: cover;
	        -moz-background-size: cover;
	        -o-background-size: cover;
	        background-size: cover;
		}
		.concert-content h4 {
			background-color: #333;
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
	
		<div id="wrapper">
			<div class="row">
				<div class="pull-left gallery">
					
					<div id="concertPanel" class="perfectum span8" style="margin-bottom: 30px;">
						<div id="panel" class="box wrapper" style="margin: 0;">
							<div class="wrap">
								<div class="box-content" style="padding: 0; height: 100%;">
									<div style="height: 100%; position: relative;">
										<div style="width: 59%; height: 100%; float: left;">
											<div style="padding: 0; height: 100%;">
											<c:if test="${comingUpConcertList.size() == 0}">
												<iframe width="100%" height="100%" src="http://www.youtube.com/embed/7YJfqK6QmWs" frameborder="0" allowfullscreen></iframe>
											</c:if>
											<c:forEach items="${comingUpConcertList}" var="concert" end="0">
												<div onclick="popup('<c:url value="/concert/${concert.id}" />', 'Concert', 1000, 700);" style="width:59%; background-image: url(<spring:eval expression="@userfileConfig.baseUrl" />/concertthumb/${concert.id})" class="concert-content">
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
												<c:if test="${comingUpConcertList.size() < 2}">
													<p style="padding: 10px 10px 0 10px;">오늘 다가오는 공연이 없습니다.<br>공연을 예약해보세요!</p>
													<center><a href="<c:if test="${principal != 'anonymousUser' && principal.userBand != null && principal.userBand.size() > 0}"><c:url value="/concert/reserve" /></c:if><c:if test="${!(principal != 'anonymousUser' && principal.userBand != null && principal.userBand.size() > 0)}">javascript:alert('현재 속해 있는 밴드가 없습니다.\n밴드 생성 페이지로 이동합니다.');location.href='<c:url value="/band/create" />';</c:if>" class="btn btn-primary btn-large"><i class="icon-download-alt icon-white"></i> 공연을 예약하세요!</a></center>
													<img src="${pageContext.request.contextPath}/img/b.png" style="width: 94%; bottom:0; position:absolute;">
												</c:if>
												<c:forEach items="${comingUpConcertList}" var="concert" begin="1">
												<div style="height: 50%; position: relative;">
													<div onclick="popup('<c:url value="/concert/${concert.id}" />', 'Concert', 1000, 700);" style="background-image: url(<spring:eval expression="@userfileConfig.baseUrl" />/concertthumb/${concert.id})" class="concert-content">
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
								</div>
							</div>
						</div>
					</div>
					
					<script>
					var f = function() {
						$('#panel .box-content').css({
							height: 400
						});
					};
					f();
					$(window).resize(f);
					</script>
					
				</div>
				<div class="pull-right">
					<a href="javascript:alert('일정표는 아직 준비중입니다!'); void(0)" class="btn btn-info btn-large"><i class="icon-calendar icon-white"></i> 공연 일정표</a>
					<a href="<c:if test="${principal != 'anonymousUser' && principal.userBand != null && principal.userBand.size() > 0}"><c:url value="/concert/reserve" /></c:if><c:if test="${!(principal != 'anonymousUser' && principal.userBand != null && principal.userBand.size() > 0)}">javascript:alert('현재 속해 있는 밴드가 없습니다.\n밴드 생성 페이지로 이동합니다.');location.href='<c:url value="/band/create" />';</c:if>" class="btn btn-primary btn-large"><i class="icon-download-alt icon-white"></i> 공연을 예약하세요!</a>
				</div>
			</div>
			
			<div id="filters">
				<ul class="option-set" data-option-key="filter">
					<li><a href="#filter" class="selected" data-option-value="*">전체 공연</a></li>
					<li>/</li>
					<%
					java.util.Date currentTime = new java.util.Date ( );
					
					java.text.SimpleDateFormat todayFormat = new java.text.SimpleDateFormat("yyyyMMdd");
					String today = todayFormat.format ( currentTime );
					%>
					<li><a href="#filter" data-option-value=".d-<%=today%>">오늘의 공연</a></li>
					<li>/</li>
					<%
					java.text.SimpleDateFormat weekFormat = new java.text.SimpleDateFormat("yyyyMMdd");
					
					java.util.Calendar cal = new java.util.GregorianCalendar();
					
				    cal.add(java.util.Calendar.DATE, -1);
					java.util.Date t1 = cal.getTime();
					
					 cal.add(java.util.Calendar.DATE, -1);
					java.util.Date t2 = cal.getTime();
					
					 cal.add(java.util.Calendar.DATE, -1);
					java.util.Date t3 = cal.getTime();
					
					 cal.add(java.util.Calendar.DATE, -1);
					java.util.Date t4 = cal.getTime();
					
					 cal.add(java.util.Calendar.DATE, -1);
					java.util.Date t5 = cal.getTime();
					
					 cal.add(java.util.Calendar.DATE, -1);
					java.util.Date t6 = cal.getTime();
					
					 cal.add(java.util.Calendar.DATE, -1);
					java.util.Date t7 = cal.getTime();
					
					String d1 = weekFormat.format ( t1 );
					String d2 = weekFormat.format ( t2 );
					String d3 = weekFormat.format ( t3 );
					String d4 = weekFormat.format ( t4 );
					String d5 = weekFormat.format ( t5 );
					String d6 = weekFormat.format ( t6 );
					String d7 = weekFormat.format ( t7 );
					%>
					<li><a href="#filter" data-option-value=".d-<%=today%>, .d-<%=d1%>, .d-<%=d2%>, .d-<%=d3%>, .d-<%=d4%>, .d-<%=d5%>, .d-<%=d6%>, .d-<%=d7%>">최근 한 주 공연</a></li>
					<li>/</li>
					<%
					java.text.SimpleDateFormat monthFormat = new java.text.SimpleDateFormat("yyyyMM");
					String month = monthFormat.format ( currentTime );
					%>
					<li><a href="#filter" data-option-value=".m-<%=month%>">이번 달 공연</a></li>
				</ul>
			</div>
			
			<!-- start: Portfolio -->
			<div id="wall" class="row-fluid">
				<c:forEach items="${command.list}" var="one">
				<div class="span3 item m-${one.startDate.toString().substring(0, 6)} d-${one.startDate.toString()}">
					<div class="picture">
						<a class="image" href="javascript:popup('<c:url value="/concert/${one.id}" />', 'Concert', 1000, 700); void(0)" title="Title"><img
							src="<spring:eval expression="@userfileConfig.baseUrl" />/concertthumb/${one.id}" alt="" /></a>
						<h3>${one.title}</h3>
						<div class="description">
							<p>${one.description}</p>
						</div>
					</div>
				</div>
				</c:forEach>
		
			</div>
			<!-- end: Portfolio -->
		</div>

	</body>
</html>
