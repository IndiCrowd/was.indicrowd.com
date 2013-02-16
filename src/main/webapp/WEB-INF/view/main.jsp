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
					<h3>This is a caption</h3>
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
							<iframe src="http://player.vimeo.com/video/47995280?portrait=0&color=ffffff" width="480" height="256" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>	
						</div>
					</div>
					<div class="team-name">
						Lucas Luck <span> / Co-Founder, CEO</span>
					</div>
					<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,</p>
				</div>
				<!-- end: About Member -->

				<hr class="clean visible-phone">

				<!-- start: About Member -->
				<div class="span3">
					<div class="widget">
						<div class="flex-video widescreen">
							<iframe src="http://player.vimeo.com/video/47995280?portrait=0&color=ffffff" width="480" height="256" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>	
						</div>
					</div>
					<div class="team-name">
						Lucas Luck <span> / Co-Founder</span>
					</div>
					<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
						</p>
					
				</div>
				<!-- end: About Member -->

				<hr class="clean visible-phone">

				<!-- start: About Member -->
				<div class="span3">
					<div class="widget">
						<div class="flex-video widescreen">
							<iframe src="http://player.vimeo.com/video/47995280?portrait=0&color=ffffff" width="480" height="256" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>	
						</div>
					</div>
					<div class="team-name">
						Lucas Luck <span> / Co-Founder</span>
					</div>
					<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
						</p>
					
				</div>
				<!-- end: About Member -->

				<hr class="clean visible-phone">

				<!-- start: About Member -->
				<div class="span3">
					<div class="widget">
						<div class="flex-video widescreen">
							<iframe src="http://player.vimeo.com/video/47995280?portrait=0&color=ffffff" width="480" height="256" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>	
						</div>
					</div>
					<div class="team-name">
						Lucas Luck <span> / Co-Founder</span>
					</div>
					<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
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