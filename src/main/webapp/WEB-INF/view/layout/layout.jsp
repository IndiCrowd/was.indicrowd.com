<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
		
		<title>인디크라우드 :: <decorator:title /></title>
		
		<jsp:include page="../base-import.jsp" />
		
		<decorator:head />
		
		<!--[if lte IE 9]>
		<script>
		$(function() {
			$('#using-chrome').show();
		});
		</script>
		<![endif]-->
		
	</head>
	
	<body>		
		<div class="perfectum">
		<div id="overlay" style="display:none;">
		
		</div>
		</div>
		<!--start: Header -->
	<header>
	
		<div id="using-chrome" style="display: none; color: #fff; font-size: 10px; background-color: #42A9C7; text-align: center; border-bottom: 1px solid #666;">
			인디크라우드는 구글 크롬 브라우저에 최적화되어있습니다.
		</div>
		
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
					<a class="brand" href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath }/img/indicrowd.png" style ="width:182px; height:25px"/></a>
					
					<div id="sns-share" class="pull-left" style="width: 150px; padding-top: 4px;">
						<!-- AddThis Button BEGIN -->
						<div class="addthis_toolbox addthis_default_style "
									addthis:url="http://www.indicrowd.com/main"
							        addthis:title="IndiCrowd :: 세계최초 온라인 콘서트 서비스"
							        addthis:description="인디 문화 부흥을 위한 세계최초 온라인 콘서트 서비스">
						<a class="addthis_button_preferred_1"></a>
						<a class="addthis_button_preferred_2"></a>
						<a class="addthis_counter addthis_bubble_style"></a>
						</div>
						<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=xa-51616d3b39a084e5"></script>
						<!-- AddThis Button END -->
					</div>

	          		<div class="nav-collapse collapse pull-right">
	            		<ul class="nav">
							<%-- <li class="active"><a href="${pageContext.request.contextPath}">홈</a></li> --%>
							<sec:authorize access="isAuthenticated()">
								<c:if test="${fn:length(principal.comingUpConcerts) gt 0}">
									<c:set var="comingUpConcert" value="${principal.comingUpConcerts[0] }" ></c:set>
									<script>
										var startDate = ${comingUpConcert.startDate};
										var date = new Date(startDate/10000, startDate/100%100 - 1, startDate%100, ${comingUpConcert.startHours}, ${comingUpConcert.startMinutes});
										
										var remainSecond = parseInt((date - new Date())/1000);
										$("#concertTimer").html("("+parseInt(remainSecond/60)+":"+ remainSecond%60+")");
										var interval=setInterval("setConcertTimer()", 1000 );
										var first = 0;
										function setConcertTimer(){
											if(remainSecond > 0 ){
												var day = remainSecond/86400;
												//var hour = remainSecond;
												var second = remainSecond%60;
												if( second <10){
													second= "0"+second;
												}
												$("#concertTimer").html("("+parseInt(remainSecond/60)+":"+ second+")");
												remainSecond--;
											}else{
												clearInterval(interval);
												$("#concertStartButton").removeClass("btn-success");
												$("#concertStartButton").addClass("btn-danger");
												$("#concertStateMessage").html(" 공연 하기 ");
												$("#concertTimer").html("on Air!");
											}
											if(first == 0) $("#concertStartButton").show();
											first++;
										}
									</script>
									<li class="active">
										<button onclick="javascript:goConcertAdmin('${principal.comingUpConcerts[0].id}')" id="concertStartButton" style="display: none" class="btn btn-success">
											<i class="icon-facetime-video icon-white"></i><span id="concertStateMessage"> 리허설 가능 </span></span><br/><span id="concertTimer">&nbsp;</span>
										</button>
									</li>
								</c:if>
							</sec:authorize>
	              			<li class="active"><a href="${pageContext.request.contextPath}/concert">공연</a></li>
							<li class="active"><a href="${pageContext.request.contextPath}/band/home">밴드</a></li>
							<li class="active"><a href="${pageContext.request.contextPath}/fund/project/list">펀딩</a></li>
							<li class="active"><a href="${pageContext.request.contextPath}/item/list">아이템</a></li>
							<li class="active"><a href="${pageContext.request.contextPath}/board">게시판</a></li>
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
								    <c:if test="${principal.socialImageUrl != null}"><img style="width:22px;height:22px" border="0" src="${principal.socialImageUrl }" /> </c:if><c:if test="${principal.socialImageUrl == null}"><img style="width:22px;height:22px" border="0" src="<spring:eval expression="@userfileConfig.baseUrl" />/profilethumb/${principal.id}"> </c:if>${principal.nickname.length() > 6 ? principal.nickname.substring(0, 6).concat('...') : principal.nickname }<b class="caret"></b></a>
								  	<ul class="dropdown-menu">
								  	  <!-- <li class="active" style="border-bottom: 1px solid #ccc;"><a href="${pageContext.request.contextPath}/energy" style="color: #d86112 !important; font-weight: bold;"><img src="${pageContext.request.contextPath}/img/energy.png"> ${principal.energy} <span>energy</span></a></li> -->
								      <li class="active" ><a href="${pageContext.request.contextPath}/user/${principal.id}"><c:if test="${principal.socialImageUrl != null}"><img style="width:22px;height:22px" border="0" src="${principal.socialImageUrl }" /> </c:if><c:if test="${principal.socialImageUrl == null}"><img style="width:22px;height:22px" border="0" src="<spring:eval expression="@userfileConfig.baseUrl" />/profilethumb/${principal.id}"> </c:if>${principal.nickname }</a></li>
								      <c:forEach var="band" items="${principal.userBand }">
								      <!-- img url 썸네일 변환 후 url로 수정해줘야함. -->
								      <li class="active" ><a href="${pageContext.request.contextPath}/band/${band.id}"><img border="0" style="width:22px;height:22px" src="<spring:eval expression="@userfileConfig.baseUrl" />/bandthumb/${band.id}" /> ${band.name }</a></li>
								      </c:forEach>
									  <li class="active" style="border-top: 1px solid #ccc;"><a href="${pageContext.request.contextPath}/signout">로그아웃</a></li>
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
	<div id="bodyContainer" class="container">
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
				<div class="span3">
					
					<div id="under-footer-copyright">
						&copy; 2013, <a href="${pageContext.request.contextPath}/about">IndiCrowd</a>. <span class="hidden-tablet">all right reserved.</span>
					</div>
					
				</div>
				<!-- end: Under Footer Copyright -->
				
				<div class="span8" id="under-footer-menu">
					
					<p class="pull-right">
						<a href="${pageContext.request.contextPath}/about">IndiCrowd 소개</a>
						<%--<a href="${pageContext.request.contextPath}/help">도움말</a> --%>
						<a href="${pageContext.request.contextPath}/terms">이용약관</a>
						<a href="${pageContext.request.contextPath}/policy">개인정보 보호정책</a>
						<a href="${pageContext.request.contextPath}/contact">제안/문의하기</a>
						<a href="https://www.facebook.com/IndiCrowd" target="_blank"><img src="${pageContext.request.contextPath}/img/facebook_favicon.png"> IndiCrowd</a>
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
		
		<!-- Modal for band concert -->
		<div id="bandCloseModal" class="modal hide fade">
		  
		  <div class="modal-body">
		    <p style="text-align:center; font-size:20px"><strong>진행 중인 공연에서 나왔습니다.</strong></p>
		    <p style="font-size:16px"><br/>27명의 팬이 공연을 기다리고 있습니다.</p>
		    <br/>
		    <hr/>
		    <p style="text-align:center;"><button class="btn btn-success">공연장으로 돌아가기!</button> <button class="btn btn-danger">공연 취소</button></p>
		  </div>
		  
		</div>
 
		<!-- Modal -->
		<div id="fundingReady" class="modal hide fade" tabindex="-1" role="dialog" aria-hidden="true">
		  <div class="modal-header">
		    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		    <h3>크라우드 펀딩</h3>
		  </div>
		  <div class="modal-body">
		    <p>크라우드 펀딩과 아이템 샵은 현재 준비중입니다…</p>
		    <p>기대해주세요.</p>
		  </div>
		  <div class="modal-footer">
		    <button class="btn btn-primary" data-dismiss="modal">열심히 준비하겠습니다! 화이팅!</button>
		  </div>
		</div>
		
		<!-- Modal -->
		<div id="shopReady" class="modal hide fade" tabindex="-1" role="dialog" aria-hidden="true">
		  <div class="modal-header">
		    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		    <h3>아이템 샵</h3>
		  </div>
		  <div class="modal-body">
		    <p>크라우드 펀딩과 아이템 샵은 현재 준비중입니다…</p>
		    <p>기대해주세요.</p>
		  </div>
		  <div class="modal-footer">
		    <button class="btn btn-success" data-dismiss="modal">열심히 준비하겠습니다! 화이팅!</button>
		  </div>
		</div>
		
		<script>
		  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
		
		  ga('create', 'UA-40115412-1', 'indicrowd.com');
		  ga('send', 'pageview');
		
		</script>
	</body>
	
</html>
