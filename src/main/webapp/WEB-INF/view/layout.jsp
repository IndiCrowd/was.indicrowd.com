<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<sec:authentication property="principal" var="principal" />

<!DOCTYPE html>

<html>

	<head>
		<meta charset="utf-8">
		<title>IndiCrowd :: <decorator:title /></title>
		
		<jsp:include page="base-import.jsp" />
		
		<decorator:head />
		
	</head>
	
	<body>
		
		
		<!--start: Header -->
	<header>
		
		<!--start: Container -->
		<div class="container">
			
			<!--start: Navigation -->
			<div class="navbar navbar-inverse">
	    		<div class="navbar-inner">
	          		<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
	            		<span class="icon-bar"></span>
	            		<span class="icon-bar"></span>
	            		<span class="icon-bar"></span>
	          		</a>
					<a class="brand" href="${pageContext.request.contextPath}">IndiCrowd</a>
	          		<div class="nav-collapse collapse">
	            		<ul class="nav">
							<li class="active"><a href="${pageContext.request.contextPath}">Home</a></li>
	              			<li ><a href="about.html">About</a></li>
							<li class="dropdown">
	                			<a href="#" class="dropdown-toggle" data-toggle="dropdown">Features<b class="caret"></b></a>
	                			<ul class="dropdown-menu">
	                  				<li><a href="social-icons.html">Social Icons</a></li>
									<li><a href="icons.html">Glyphicons Halflings</a></li>
									<li><a href="icons-pro.html">Glyphicons PRO</a></li>
									<li><a href="icons_set2.html">Font Awesome Icons</a></li>
									<li><a href="typography.html">Typography</a></li>
									<li><a href="shortcodes.html">Shortcodes</a></li>
									<li><a href="list-styles.html">List Styles</a></li>
									<li><a href="charts.html">Charts</a></li>
									<li><a href="sliders.html">Sliders</a></li>
	                			</ul>
	              			</li>
							<li ><a href="portfolio.html">Portfolio</a></li>									
							<li ><a href="pricing.html">Pricing</a></li>
							<li ><a href="blog.html">Blog</a></li>
	              			<li ><a href="contact.html">Contact</a></li>
							<li >
								<sec:authorize access="isAnonymous()">
									<a href="${pageContext.request.contextPath}/signin">Sign in</a>
								</sec:authorize>
								<sec:authorize access="isAuthenticated()">
									<a href="${pageContext.request.contextPath}/signout">Sign out</a>
								</sec:authorize></li>
							<li ><a href="${pageContext.request.contextPath}/user/join">Register</a></li>
	            		</ul>
	          		</div>
	        	</div>
	      	</div>	
			<!--end: Navigation -->
			
		</div>
		<!--end: Container-->			
			
	</header>
	<!--end: Header-->
	<!--start: Container -->
	<div class="container">
				
		<!--start: Wrapper-->
		<div id="wrapper">
		
			<div id="content-wrapper">
				<decorator:body />
			</div>
		</div>
		<!--end: Container-->
	
	</div>
	<!-- end: Wrapper  -->			

	<!-- start: Footer -->
	<div id="footer">
		
		<!-- start: Container -->
		<div class="container">
	
			<!-- start: Row -->
			<div class="row-fluid">

				<!-- start: About -->
				<div class="span3">
					
					<h3>creativeLabs</h3>

					<p>
						<i class="fa-icon-map-marker"></i> 30 South Park Avenue
					</p>
					<p>	
						<i class="fa-icon-map-marker"></i> San Francisco, CA 94108, USA
					</p>	
					<p>	
						<i class="fa-icon-phone"></i> Phone: (123) 456-7890
					</p>
					<p>	
						<i class="fa-icon-print"></i> Fax: +08 (123) 456-7890
					</p>
					<p>
						<i class="fa-icon-envelope"></i> Email: contact@companyname.com
					</p>
					<p>
						<i class="fa-icon-globe"></i> Web: companyname.com
					</p>
						
				</div>
				<!-- end: About -->

				<!-- start: Latest Tweets -->
				<div class="span3">
					
					<h3>Latest Tweets</h3>
					
					<ul id="twitter">
						
					</ul>

					<div class="clear"></div>
					
					
				</div>
				<!-- end: Latest Tweets -->

				
				<!-- end: Photo Stream -->
				
				<!-- start: Follow Us -->
				<div class="span3">
					
					<h3>Follow Us</h3>
					
					<a href="#" class="social-dribbble"></a>
					<a href="#" class="social-twitter"></a>
					<a href="#" class="social-flickr"></a>
					<a href="#" class="social-facebook"></a>
					<a href="#" class="social-linkedin"></a>
					<a href="#" class="social-vimeo"></a>
					<a href="#" class="social-youtube"></a>
					<a href="#" class="social-delicious"></a>
					<a href="#" class="social-rss"></a>
					<a href="#" class="social-picassa"></a>
					<a href="#" class="social-deviantart"></a>
					<a href="#" class="social-technorati"></a>
					<a href="#" class="social-stumbleupon"></a>
					<a href="#" class="social-appstore"></a>
					<a href="#" class="social-paypal"></a>
					<a href="#" class="social-myspace"></a>
					<a href="#" class="social-pinterest"></a>
					<a href="#" class="social-soundcloud"></a>
					<a href="#" class="social-behance"></a>
					<a href="#" class="social-instagram"></a>
					<a href="#" class="social-googleplus"></a>
	
				</div>
				<!-- end: Follow Us -->
				
			</div>
			<!-- end: Row -->
		
		</div>
		<!-- end: Container  -->	

	</div>
	<!-- end: Footer -->
	
	<!-- start: Under Footer -->
	<div id="under-footer">
		
		<!-- start: Container -->
		<div class="container">
			
			<!-- start: Row -->
			<div class="row-fluid">

				<!-- start: Under Footer Logo -->
				<div class="span2">
					<div id="under-footer-logo">
						<a class="brand" href="#">IndiCrowd</a>
					</div>
				</div>
				<!-- end: Under Footer Logo -->

				<!-- start: Under Footer Copyright -->
				<div class="span9">
					
					<div id="under-footer-copyright">
						&copy; 2013, <a href="#">IndiCrowd</a>. all right reserved.
					</div>
					
				</div>
				<!-- end: Under Footer Copyright -->

				<!-- start: Under Footer Back To Top -->
				<div class="span1">
						
					<div id="under-footer-back-to-top">
						<a href="#"></a>
					</div>
				
				</div>
				<!-- end: Under Footer Back To Top -->
			
			</div>
			<!-- end: Row -->
			
		</div>	
		<!-- end: Container  -->
		
	</div>
	<!-- end: Under Footer -->	
		
		
		<!-- load script after page rendered for performance -->
		<jsp:include page="script-import.jsp" />
	</body>
	
</html>
