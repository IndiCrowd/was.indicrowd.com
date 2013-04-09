<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<sec:authentication property="principal" var="principal" />


<div id="wrapper">
	<div class="perfectum">

		<div>
			<div class="box span12">
				<div class="box-header" data-original-title>
					<h2>
						<i class="icon-edit"></i><span class="break"></span>공연 예약
					</h2>
				</div>
				<div class="box-content">
					<form:form cssClass="form-horizontal">
						<form:hidden path="hallId" value="1" />
						<form:hidden path="bandId" value="5" />
						<fieldset>
							<div class="control-group <spring:bind path="title"><c:if test="${not empty status.errorMessage}">error</c:if></spring:bind>">
								<label class="control-label" for="title">공연명</label>
								<div class="controls">
									<form:input path="title" cssClass="input-xlarge" />
									<form:errors path="title" cssClass="help-inline" />
								</div>
							</div>
							<c:if test="${fn:length(principal.userBand) gt 0}">
								<div class="control-group">
									<label class="control-label" for="bandInfo">공연 밴드</label>
									<div class="controls">
										<ul class="nav nav-pills">
											<li class="active dropdown"><a class="dropdown-toggle"
												data-toggle="dropdown" href="#">
													<c:if test="${principal.userBand[0].imageFilePath ne ''}">
														<img border="0" width="22" height="22"
															src="${pageContext.request.contextPath}/img/band/${principal.userBand[0].imageFilePath }" />
													</c:if>${principal.userBand[0].name }<b class="caret"></b></a>
												<ul class="dropdown-menu">
													<c:forEach var="band" items="${principal.userBand }">
														<!-- img url 썸네일 변환 후 url로 수정해줘야함. -->
														<li class="active"><a href="#">
																<c:if test="${band.imageFilePath ne ''}">
																	<img border="0" width="22" height="22"
																		src="${pageContext.request.contextPath}/img/band/${band.imageFilePath }" />
																</c:if>${band.name }</a></li>
													</c:forEach>
												</ul></li>
										</ul>
										<form:errors path="title" cssClass="help-inline" />
									</div>
								</div>
							</c:if>
							
							<!-- div class="control-group <spring:bind path="inputDate"><c:if test="${not empty status.errorMessage}">error</c:if></spring:bind>">
								<label class="control-label" for="inputDate">공연 시작 시간</label>
								<div class="controls">
									<div class="input-prepend">
										<span class="add-on"><i class="icon-time"></i></span>
										<form:input path="inputDate" cssClass="datetimepicker" />
									</div>
									<form:errors path="inputDate" cssClass="help-inline" />
								</div>
							</div>-->
							
							<div class="control-group">
								<label class="control-label" for="inputDate">공연 일정</label>
								<div class="controls">
									<div id="calendar"></div>
								</div>
							</div>
							
							<div class="control-group <spring:bind path="duration"><c:if test="${not empty status.errorMessage}">error</c:if></spring:bind>">
								<label class="control-label" for="duration">공연시간</label>
								<div class="controls">
									 <form:input path="duration" cssStyle="text-align:right" />분
									<form:errors path="duration" cssClass="help-inline" />
								</div>
							</div>
							
							<div class="control-group <spring:bind path="audienceLimit"><c:if test="${not empty status.errorMessage}">error</c:if></spring:bind>">
								<label class="control-label" for="audienceLimit">관객 수</label>
								<div class="controls">
									 <form:input path="audienceLimit" cssStyle="text-align:right" />명
									<form:errors path="audienceLimit" cssClass="help-inline" />
								</div>
							</div>
							
							
							<div class="form-actions">
								<button type="submit" class="btn btn-primary">공연 예약!</button>
								<button type="reset" class="btn">취소</button>
							</div>
						</fieldset>
					</form:form>

				</div>
			</div>
			<!--/span-->

		</div>
		<!--/row-->

	</div>
</div>
<script src="<c:url value="/js/fullcalendar.min.js" />"></script>
<script>
var date = new Date();
var d = date.getDate();
var m = date.getMonth();
var y = date.getFullYear();

$('#calendar').fullCalendar({
	header: {
		left: 'title',
		right: 'prev,next today,month,agendaWeek,agendaDay'
	},
	editable: true,
	events: [
		{
			title: 'All Day Event',
			start: new Date(y, m, 1)
		},
		{
			title: 'Long Event',
			start: new Date(y, m, d-5),
			end: new Date(y, m, d-2)
		},
		{
			id: 999,
			title: 'Repeating Event',
			start: new Date(y, m, d-3, 16, 0),
			allDay: false
		},
		{
			id: 999,
			title: 'Repeating Event',
			start: new Date(y, m, d+4, 16, 0),
			allDay: false
		},
		{
			title: 'Meeting',
			start: new Date(y, m, d, 10, 30),
			allDay: false
		},
		{
			title: 'Lunch',
			start: new Date(y, m, d, 12, 0),
			end: new Date(y, m, d, 14, 0),
			allDay: false
		},
		{
			title: 'Birthday Party',
			start: new Date(y, m, d+1, 19, 0),
			end: new Date(y, m, d+1, 22, 30),
			allDay: false
		},
		{
			title: 'Click for Google',
			start: new Date(y, m, 28),
			end: new Date(y, m, 29),
			url: 'http://google.com/'
		}
	]
});
</script>
