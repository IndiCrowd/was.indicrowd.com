<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

	<head>
		<title>뜨거운 열기를 느껴라!</title>
	</head>

	<body>
	
		<div id="wrapper">
			<div class="row">
				<a href="<c:url value="/concert/reserve" />"><button class="btn btn-primary btn-large offset9"><i class="icon-download-alt icon-white"></i> 공연을 예약하세요!</button></a>
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
						<a class="image" href="javascript:popup('<c:url value="/concert/${one.id}" />', 'Concert', 1000, 700);" title="Title"><img
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
