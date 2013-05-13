<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<sec:authentication property="principal" var="principal" />

<!DOCTYPE html>
<html>
	<head>
		<title>회원 정보 보기</title>
	</head>
	
	<body>
		
		<div id="page-title">
		
			<h2>${command.nickname}</h2>
		
		</div>
	
		<div id="wrapper" class="full">
				
				<p>
					회원님의 닉네임은 <b>${command.nickname}</b>입니다.
				</p>
				<p>
					회원님은 <b>${command.joinDate}</b>에 가입하셨습니다.
				</p>
				<p>
					회원님은 <b>${command.lastLoginDate}</b>에 마지막으로 로그인 하셨습니다.
				</p>
				<p>
					회원님은 총 <b>${command.loginCount}</b>번 로그인 하셨습니다.
				</p>
				
				<t:signed>
					<t:notSocialSigned>
					<c:if test="${principal.id == command.id}">
					<div class="form-actions">
						<a href="${pageContext.request.contextPath}/user/update" class="btn btn-large">회원 정보 수정</a>
					</div>
					</c:if>
					</t:notSocialSigned>
				</t:signed>
			
		</div>

	</body>
</html>
