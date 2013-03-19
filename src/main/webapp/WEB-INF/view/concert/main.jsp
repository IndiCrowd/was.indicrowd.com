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
		<div class="perfectum">
			<div class="row-fluid sortable">
				<div class="box">
				  <div class="box-header" data-original-title>
					  
				  </div>
				  <div class="box-content">
					

						<div id="calendar"></div>

						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
		<table class="table">
			
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
<script>$(function(){
		calendars();
		var date = new Date();
		var hour = date.getHours();
		$(".fc-slot"+(hour*2)).focus();
	});</script>
