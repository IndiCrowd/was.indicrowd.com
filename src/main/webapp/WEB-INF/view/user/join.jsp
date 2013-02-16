<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	
		<div id="content">
	
			<h1>Sign UP</h1> 
			
			<div class="sns-signin">
				<div class="buttons">
					<form id="facebook-login-form" action="${pageContext.request.contextPath}/signin/facebook" method="POST">
						<input type="hidden" name="scope" value="email" />
						<input type="hidden" name="redirect_uri" value="/user/extra" />
				    </form>
					<a href="javascript:$('#facebook-login-form').submit();"><img src="<c:url value="/img/user/join/facebook.png" />"></a>
					<a href="#"><img src="<c:url value="/img/user/join/twitter.png" />"></a>
				</div>
			</div>
			
			<form:form id="join-form">
				<fieldset>
					<p>
						<label>
							<h5>E-mail</h5>
							<form:input path="email" />
							<spring:bind path="email"><span class="error">${status.errorMessage}</span></spring:bind>
						</label>
					</p>
					<p>
						<label>
							<h5>ID</h5>
							<form:input path="username" />
							<spring:bind path="username"><span class="error">${status.errorMessage}</span></spring:bind>
						</label>
					</p>
					<p>
						<label>
							<h5>비밀번호</h5>
							<form:password path="password" />
							<spring:bind path="password"><span class="error">${status.errorMessage}</span></spring:bind>
						</label>
					</p>
					<p>
						<label>
							<h5>비밀번호 확인</h5>
							<form:password path="passwordConfirm" />
							<spring:bind path="passwordConfirm"><span class="error">${status.errorMessage}</span></spring:bind>
						</label>
					</p>
					<p>
						<label>
							<h5>닉네임</h5>
							<form:input path="nickname" />
							<spring:bind path="nickname"><span class="error">${status.errorMessage}</span></spring:bind>
						</label>
					</p>
					<p>
						<label>
							<h5>이용약관 동의</h5>
							<form:checkbox id="termsAgree" path="termsAgree" />
							<spring:bind path="termsAgree"><span class="error">${status.errorMessage}</span></spring:bind>
						</label>
					</p>
					<p>
						<button type="submit">회원가입</button>
					</p>
				</fieldset>
				
			</form:form>
		
		</div>
