<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	function popup(url, title, w, h) {
		var left = (screen.width / 2) - (w / 2);
		var top = (screen.height / 2) - (h / 2) - 40;
		return window
				.open(
						url,
						title,
						'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width='
								+ w
								+ ', height='
								+ h
								+ ', top='
								+ top
								+ ', left=' + left);
	}
</script>
<!--start: Wrapper-->
<div id="wrapper" class="span12">
	<div class="span8">
	<!-- start: Flexslider -->
	<div id="main-slider" class="slider"
		style="max-width: 600px; text-align: center; margin-left: auto; margin-right: auto">
		<div id="flex1" class="flexslider home" style="">
			<ul class="slides">

				<li><img src="img/slider/slider1.jpg" alt="" />
					<div class="slide-caption n">
						<h3>This is a caption</h3>
					</div></li>

				<li><img src="img/slider/slider2.jpg" alt="" />
					<div class="slide-caption">
						<h3>This is a caption</h3>
					</div></li>

				<li><img src="img/slider/slider3.jpg" alt="" /></li>

			</ul>
		</div>
	</div>
	
	<table class="table">
	<tr><th>공연 목록</th></tr>
	<c:forEach items="${command.list}" var="command">
	<tr><td>
		<a
			href="javascript:popup('<c:url value="/concert/${command.id}" />', 'Concert', 1000, 700);">${command.title}
			공연 보기</a>
		<br>
	</td></tr>
	</c:forEach>
	</table>
	</div>
	<div class="span3">
	<a href="${pageContext.request.contextPath}/concert/create"><button class="btn btn-primary">방송하기!</button></a>
	</div>
</div>
<!--  end wrapper -->
