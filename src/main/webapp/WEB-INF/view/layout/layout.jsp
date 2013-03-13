<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<sec:authentication property="principal" var="principal" />

<!DOCTYPE html>

<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
		<!--[if IE]>
		<script src="http://ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js"></script>
		<script type="text/javascript">window.attachEvent('onload',function(){CFInstall.check({mode:'overlay'})})</script>
		<![endif]-->
		<title>IndiCrowd :: <decorator:title /></title>
		
		<jsp:include page="../base-import.jsp" />
		
		<decorator:head />
		
	</head>
	
	<body>
		<div class="perfectum">
		<div  id="overlay"><ul>
		  <li class="li1"></li>
		  <li class="li2"></li>
		  <li class="li3"></li>
		  <li class="li4"></li>
		  <li class="li5"></li>
		  <li class="li6"></li>
		</ul></div>
		</div>
		
		<!--start: Header -->
	<header>
		
		<!--start: Container -->
		<div class="container" style="height:54px;">
			
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
	              			<li class="active"><a href="${pageContext.request.contextPath}/concert">공연</a></li>
							<li class="active"><a href="${pageContext.request.contextPath}/band/home">밴드</a></li>
							<li class="active">
								<sec:authorize access="isAnonymous()">
									<a href="${pageContext.request.contextPath}/signin">로그인</a>
								</sec:authorize>
								<sec:authorize access="isAuthenticated()">
									<a href="${pageContext.request.contextPath}/signout">로그아웃</a>
								</sec:authorize></li>
							<sec:authorize access="isAnonymous()">
								<li class="active" ><a href="${pageContext.request.contextPath}/user/join">회원가입</a></li>
							</sec:authorize>
							<sec:authorize access="isAuthenticated()">
								<li class><ul class="nav nav-pills">
								  <li class="active dropdown">
								  	<a class="dropdown-toggle"
								       data-toggle="dropdown"
								       href="#" >
								    <c:if test="${principal.socialImageUrl ne ''}"><img width="22" height="22" border="0" src="${principal.socialImageUrl }" /> </c:if>${principal.nickname }<b class="caret"></b></a>
								  	<ul class="dropdown-menu">
								      <li class="active" ><a href="#"><c:if test="${principal.socialImageUrl ne ''}"><img border="0" width="22" height="22" src="${principal.socialImageUrl }" /> </c:if>${principal.nickname }</a></li>
								      <c:forEach var="band" items="${principal.userBand }">
								      <!-- img url 썸네일 변환 후 url로 수정해줘야함. -->
								      <li class="active" ><a href="${pageContext.request.contextPath}/band/${band.id}"><c:if test="${band.imageFilePath ne ''}"><img border="0" width="22" height="22" src="${pageContext.request.contextPath}/img/band/${band.imageFilePath }" /> </c:if>${band.name }</a></li>
								      </c:forEach>
								    </ul>
								  </li>
								</ul>
								</li>
							</sec:authorize>
							<div class="perfectum" style="float:left">
							<li class="dropdown hidden-phone">
							<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
								<i class="icon-tasks icon-white"></i> <span class="label label-warning hidden-phone">17</span>
							</a>
							<ul class="dropdown-menu tasks">
								<li>
									<span class="dropdown-menu-title">You have 17 tasks in progress</span>
                            	</li>
								<li>
                                    <a href="#">
										<span class="header">
											<span class="title">iOS Development</span>
											<span class="percent"></span>
										</span>
                                        <div class="taskProgress progressSlim progressYellow">80</div> 
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
										<span class="header">
											<span class="title">Android Development</span>
											<span class="percent"></span>
										</span>
                                        <div class="taskProgress progressSlim progressYellow">47</div> 
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
										<span class="header">
											<span class="title">Django Project For Google</span>
											<span class="percent"></span>
										</span>
                                        <div class="taskProgress progressSlim progressYellow">32</div> 
                                    </a>
                                </li>
								<li>
                                    <a href="#">
										<span class="header">
											<span class="title">SEO for new sites</span>
											<span class="percent"></span>
										</span>
                                        <div class="taskProgress progressSlim progressYellow">63</div> 
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
										<span class="header">
											<span class="title">New blog posts</span>
											<span class="percent"></span>
										</span>
                                        <div class="taskProgress progressSlim progressYellow">80</div> 
                                    </a>
                                </li>
								<li>
                            		<a class="dropdown-menu-sub-footer">View all tasks</a>
								</li>	
							</ul>
						</li>
						</div>
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
		<jsp:include page="../script-import.jsp" />
	</body>
	
</html>
