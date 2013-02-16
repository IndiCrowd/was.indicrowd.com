<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<sec:authentication property="principal" var="principal" />

<!--start: Wrapper-->
		<div id="wrapper">
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
					<h3>This is a caption </h3>
				</div></li>

			<li><img src="img/slider/slider3.jpg" alt="" /></li>

		</ul>
	</div>
</div>
<!-- start: Row -->
<div class="row-fluid">

	<div class="span12">

		<!-- start: Team -->
		<div id="video-clip-gallary">


			<!-- start: Row -->
			<div class="row-fluid">

				<!-- start: About Member -->
				<div class="span3">
					<div class="widget">
						<div class="flex-video widescreen">
							<iframe src="http://www.youtube.com/embed/n7Q4_IWGlOs" width="480" height="256" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>	
						</div>
					</div>
					<div class="team-name">
						밴딩머신 <span> / Rock</span>
					</div>
					<p class="text-info"><a href="#">벤딩머신(Vending Machine) - SPR(Live)</a></p>
				</div>
				<!-- end: About Member -->

				<hr class="clean visible-phone">

				<!-- start: About Member -->
				<div class="span3">
					<div class="widget">
						<div class="flex-video widescreen">
							<iframe src="http://www.youtube.com/embed/FgAaUI6n44I" width="480" height="256" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>	
						</div>
					</div>
					<div class="team-name">
						딕펑스 <span> / Rock</span>
					</div>
					<p class="text-info"><a href="#">슈퍼스타K 4 - PSY_Gangnam Style with [Superstark4 10회] 딕펑스_"고추잠자리" @생방송 무대</a></p>
					
				</div>
				<!-- end: About Member -->

				<hr class="clean visible-phone">

				<!-- start: About Member -->
				<div class="span3">
					<div class="widget">
						<div class="flex-video widescreen">
							<iframe src="http://www.youtube.com/embed/x6VHNkwL-qw" width="480" height="256" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>	
						</div>
					</div>
					<div class="team-name">
						10cm <span> / Rock Folk</span>
					</div>
					<p class="text-info"><a href="#">10cm - Fine Thank You And You</a>
						</p>
					
				</div>
				<!-- end: About Member -->

				<hr class="clean visible-phone">

				<!-- start: About Member -->
				<div class="span3">
					<div class="widget">
						<div class="flex-video widescreen">
							<iframe src="http://www.youtube.com/embed/xrrpiApmMTQ" width="480" height="256" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>	
						</div>
					</div>
					<div class="team-name">
						브로콜리 너마저 <span> / Rock Folk</span>
					</div>
					<p class="text-info"><a href="#">문화콘서트 난장 브로콜리 너마저 - 앵콜요청금지</a>
						</p>
					
				</div>
				<!-- end: About Member -->

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