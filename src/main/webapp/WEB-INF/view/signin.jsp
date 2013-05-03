<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		

<title>로그인</title>
		
		<!--start: Wrapper-->
		<div class="row-fluid">
		<div id="wrapper" class="lr-page full span4 offset4" style="margin-top: 120px; margin-bottom: 60px;">
			
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
			<p class="text-error">
				로그인 할 수 없습니다.<br> 아이디와 비밀번호를 확인해 주세요!
			</p>
		</c:if>
		<label> <input type="text" class="span12" name="j_username" value="${param.username}" placeholder="아이디"></label>
		 <label><input type="password" class="span12" name="j_password" placeholder="비밀번호"></label>
		 <h5>로그인 유지  <input name="_spring_security_remember_me" type="checkbox" value="true" checked="checked"></h5>
							</div>
							<div class="actions">
							
								<button type="submit" class="btn span12" style="margin-bottom: 10px;">로그인</button>
								
								<p style="margin-bottom: 5px;">아직 회원이 아니세요?</p>
								
								<a href="${pageContext.request.contextPath}/user/join"><button type="button" class="btn span12" onClick="#">회원가입</button></a>
							</div>
					</form>
					
				</div>
				
			</div>
			<!-- end: Row -->	
		
		</div>
		<!-- end: Wrapper  -->


</div>	
	