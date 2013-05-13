<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

	<head>
		<title>글 삭제</title>
	</head>

	<body>
	
		<!--start: Wrapper-->
		<div class="row-fluid" style="margin: 120px 0;">
		<div id="wrapper" class="lr-page full span4 offset4">
			
			<!-- start: Row -->
			<div class="row-fluid">
				
				<div class="span12">
					
					<div class="page-title-small">

						<h3>글 삭제</h3>

					</div>
					
					<p style="margin: 15px 0 25px 0;">
						삭제시면 되돌릴 수 없습니다.<br>
						정말 삭제하시겠습니까?
					</p>

					<div class="actions">
						<form method="POST">
						<button type="submit" class="btn btn-danger" style="display: block; width: 100%;">예, 삭제합니다.</button>
						</form>
						<a href="${pageContext.request.contextPath}/article/${command.id}" class="btn btn-primary" style="display: block;">아니오, 글로 돌아갑니다.</a>
					</div>
							
				</div>
				
			</div>
			<!-- end: Row -->	
		
		</div>
		<!-- end: Wrapper  -->
		</div>	

	</body>
</html>
