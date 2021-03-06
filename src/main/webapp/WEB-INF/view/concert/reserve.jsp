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
					<form:form id="reserveForm" cssClass="form-horizontal" enctype="multipart/form-data">
						<form:hidden path="hallId" value="1" />
						<form:hidden path="bandId" value="${principal.userBand[0].id}" />
						<fieldset>
							<div class="control-group">
								<div class="controls">
									<div class="use-preview">
										<img style="max-width: 100%;" src="<spring:eval expression="@userfileConfig.baseUrl" />/img/blankconcert.jpg">
										<h5>프로필 사진 등록</h5>
										<p>(사진파일 500KB 이하)</p>
										<form:input type="file" path="photo" />
										<spring:bind path="photo"><p class="error">${status.errorMessage}</p></spring:bind>
									</div>
								</div>
							</div>
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
														<img id="bandImage" border="0" style="width:22px ;height:22px"
															src="<spring:eval expression="@userfileConfig.baseUrl" />/bandthumb/${principal.userBand[0].id }" />
													</c:if><span id="bandName">${principal.userBand[0].name }</span><b class="caret"></b></a>
												<ul class="dropdown-menu">
													<c:forEach var="band" items="${principal.userBand }">
														<li class="active"><a href="javascript:changeBand('${band.id }','${band.imageFilePath }','${band.name }'); void(0)">
																<c:if test="${band.imageFilePath ne ''}">
																	<img border="0" style="width:22px ;height:22px"
																		src="<spring:eval expression="@userfileConfig.baseUrl" />/bandthumb/${band.id }" />
																</c:if>${band.name }</a></li>
													</c:forEach>
												</ul></li>
										</ul>
									</div>
								</div>
							</c:if>
							
							<div class="control-group <spring:bind path="description"><c:if test="${not empty status.errorMessage}">error</c:if></spring:bind>">
								<label class="control-label" for="description">공연 소개</label>
								<div class="controls">
									<form:textarea path="description" cssClass="input-xxlarge" rows="6" />
									<form:errors path="description" cssClass="help-inline" />
								</div>
							</div>
							<form:hidden path="startDate"  />
							<form:hidden path="startHours"  />
							<form:hidden path="startMinutes"  />
								
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
									 <form:input path="duration" readonly="true" cssStyle="text-align:right; " />분
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
								<p>* 공연이 끝난 이후, 리플레이 기능을 위해 유튜브에 영상이 등록될 수 있습니다.</p> 
								<p>* 공연일정을 변경하고자 하는 경우, 인디크라우드(indicrowd@gmail.com)로 연락바랍니다.</p> 
								<button type="button" id="reserveSubmit" class="btn btn-primary">공연 예약!</button>
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
  	<input type="hidden" id="modalStartDate"/>
    <p ><span id="modalYear" ></span>년 <span id="modalMonth"></span>월 <span id="modalDate"></span>일  
    	<select class="span1" id="modalHours">
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
    	<select class="span1" id="modalMinutes">
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
  	<button id="modalSubmit" class="btn btn-primary">선택</button>
    <button class="btn" data-dismiss="modal" aria-hidden="true">닫기</button>
    
  </div>
</div>
<script src="<c:url value="/js/fullcalendar.min.js" />"></script>
<script>
function changeBand(id, imagePath, name){
	$("#bandId").val(id);
	$("#bandImage").attr("src","${pageContext.request.contextPath}/img/band/"+imagePath);
	$("#bandName").html(name);
}
$(function(){
	
	if ($("#startDate")!=""){
		insertNewEvent();
	}
	
	$("#reserveSubmit").click(function(){
		//validate
		var duration = $("#duration").val();
		var startDate = $("#startDate").val();
		var startHours = $("#startHours").val();
		var startMinutes= $("#startMinutes").val();
		if(duration == "" || startDate =="" || startHours == "" || startMinutes ==""){
			alert('달력에서 공연할 날짜와 시간을 선택해주세요!')
		}else{
			$("#reserveForm").submit();
		}
		
	});
	$("#modalSubmit").click(function(){
		//validate
		var duration = $("#modalDuration").val();
		var startDate = $("#modalStartDate").val();
		var startHours = $("#modalHours").val();
		var startMinutes = $("#modalMinutes").val();
		$.get('${pageContext.request.contextPath}/concert/reserve/validateTime',
				{startDate:startDate, startHours:startHours, startMinutes:startMinutes, duration:duration}, 
				function(data){ 
					if(data){
						//insert
						$("#duration").val(duration);
						$("#startDate").val(startDate);
						$("#startHours").val(startHours);
						$("#startMinutes").val(startMinutes);
						
						insertNewEvent();
						$("#myModal").modal('hide');
					}else{
						alert('공연 시작 30분 이상 남아있거나, 다른공연과  겹치지 않아야 예약 가능합니다.');
					}
				}
				);
		
	});
});

function insertNewEvent(){
	var year = $("#startDate").val()/10000;
	var month = $("#startDate").val()/100%100 -1;
	var d = $("#startDate").val()%100;
	
	var title = $("#title").val() == '' ? '새로운 예약' : $("#title").val();
	$('#calendar').fullCalendar( 'removeEvents', 1);
	$('#calendar').fullCalendar( 'renderEvent', { 
		id: 1,
		title: title,
		start: new Date(year,month,d,$("#startHours").val(),$("#startMinutes").val()),
		end: new Date(year,month,d,$("#startHours").val(),$("#startMinutes").val()*1+$("#duration").val()*1),
		allDay:false,
		backgroundColor: '#f9a022',
		borderColor : '#f9a022'
	} );
}
function objToEvent(obj){
	return {
		title: obj.title,
		start: new Date(obj.startYear, obj.startMonth- 1, obj.startDay, obj.startHours, obj.startMinutes),
		end: new Date(obj.endYear, obj.endMonth-1, obj.endDay, obj.endHours, obj.endMinutes),
		allDay: false
	};
}
function reserve(date){
	$('#myModal').modal('show');
	$("#modalStartDate").val(getIntegerDate(date));
	var year = date.getFullYear();
	var month = date.getMonth();
	var d = date.getDate();
	var hours = date.getHours();
	var minutes = date.getMinutes(); 
	$("#modalYear").html(year);
	$("#modalMonth").html(month+1);
	$("#modalDate").html(d);
	$("#modalHours").val(hours);
	if(minutes < 30){
		$("#modalMinutes").val(0);
	}else{
		$("#modalMinutes").val(30);
	}
}

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
			$(this).css("background","");
		});
	 }
});
function getIntegerDate(date){
	var year = date.getFullYear();
    var month = date.getMonth()+1;
    var d = date.getDate();
    if(month < 10) month = "0"+month;
    if(d < 10) d = "0"+d;
    return year+""+month+""+d;
}
function getEvent(startDate, endDate){
	$.ajax({
		url : '${pageContext.request.contextPath}/concert/plan.json?startDate='+startDate+'&endDate='+endDate,
		dataType :'json',
		success :function(data){
			//console.log(data.list);
			for(var i=0;i<data.list.length;i++){
				$('#calendar').fullCalendar( 'renderEvent', objToEvent(data.list[i]) );
			}
		}
	});
}

</script>
