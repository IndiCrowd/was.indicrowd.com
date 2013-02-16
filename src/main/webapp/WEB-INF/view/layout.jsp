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
							<li class="active"><a href="${pageContext.request.contextPath}">홈</a></li>
	              			
							<li ><a href="blog.html">블로그</a></li>
							<li >
								<sec:authorize access="isAnonymous()">
									<a href="${pageContext.request.contextPath}/signin">로그인</a>
								</sec:authorize>
								<sec:authorize access="isAuthenticated()">
									<a href="${pageContext.request.contextPath}/signout">로그아웃</a>
								</sec:authorize></li>
							<li ><a href="${pageContext.request.contextPath}/user/join">회원가입</a></li>
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
		<decorator:body />
	
	</div>
	<!-- end: Wrapper  -->			

	<!-- start: Footer -->
	<!-- 
	<div id="footer">
		
		<div class="container">
	
			
		
		</div>

	</div>
	 -->
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
