<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

	<head>
		<title>회원 정보 수정</title>
	</head>

	<body>
	
		<div class="row-fluid">
		
		<div id="wrapper" class="lr-page full span4 offset4">
		
			<!-- start: Row -->
			<div class="row-fluid">
				
				<div id="login-form" class="span12">
					
					<div class="page-title-small">

						<h3>계정 정보 수정</h3>

					</div>
					
					<form:form>
						<fieldset>
							<div class="row-fluid">
								
								<label>
									<form:input path="email" placeholder="이메일 주소" class="span12"/>
									<spring:bind path="email"><span class="text-error">${status.errorMessage}</span></spring:bind>
								</label>
								<label>
									<form:input path="username" placeholder="ID" class="span12"/>
									<spring:bind path="username"><span class="text-error">${status.errorMessage}</span></spring:bind>
								</label>
								<label>
									<form:password path="password" placeholder="비밀번호" class="span12"/>
									<spring:bind path="password"><span class="text-error">${status.errorMessage}</span></spring:bind>
								</label>
								<label>
									<form:password path="passwordConfirm" placeholder="비밀번호 확인" class="span12"/>
									<spring:bind path="passwordConfirm"><span class="text-error">${status.errorMessage}</span></spring:bind>
								</label>
								<label>
									<form:input path="nickname" placeholder="닉네임" class="span12"/>
									<spring:bind path="nickname"><span class="text-error">${status.errorMessage}</span></spring:bind>
								</label>
							
							</div>
							<div class="actions">
							
								<button type="submit" class="btn span12">수정 완료</button>
								<a href="${pageContext.request.contextPath}/user/leave" class="pull-right" style="margin-top: 10px;">회원 탈퇴</a>
							
							</div>
						</fieldset>
				
					</form:form>
					
				</div>
				
			</div>
			<!-- end: Row -->	
			
		</div>
		
		</div>

	</body>
</html>
