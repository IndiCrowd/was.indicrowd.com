<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<c:url value="/css/movingboxes.css"/>" rel="stylesheet" type="text/css">
<script>
	function popup(url, title, w, h) {
		var left = (screen.width / 2) - (w / 2);
		var top = (screen.height / 2) - (h / 2) - 40;
		return window
				.open(url,title,'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width='+ w+ ', height='+ h+ ', top='+ top+ ', left=' + left);
	}
</script>
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
</style>
<!--start: Wrapper-->
<div id="wrapper" class="row">
	<div class="span9">
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
		<div class="span9 perfectum" id="timeTableDiv" >
			<h2 style="text-align: center"><- 2013/4/2 -></h2>
			
			<table id="timeTable" class="table table-bordered">
				<tr>
					<th></th>
					<!-- list of halls -->
					<th>연습실</th>
				</tr>
				<c:forEach begin="0" end="23" varStatus="i">
					<tr>
						<td class="time span2"><c:if test="${i.index<10  }">0</c:if>${i.index }:00</td>
						<td>aaa</td>
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
	<div class="span2">
		<a href="${pageContext.request.contextPath}/concert/reservate"><button
				class="btn btn-primary">방송하기!</button></a>
		
	</div>
</div>
<!--  end wrapper -->
<script src="<c:url value="/js/jquery.movingboxes.min.js" />"></script>
<script src="<c:url value="/js/broadcast-slider.js" />"></script>

