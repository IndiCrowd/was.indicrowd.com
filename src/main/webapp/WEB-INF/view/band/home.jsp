<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<sec:authentication property="principal" var="principal" />

<!-- start: Page Title -->
		<div id="page-title">

			<h2>밴드</h2>
	
		</div>
		<!-- end: Page Title -->
				
		<!--start: Wrapper-->
		<div id="wrapper">
					
			<!--start: Row -->
			<div class="row-fluid">
			
				<div class="posts span8">

					<!-- start: Post -->
					<div class="post first">
						<div class="picture">
							<a href="post.html"><img src="${pageContext.request.contextPath}/img/car.jpg" alt="" /></a>
						</div>
						<div class="info">
							<span class="post-date">
								<span class="day">1</span>
								<span class="month-year">June, 2012</span>
							</span>
							<span class="post-icon standard"><i class="fa-icon-pencil"></i></span>
						</div>	
						<div class="post-content">
							<div class="post-title">
								<h2><a href="post.html">Post title</a></h2>
							</div>
							<div class="post-meta">
								<span><i class="fa-icon-user"></i>By <a href="#">lucas</a></span> 
								<span><i class="fa-icon-comments-alt"></i>With <a href="#">89 comments</a></span>
							</div>
							<div class="post-description">
								<p>
									Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.
								</p>
							</div>
							<a class="post-entry" href="post.html">Read More...</a>
						</div>
					</div>
					<!-- end: Post -->

					<!-- start: Post -->
					<div class="post">
						<div class="flex-video widescreen">
							<iframe src="http://player.vimeo.com/video/47995280?portrait=0&color=ffffff" width="500" height="281" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>
						</div>
						<div class="info">
							<span class="post-date">
								<span class="day">1</span>
								<span class="month-year">June, 2012</span>
							</span>
							<span class="post-icon standard"><i class="fa-icon-film"></i></span>
						</div>
						<div class="post-content">
							<div class="post-title">
								<h2><a href="post.html">Video Post</a></h2>
							</div>
							<div class="post-meta">
								<span><i class="fa-icon-user"></i>By <a href="#">lucas</a></span> 
								<span><i class="fa-icon-comments-alt"></i>With <a href="#">89 comments</a></span>
							</div>
							<div class="post-description">
								<p>
									Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.
								</p>
							</div>
							<a class="post-entry" href="post.html">Read More...</a>
						</div>
					</div>
					<!-- end: Post -->

					<!-- start: Post -->
					<div class="post last">

						<!-- start: Flexslider -->
						<div class="slider">
							<div id="flex1" class="flexslider">
								<ul class="slides">

									<li><div class="picture"><img src="${pageContext.request.contextPath}/img/slider/slider1.jpg" alt="" /></div></li>

									<li><div class="picture"><img src="${pageContext.request.contextPath}/img/slider/slider2.jpg" alt="" /></div></li>

									<li><div class="picture"><img src="${pageContext.request.contextPath}/img/slider/slider3.jpg" alt="" /></div></li>

								</ul>
							</div>
						</div>
						<!-- end: Flexslider -->

						<div class="clear"></div>

						<div class="info">
							<span class="post-date">
								<span class="day">1</span>
								<span class="month-year">June, 2012</span>
							</span>
							<span class="post-icon standard"><i class="fa-icon-camera-retro"></i></span>
						</div>
						<div class="post-content">
							<div class="post-title">
								<h2><a href="post.html">Picture Gallery</a></h2>
							</div>
							<div class="post-meta">
								<span><i class="fa-icon-user"></i>By <a href="#">lucas</a></span> 
								<span><i class="fa-icon-comments-alt"></i>With <a href="#">89 comments</a></span>
							</div>
							<div class="post-description">
								<p>
									Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.
								</p>
							</div>
							<a class="post-entry" href="post.html">Read More...</a>
						</div>
					</div>
					<!-- end: Post -->

					<ul class="pagination">
						<a href="#"><li></li></a>
						<a href="#"><li></li></a>
						<a href="#"><li></li></a>
						<a href="#"><li></li></a>
						<a href="#"><li class="current"></li></a>
						<a href="#"><li></li></a>
						<a href="#"><li></li></a>
						<a href="#"><li></li></a>
						<a href="#"><li></li></a>
						<a href="#"><li></li></a>
						<a href="#"><li></li></a>
						<a href="#"><li></li></a>
						<a href="#"><li></li></a>
					</ul>

				</div>

				<!-- start: Sidebar -->

				<div class="sidebar span4 hidden-phone">
					
					<!-- start: Text Widget -->
					<div class="widget first">
						<h3>Text Widget</h3>
						<p>
							Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.
						</p>
					</div>
					<!-- end: Text Widget -->
					
					<!-- start: Video Widget -->
					<div class="widget">
						<div class="title"><h3>Video Widget</h3></div>
						<div class="flex-video widescreen">
							<iframe src="http://player.vimeo.com/video/47995280?portrait=0&color=ffffff" width="182" height="105" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>	
						</div>
					</div>
					<!-- end: Video Widget -->

					<!-- start: Popular Photos -->
					<div class="widget">
						<div class="title"><h3>Popular Photos</h3></div>

						<div class="flickr-widget">
							<script type="text/javascript" src="http://www.flickr.com/badge_code_v2.gne?count=9&display=latest&size=s&layout=x&source=user&user=29609591@N08"></script>
							<div class="clear"></div>
						</div>

					</div>
					<!-- end: Popular Photos -->

					<!-- start: Sidebar Menu -->
					<div class="widget">
						<div class="title"><h3>Menu</h3></div>
						<ul class="links-list-alt">
							<li><a href="index.html">Home</a></li>
							<li><a href="contact.html">Contact</a></li>
							<li><a href="post.html">Single Post</a></li>
							<li><a href="about.html">About Us</a></li>
							<li><a href="pricing.html">Pricing Tables</a></li>
						</ul>
					</div>
					<!-- end: Sidebar Menu -->
					<!-- start: Tags -->
					<div class="widget last">
						<div class="title"><h3>Tags</h3></div>
						<div class="tags">
							<a href="#">Tag1</a>
							<a href="#">Tag2</a>
							<a href="#">Tag3</a>
							<a href="#">Tag4</a>
							<a href="#">Tag5</a>
							<a href="#">Tag6</a>
							<a href="#">Tag7</a>
							<a href="#">Tag8</a>
							<a href="#">Tag9</a>
							<a href="#">Tag10</a>
							<a href="#">Tag11</a>
							<a href="#">Tag12</a>
						</div>
					</div>
					<!-- end: Tags -->

				</div>
				<!-- end: Sidebar -->
			
			<!--end: Row -->
			</div>
	
		</div>
		<!-- end: Wrapper  -->