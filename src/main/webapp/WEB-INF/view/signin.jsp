<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		


		
		<!--start: Wrapper-->
		<div class="row-fluid">
		<div id="wrapper" class="lr-page full span4 offset4">
			
			<!-- start: Row -->
			<div class="row-fluid">
				
				<div id="login-form" class="span12">
					
					<div class="page-title-small">

						<h3>로그인</h3>

					</div>
					<!-- FACEBOOK login -->
					<form id="facebook-login-form" action="${pageContext.request.contextPath}/signin/facebook" method="POST">
						<input type="hidden" name="scope" value="email" />
					</form>
					<a href="javascript:$('#facebook-login-form').submit();" class="facebook_connect">
						<div class="img"><i class="fa-icon-facebook"></i></div>
						<div class="text">페이스북으로 로그인</div>
					</a>
					<a href="#" class="twitter_connect">
						<div class="img"><i class="fa-icon-twitter"></i></div>
						<div class="text">트위터로 로그인</div>
					</a>
					
					<div class="page-title-small">

						<h3 style="background:#f0f0f0">or</h3>

					</div>
					<form action="${pageContext.request.contextPath}/signin/authenticate" method="POST">
							<div class="row-fluid">
								
								<c:if test="${not empty param.error}">
			<p>
				로그인 할 수 없습니다.<br> 아이디와 비밀번호를 확인해 주세요!
			</p>
		</c:if>
		<label> <input type="text" class="span12" name="j_username" value="${param.username}" placeholder="아이디"></label>
		 <label><input type="password" class="span12" name="j_password" placeholder="비밀번호"></label>
		 <h5>로그인 유지  <input name="_spring_security_remember_me" type="checkbox" value="true"></h5>
							</div>
							<div class="actions">
							
								<button type="submit" class="btn span12">로그인!</button>
								<a href="${pageContext.request.contextPath}/user/join"><button type="button" class="btn span12" onClick="#">회원가입!</button></a>
							</div>
					</form>
					
				</div>
				
			</div>
			<!-- end: Row -->	
		
		</div>
		<!-- end: Wrapper  -->


</div>	
	
	
	
	
	
	
	---------------------------------------------------------
<!-- start: Page Title -->
<div id="page-title">

	<h2>로그인</h2>

</div>

<!--start: Wrapper-->
		<div id="wrapper">
	<form action="${pageContext.request.contextPath}/signin/authenticate"
		method="POST">
		<c:if test="${not empty param.error}">
			<p>
				로그인 할 수 없습니다.<br> 아이디와 비밀번호를 확인해 주세요!
			</p>
		</c:if>
		<label>아이디</label> <input type="text" name="j_username" value="${param.username}">
		 <label>비밀번호</label> <input type="password" name="j_password">
		  <label class="checkbox">
			<input name="_spring_security_remember_me" type="checkbox" value="true"> 로그인 유지
		</label>
		<button type="submit">로그인</button>
		<a href="${pageContext.request.contextPath}/user/join">회원가입</a>
	</form>

	<div>

		<!-- FACEBOOK login -->
		<form id="facebook-login-form" action="${pageContext.request.contextPath}/signin/facebook" method="POST">
			<input type="hidden" name="scope" value="email" />
		</form>

		<a href="javascript:$('#facebook-login-form').submit();">
			<img src="${pageContext.request.contextPath}/img/facebook/f_logo.jpg">
		</a>

	</div>
</div>