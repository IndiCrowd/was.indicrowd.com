<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

	<head>
		<title>회원 탈퇴</title>
	</head>

	<body>
	
		<!--start: Wrapper-->
		<div class="row-fluid" style="margin: 120px 0;">
		<div id="wrapper" class="lr-page full span4 offset4">
			
			<!-- start: Row -->
			<div class="row-fluid">
				
				<div class="span12">
					
					<div class="page-title-small">

						<h3>회원 탈퇴</h3>

					</div>
					
					<p style="margin: 15px 0 25px 0;">
						탈퇴하시면 계정에 저장된 정보들을 영원히 사용하실 수 없습니다.<br>
						정말 탈퇴하시겠습니까?
					</p>

					<div class="actions">
						<form method="POST">
						<button type="submit" class="btn btn-danger span12" style="margin-bottom: 10px;">예, 탈퇴합니다.</button>
						</form>
						
						<a href="${pageContext.request.contextPath}/"><button type="button" class="btn btn-primary span12">아니오, 메인으로 돌아갑니다.</button></a>
					</div>
							
				</div>
				
			</div>
			<!-- end: Row -->	
		
		</div>
		<!-- end: Wrapper  -->
		</div>	

	</body>
</html>
