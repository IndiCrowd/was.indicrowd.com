<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		
	
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
		<label>아이디</label> <input type="text" name="j_username" value="${param.username}"> <label>비밀번호</label> <input type="password" name="j_password"> <label class="checkbox">
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