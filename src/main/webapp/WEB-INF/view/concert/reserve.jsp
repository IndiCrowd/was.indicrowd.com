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
														<img border="0" style="width:22px ;height:22px"
															src="${pageContext.request.contextPath}/img/band/${principal.userBand[0].imageFilePath }" />
													</c:if>${principal.userBand[0].name }<b class="caret"></b></a>
												<ul class="dropdown-menu">
													<c:forEach var="band" items="${principal.userBand }">
														<!-- img url 썸네일 변환 후 url로 수정해줘야함. -->
														<li class="active"><a href="#">
																<c:if test="${band.imageFilePath ne ''}">
																	<img border="0" style="width:22px ;height:22px"
																		src="${pageContext.request.contextPath}/img/band/${band.imageFilePath }" />
																</c:if>${band.name }</a></li>
													</c:forEach>
												</ul></li>
										</ul>
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
								<label class="control-label" for="inputDate">
									공연 일정
								</label>
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
<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h1 id="myModalLabel" style="font-size:20px; font-weight: bold">공연할 시간을 정해주세요!</h1>
  </div>
  <div class="modal-body" style="font-size: 16px">
    <p ><span id="modalYear" ></span>년 <span id="modalMonth"></span>월 <span id="modalDate"></span>일  
    	<select class="span1" id="modalHour">
    		<option value="0">00시</option>
    		<option value="1">01시</option>
    		<option value="2">02시</option>
    		<option value="3">03시</option>
    		<option value="4">04시</option>
    		<option value="5">05시</option>
    		<option value="6">06시</option>
    		<option value="7">07시</option>
    		<option value="8">08시</option>
    		<option value="9">09시</option>
    		<option value="10">10시</option>
    		<option value="11">11시</option>
    		<option value="12">12시</option>
    		<option value="13">13시</option>
    		<option value="14">14시</option>
    		<option value="15">15시</option>
    		<option value="16">16시</option>
    		<option value="17">17시</option>
    		<option value="18">18시</option>
    		<option value="19">19시</option>
    		<option value="20">20시</option>
    		<option value="21">21시</option>
    		<option value="22">22시</option>
    		<option value="23">23시</option>
    	</select>
    	<select class="span1" id="modalMinute">
    		<option value="0">00분</option>
    		<option value="30">30분</option>
    	</select>에 </p>
    	<p><select class="span1" id="modalDuration">
    		<option value="30">30</option>
    		<option value="60">60</option>
    		<option value="90">90</option>
    	</select>분간 공연합니다.</p>
    
    
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
    <button class="btn btn-primary">Save changes</button>
  </div>
</div>
<script src="<c:url value="/js/fullcalendar.min.js" />"></script>
<script>
/*set of command
 add Event
$('#calendar').fullCalendar('renderEvent',{title: 'Lunch',start: new Date(y, m, d, 12, 30),end: new Date(y, m, d, 14, 0),allDay: false})


*/

function objToEvent(obj){
	return {
		title: obj.title,
		start: new Date(obj.startYear, obj.startMonth- 1, obj.startDay, obj.startHours, obj.startMinutes),
		end: new Date(obj.endYear, obj.endMonth-1, obj.endDay, obj.endHours, obj.endMinutes),
		allDay: false
	}
}
function reserve(date){
	$('#myModal').modal('show');
	var year = date.getFullYear();
	var month = date.getMonth();
	var d = date.getDate();
	var hours = date.getHours();
	var minutes = date.getMinutes(); 
	$("#modalYear").html(year);
	$("#modalMonth").html(month+1);
	$("#modalDate").html(d);
	$("#modalHour").val(hours);
	if(minutes < 30){
		$("#modalMinute").val(0);
	}else{
		$("#modalMinute").val(30);
	}
	//$("#modalDate").html(getIntegerDate(date));
}
var date = new Date();
var d = date.getDate();
var m = date.getMonth();
var y = date.getFullYear();
var events = []
$('#calendar').fullCalendar({
	defaultView: 'agendaWeek',
	slotMinutes : 15,
	header: {
		left: 'title',
		right: 'prev,next today,month,agendaWeek,agendaDay'
	},
	editable: false,
	dayClick: function(date, allDay, jsEvent, view) {
		reserve(date);
	},
	 viewDisplay: function(view) {
	    $("#calendar").fullCalendar( 'removeEvents');
	 	getEvent(getIntegerDate(view.visStart),getIntegerDate(view.visEnd));
	 	$('.fc-widget-content').hover(function(){
			$(this).css("background","#F7FBFE");
		}, function(){
			$(this).css("background","")
		});
	 }
});
function getIntegerDate(date){
	var year = date.getFullYear();
    var month = date.getMonth()+1;
    var date = date.getDate();
    if(month < 10) month = "0"+month;
    if(date < 10) date = "0"+date;
    return year+""+month+""+date;
}
function getEvent(startDate, endDate){
	$.ajax({
		url : '${pageContext.request.contextPath}/concert/plan.json?startDate='+startDate+'&endDate='+endDate,
		dataType :'json',
		success :function(data){
			console.log(data.list);
			for(var i=0;i<data.list.length;i++){
				console.log(objToEvent(data.list[i]));
				//console.log(data.list[i])
				$('#calendar').fullCalendar( 'renderEvent', objToEvent(data.list[i]) );
			}
		}
	});
}

</script>
