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
		<div style="filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#3c3c3c', endColorstr='#272727',GradientType=0 ); /* IE6-8 */">
		<div class="container" style="height:54px; ">
			
			<!--start: Navigation -->
			<div class="navbar navbar-inverse">
	    		<div class="navbar-inner">
	          		<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
	            		<span class="icon-bar"></span>
	            		<span class="icon-bar"></span>
	            		<span class="icon-bar"></span>
	          		</a>
					<a class="brand" href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath }/img/indicrowd.png" style ="width:182px; height:25px"/></a>
					
					<div id="sns-share" class="pull-left">
						<!-- AddThis Button BEGIN -->
						<div class="addthis_toolbox addthis_default_style "
									addthis:url="http://www.indicrowd.com"
							        addthis:title="IndiCrowd :: 세계최초 온라인 콘서트 서비스"
							        addthis:description="인디 문화 부흥을 위한 세계최초 온라인 콘서트 서비스">
						<a class="addthis_button_facebook_like" fb:like:layout="button_count"></a>
						<a class="addthis_button_tweet"></a>
						</div>
						<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=xa-51616d3b39a084e5"></script>
						<!-- AddThis Button END -->
					</div>

	          		<div class="nav-collapse collapse pull-right">
	            		<ul class="nav">
							<li class="active"><a href="${pageContext.request.contextPath}">홈</a></li>
	              			<li class="active"><a href="${pageContext.request.contextPath}/concert">공연</a></li>
							<li class="active"><a href="${pageContext.request.contextPath}/band/home">밴드</a></li>
							<li class="active"><a href="${pageContext.request.contextPath}/fund/project/list">크라우드 펀딩</a></li>
							<li class="active"><a href="${pageContext.request.contextPath}/item/list">상점</a></li>
							<sec:authorize access="isAnonymous()">
								<li class="active"><a href="${pageContext.request.contextPath}/signin">로그인</a></li>
							</sec:authorize>
							<sec:authorize access="isAnonymous()">
								<li class="active" ><a href="${pageContext.request.contextPath}/user/join">회원가입</a></li>
							</sec:authorize>
							<sec:authorize access="isAuthenticated()">
								<li class><ul class="nav nav-pills">
								  <li class="active dropdown">
								  	<a class="dropdown-toggle"
								       data-toggle="dropdown"
								       href="#" >
								    <c:if test="${principal.socialImageUrl ne ''}"><img style="width:22px;height:22px" border="0" src="${principal.socialImageUrl }" /> </c:if>${principal.nickname.length() > 6 ? principal.nickname.substring(0, 6).concat('...') : principal.nickname }<b class="caret"></b></a>
								  	<ul class="dropdown-menu">
								      <li class="active" ><a href="${pageContext.request.contextPath}/user/${principal.id}"><c:if test="${principal.socialImageUrl ne ''}"><img border="0" style="width:22px;height:22px" src="${principal.socialImageUrl }" /> </c:if>${principal.nickname }</a></li>
								      <c:forEach var="band" items="${principal.userBand }">
								      <!-- img url 썸네일 변환 후 url로 수정해줘야함. -->
								      <li class="active" ><a href="${pageContext.request.contextPath}/band/${band.id}"><c:if test="${band.imageFilePath ne ''}"><img border="0" style="width:22px;height:22px" src="${pageContext.request.contextPath}/img/band/${band.imageFilePath }" /> </c:if>${band.name }</a></li>
								      </c:forEach>
									  <li style="border-top: 1px solid #ccc;"><a href="${pageContext.request.contextPath}/signout">로그아웃</a></li>
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
		</div>
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
						<a href="${pageContext.request.contextPath}/about">IndiCrowd 소개</a>
						<a href="${pageContext.request.contextPath}/help">도움말</a>
						<a href="${pageContext.request.contextPath}/terms">이용약관</a>
						<a href="${pageContext.request.contextPath}/policy">개인정보 보호정책</a>
						<a href="${pageContext.request.contextPath}/contact">제안/문의하기</a>
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
