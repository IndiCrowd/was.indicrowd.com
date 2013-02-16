<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<sec:authentication property="principal" var="principal" />

			
			<!-- start: Flexslider -->
			<div class="slider">
				<div id="flex1" class="flexslider home">
					<ul class="slides">

						<li>
							<img src="img/slider/slider1.jpg" alt="" />
							<div class="slide-caption n">
								<h3>This is a caption</h3>
							</div>
						</li>

						<li>
							<img src="img/slider/slider2.jpg" alt="" />
							<div class="slide-caption">
								<h3>This is a caption</h3>
							</div>
						</li>

						<li>
							<img src="img/slider/slider3.jpg" alt="" />
						</li>

					</ul>
				</div>
			</div>
			<!-- end: Flexslider -->
		
