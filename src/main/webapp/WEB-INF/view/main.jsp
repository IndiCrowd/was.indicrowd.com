<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sec:authentication property="principal" var="principal" />

<link href="<c:url value="/css/movingboxes.css"/>" rel="stylesheet" type="text/css">
<!--start: Wrapper-->
<div id="wrapper">
	<div id="broadcast-slider">

		<div>
			<img src="${pageContext.request.contextPath }/img/band/dalis.jpg"
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
	<!-- start: Row -->
	<div class="row-fluid">

		<div class="span12">

			<!-- start: Team -->

			<div id="video-clip-gallary">


				<!-- start: Row -->

				<div class="row-fluid">
					<div class="span3">
						<div class="widget">
							<div class="flex-video widescreen">
								<iframe src="http://www.youtube.com/embed/n7Q4_IWGlOs"
									width="480" height="256" frameborder="0" webkitAllowFullScreen
									mozallowfullscreen allowFullScreen></iframe>
							</div>
						</div>
						<div class="team-name">
							밴딩머신 <span> / Rock</span>
						</div>
						<p class="text-info">
							<a href="#">벤딩머신(Vending Machine) - SPR(Live)</a>
						</p>
					</div>

					<hr class="clean visible-phone">
					<div class="span3">
						<div class="widget">
							<div class="flex-video widescreen">
								<iframe src="http://www.youtube.com/embed/FgAaUI6n44I"
									width="480" height="256" frameborder="0" webkitAllowFullScreen
									mozallowfullscreen allowFullScreen></iframe>
							</div>
						</div>
						<div class="team-name">
							딕펑스 <span> / Rock</span>
						</div>
						<p class="text-info">
							<a href="#">슈퍼스타K 4 - PSY_Gangnam Style with [Superstark4
								10회] 딕펑스_"고추잠자리" @생방송 무대</a>
						</p>

					</div>

					<hr class="clean visible-phone">

					<div class="span3">
						<div class="widget">
							<div class="flex-video widescreen">
								<iframe src="http://www.youtube.com/embed/x6VHNkwL-qw"
									width="480" height="256" frameborder="0" webkitAllowFullScreen
									mozallowfullscreen allowFullScreen></iframe>
							</div>
						</div>
						<div class="team-name">
							10cm <span> / Rock Folk</span>
						</div>
						<p class="text-info">
							<a href="#">10cm - Fine Thank You And You</a>
						</p>

					</div>

					<hr class="clean visible-phone">

					<div class="span3">
						<div class="widget">
							<div class="flex-video widescreen">
								<iframe src="http://www.youtube.com/embed/xrrpiApmMTQ"
									width="480" height="256" frameborder="0" webkitAllowFullScreen
									mozallowfullscreen allowFullScreen></iframe>
							</div>
						</div>
						<div class="team-name">
							브로콜리 너마저 <span> / Rock Folk</span>
						</div>
						<p class="text-info">
							<a href="#">문화콘서트 난장 브로콜리 너마저 - 앵콜요청금지</a>
						</p>

					</div>

					<hr class="clean visible-phone">

				</div>
				<!-- end: Row -->

			</div>
			<!-- end: Team -->

		</div>

	</div>
	<!-- end: Row -->
	<!-- end: Flexslider -->

</div>
<!--  end wrapper -->

<script src="<c:url value="/js/jquery.movingboxes.min.js" />"></script>
<script src="<c:url value="/js/broadcast-slider.js" />"></script>
