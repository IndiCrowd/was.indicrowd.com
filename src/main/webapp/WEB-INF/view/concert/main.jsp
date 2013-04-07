<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="<c:url value="/css/movingboxes.css"/>" rel="stylesheet" type="text/css">
<c:set var="minimalTop" value="99999"/>
<style>
	#timeTableDiv{
		height: 300px;
		overflow: auto;
		background-color: #FFFFFF
	}
	#timeTable .time{
		height: 120px;
		padding-top: 10px;
		text-align: center;
		color: #ffffff;
		font-size: 12px;
		text-align: center;
		margin: 0;
		width: 66px;
		font-weight: bold;
		background-color: #AFAFAF;
	}
	.timeTableTop{
		background-color: #4B5161;
		font-weight: bold;
		color: #FFFFFF;
	}
	.timeColumn {
		border:1px solid #a5a5a5;background:#E3ECFB; position: absolute;width:100%;cursor: pointer;
	}
</style>
<!--start: Wrapper-->
<div id="wrapper" class="row">
	<div class="span12">
		<div id="broadcast-slider">

			<div>
				<img src="${pageContext.request.contextPath }/img/band/dalis.jpg" width=200 height=150
					alt="picture">
				<h2>
					On Air! 42명 시청중 - <span>이상한 나라의 달리스</span>
				</h2>
			</div>

			<div>
				<img src="${pageContext.request.contextPath }/img/band/jrabbit.jpg"
					alt="picture">
				<h2>
					On Air! 63명 시청중 - <span>제이래빗</span>
				</h2>
			</div>

			<div>
				<img src="${pageContext.request.contextPath }/img/band/forest.jpg"
					alt="picture">
				<h2>
					On Air! 27명 시청중 - <span>숨의 숲</span>
				</h2>
			</div>

		</div>
		<div class="row">
		
			<h2 style="text-align: center"><- 2013/4/2 -></h2>
			<p><a href="<c:url value="/concert/reservate" />"><button class="btn btn-primary offset10">예약하기</button></a></p>
		
		<div class="span12">
		<c:set var="tableWidth" value="${1070/fn:length(command) }"/>
		<table id="timeTable" class="table table-bordered" style="margin-bottom:0px">
				<tr>
					<th class="timeTableTop" style="width:66px"></th>
					<!-- list of halls -->
					<c:forEach var="hall" items="${ command}">
						<th class="timeTableTop" style="text-align:center;width:${tableWidth}px"><c:out value="${hall.key }"/></th>
					</c:forEach>
					<th class="timeTableTop" style="width:19px;padding:0px"></th>
				</tr>
			</table>
		</div>
		<div class="span12" id="timeTableDiv" >
			
			<table id="timeTable" class="table table-bordered" style="margin-bottom: 0px">
				<c:forEach begin="0" end="23" varStatus="i">
					<tr>
						<td class="time span2"><c:if test="${i.index<10  }">0</c:if>${i.index }:00</td>
						<c:if test="${i.index eq 0 }">
							<c:forEach var="hall" items="${ command}">
								<td style="padding:0px;" rowspan="24">
									<div class="timeTableBox" style="position:relative; height:100%">
									<c:forEach var="concert" items="${hall.value }">
										
										<c:set var="top" value="${(concert.startHours + concert.startMinutes/60) * 139}"/>
										<c:if test="${minimalTop > top }"><c:set var="minimalTop" value="${top }"/></c:if>
										<div class ="timeColumn"  style="top:${top}px; height:${concert.duration/30*67.5 }px" onclick="goConcert(${concert.id})">
											<span class="timeColumnTime"><strong><c:if test="${concert.startHours < 10}">0</c:if>${concert.startHours}:<c:if test="${concert.startMinutes < 10}">0</c:if>${concert.startMinutes }</strong></span>
											<span>${concert.title }</span>
										</div>
									</c:forEach>
									</div>
								</td>
							</c:forEach>
						</c:if>
					</tr>
				</c:forEach>
			</table>
			
		</div>
		</div>
		<table  class="table">
			
			<c:forEach items="${command.list}" var="command">
				<tr>
					<td><a
						href="javascript:popup('<c:url value="/concert/${command.id}" />', 'Concert', 1000, 700);">${command.title}
							공연 보기</a> <br></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
</div>
<!--  end wrapper -->
<script src="<c:url value="/js/jquery.movingboxes.min.js" />"></script>
<script src="<c:url value="/js/broadcast-slider.js" />"></script>
<script>
//스크롤 위치 변경
	function moveScroll( nScroll)
	{
		if(nScroll!=99999){
	    	$("#timeTableDiv").scrollTop(nScroll);
		}
	}
	function popup(url, title, w, h) {
		var left = (screen.width / 2) - (w / 2);
		var top = (screen.height / 2) - (h / 2) - 40;
		return window
				.open(url,title,'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width='+ w+ ', height='+ h+ ', top='+ top+ ', left=' + left);
	}
	function goConcert(id){
		popup('<c:url value="/concert" />/'+id, 'Concert', 1000, 700);
	}
	
	$(function(){
		moveScroll(${minimalTop});
		
	});
</script>