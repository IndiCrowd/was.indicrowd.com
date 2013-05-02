<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<sec:authentication property="principal" var="principal" />
<link href="<c:url value="/css/timeline-style.css"/>" rel="stylesheet" type="text/css">

<div id="wrapper" class="full">
	
<div id="timeline" >
		<ul id="dates">
			<c:forEach items="${command }" var="concert" varStatus="i">
				<li><a href="#${concert.id }"><fmt:formatNumber value="${concert.startDate/100%100}" type="number" maxFractionDigits="0"/>/${concert.startDate%100 }</a></li>
			</c:forEach>
		</ul>
		<ul id="issues">
			<c:forEach items="${command }" var="concert">
				<li id="${concert.id }">
					<img src="<spring:eval expression="@userfileConfig.baseUrl" />/concertthumb/${concert.id}" style="width: 256px; height: 256px;">
					
					<h1><fmt:formatNumber value="${concert.startDate/100%100}" type="number" maxFractionDigits="0"/>/${concert.startDate%100 }</h1>
					<table style="width:100%; font-size:16px;  margin-top:40px; margin-bottom:40px; margin-left:30px">
						<tr><td>${concert.title } @ <c:choose><c:when test="${concert.startHours lt 12 }">오전</c:when><c:otherwise>오후</c:otherwise></c:choose> ${concert.startHours%12 }시<c:if test="${concert.startMinutes ne 0 }"> ${concert.startMinutes }분</c:if></td></tr>
						<tr><td><span class="badge badge-info">공연밴드 </span><a href="${pageContext.request.contextPath}/band/${concert.bandInfo.id}">${concert.bandInfo.name }</a></td></tr>
						<tr><td><span class="badge badge-success">관객</span> ${concert.totalAudienceCount }명이 관람하였습니다</td></tr>
					</table>
					<hr/>
					<p><button class="btn btn-success">공연 수정</button> <button class="btn btn-danger">공연 기록 삭제</button></p>
				</li>
			</c:forEach>
			<li id="2013.4.13" class="selected">
				<img src="${pageContext.request.contextPath}/img/timeline/3.png" width="256" height="256" />
				<h1>4/13</h1>
				<table style="width:100%; font-size:16px;  margin-top:40px; margin-bottom:40px; margin-left:30px">
					<tr><td>김승하의 기타교실 @ 저녁 6시</td></tr>
					<tr><td><span class="badge badge-info">공연밴드 </span><a href="#">10cm</a></td></tr>
					<tr><td><span class="badge badge-success">관객</span> 37명이 관람하였습니다</td></tr>
				</table>
				<hr/>
				<p><button class="btn btn-success">공연 수정</button> <button class="btn btn-danger">공연 기록 삭제</button></p>
			</li>
			<li id="2013.4.15">
				<img src="${pageContext.request.contextPath}/img/timeline/3.png" width="256" height="256" />
				<h1>4/15</h1>
				<table style="width:100%; font-size:16px;  margin-top:40px; margin-bottom:40px; margin-left:30px">
					<tr><td>김승하의 기타교실 @ 저녁 6시</td></tr>
					<tr><td><span class="badge badge-info">공연밴드 </span><a href="#">10cm</a></td></tr>
					<tr><td><span class="badge badge-success">관객</span> 37명이 관람하였습니다</td></tr>
				</table>
				<hr/>
				<p><button class="btn btn-success">공연 수정</button> <button class="btn btn-danger">공연 기록 삭제</button></p>
			</li>
			<li id="2013.6.13">
				<img src="${pageContext.request.contextPath}/img/timeline/3.png" width="256" height="256" />
				<h1>6/13</h1>
				<table style="width:100%; font-size:16px;  margin-top:40px; margin-bottom:40px; margin-left:30px">
					<tr><td>김승하의 기타교실 @ 저녁 6시</td></tr>
					<tr><td><span class="badge badge-info">공연밴드 </span><a href="#">10cm</a></td></tr>
					<tr><td><span class="badge badge-success">관객</span> 37명이 관람하였습니다</td></tr>
				</table>
				<hr/>
				<p><button class="btn btn-success">공연 수정</button> <button class="btn btn-danger">공연 기록 삭제</button></p>
			</li>
			
		</ul>
		<div id="grad_top"></div>
		<div id="grad_bottom"></div>
		<a href="#" id="next">+</a>
		<a href="#" id="prev">-</a>
	</div>
	</div>
	
<script src="<c:url value="/js/jquery.timelinr-0.9.53.js" />"></script>
<script>
$(function(){
	$().timelinr({
		orientation: 	'vertical',
		issuesSpeed: 	300,
		datesSpeed: 	100,
		arrowKeys: 		'true',
		startAt:		1
	})
});
</script>