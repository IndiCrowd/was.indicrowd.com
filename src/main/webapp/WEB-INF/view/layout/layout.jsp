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
		<!--[if lt IE 8]>
		<script src="http://ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js"></script>
		<script type="text/javascript">window.attachEvent('onload',function(){CFInstall.check({mode:'overlay'})})</script>
		<![endif]-->
		<title>IndiCrowd :: <decorator:title /></title>
		
		<jsp:include page="../base-import.jsp" />
		
		<decorator:head />
		
	</head>
	
	<body>		
		<div class="perfectum">
		<div id="overlay" style="display:none;">
		<ul>
		  <li class="li1"></li>
		  <li class="li2"></li>
		  <li class="li3"></li>
		  <li class="li4"></li>
		  <li class="li5"></li>
		  <li class="li6"></li>
		</ul>
		</div>
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
					<a class="brand" href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath }/img/indicrowd.png" width="182px" height="45px"/></a>
	          		<div class="nav-collapse collapse pull-right">
	            		<ul class="nav">
							<li class="active"><a href="${pageContext.request.contextPath}">홈</a></li>
	              			<li class="active"><a href="${pageContext.request.contextPath}/concert">공연</a></li>
							<li class="active"><a href="${pageContext.request.contextPath}/band/home">밴드</a></li>
							<li class="active"><a href="${pageContext.request.contextPath}/fund/project/list">크라우드 펀딩</a></li>
							<li class="active"><a href="${pageContext.request.contextPath}/shop/list">상점</a></li>
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
								      <li class="active" ><a href="${pageContext.request.contextPath}/user/${principal.id}"><c:if test="${principal.socialImageUrl ne ''}"><img border="0" width="22" height="22" src="${principal.socialImageUrl }" /> </c:if>${principal.nickname }</a></li>
								      <c:forEach var="band" items="${principal.userBand }">
								      <!-- img url 썸네일 변환 후 url로 수정해줘야함. -->
								      <li class="active" ><a href="${pageContext.request.contextPath}/band/${band.id}"><c:if test="${band.imageFilePath ne ''}"><img border="0" width="22" height="22" src="${pageContext.request.contextPath}/img/band/${band.imageFilePath }" /> </c:if>${band.name }</a></li>
								      </c:forEach>
								    </ul>
								  </li>
								</ul>
								</li>
							</sec:authorize>
							
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
				<!-- <div class="span2">
					<div id="under-footer-logo">
						<a class="brand" href="#">IndiCrowd</a>
					</div>
				</div> -->
				<!-- end: Under Footer Logo -->

				<!-- start: Under Footer Copyright -->
				<div class="span5">
					
					<div id="under-footer-copyright">
						&copy; 2013, <a href="#">IndiCrowd</a>. all right reserved.
					</div>
					
				</div>
				<!-- end: Under Footer Copyright -->
				
				<div class="span6">
					
					<p id="under-footer-menu" class="pull-right">
						<a href="#">IndiCrowd 소개</a>
						<a href="#">도움말</a>
						<a href="#">이용약관</a>
						<a href="#">개인정보 보호정책</a>
						<a href="#">제안/문의하기</a>
					</p>
					
				</div>

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
