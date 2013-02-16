<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

						<h3>계정을 만들어보세요!</h3>

					</div>
					<form id="facebook-login-form" action="${pageContext.request.contextPath}/signin/facebook" method="POST">
						<input type="hidden" name="scope" value="email" />
						<input type="hidden" name="redirect_uri" value="/user/extra" />
				    </form>
					<a href="javascript:$('#facebook-login-form').submit();" class="facebook_connect">
						<div class="img"><i class="fa-icon-facebook"></i></div>
						<div class="text">페이스북으로 가입하기</div>
					</a>
					<a href="#" class="twitter_connect">
						<div class="img"><i class="fa-icon-twitter"></i></div>
						<div class="text">트위터로 가입하기</div>
					</a>
					
					<div class="page-title-small">

						<h3 style="background:#f0f0f0">or</h3>

					</div>
					<form:form id="join-form">
						<fieldset>
							<div class="row-fluid">
								
								<label>
									<form:input path="email" placeholder="이메일 주소" class="span12"/>
									<spring:bind path="email"><span class="error">${status.errorMessage}</span></spring:bind>
								</label>
								<label>
									<form:input path="username" placeholder="ID" class="span12"/>
									<spring:bind path="username"><span class="error">${status.errorMessage}</span></spring:bind>
								</label>
								<label>
									<form:input path="password" placeholder="비밀번호" class="span12"/>
									<spring:bind path="password"><span class="error">${status.errorMessage}</span></spring:bind>
								</label>
								<label>
									<form:input path="passwordConfirm" placeholder="비밀번호 확인" class="span12"/>
									<spring:bind path="passwordConfirm"><span class="error">${status.errorMessage}</span></spring:bind>
								</label>
								<label>
									<form:input path="nickname" placeholder="닉네임" class="span12"/>
									<spring:bind path="nickname"><span class="error">${status.errorMessage}</span></spring:bind>
								</label>
								<label>
							<h5>이용약관 동의<form:checkbox id="termsAgree" path="termsAgree" /></h5>
							
							<spring:bind path="termsAgree"><span class="error">${status.errorMessage}</span></spring:bind>
						</label>
							</div>
							<div class="actions">
							
								<button type="submit" class="btn span12">계정 생성!</button>
							
							</div>
						</fieldset>
				
					</form:form>
					
				</div>
				
			</div>
			<!-- end: Row -->	
		
		</div>
		<!-- end: Wrapper  -->


</div>