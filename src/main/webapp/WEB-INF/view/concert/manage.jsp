<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<sec:authentication property="principal" var="principal" />
<link href="<c:url value="/css/timeline-style.css"/>" rel="stylesheet" type="text/css">

<div id="wrapper" class="full">
	
<div id="timeline" >
		<ul id="dates">
			<li><a href="#2013.4.13" class="selected">4/13</a></li>
			<li><a href="#2013.4.15">4/15</a></li>
			<li><a href="#2013.6.13">6/13</a></li>
		</ul>
		<ul id="issues">
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