<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

	<head>
		<title>아이템 상점</title>
	</head>
	<body>

		<!-- start: Page Title -->
		<div id="page-title">
			<h2>재미난 아이템으로 공연에 활력을 불어넣어주세요!</h2>
		</div>
		<!-- end: Page Title -->
		
		<!--start: Wrapper-->
		<div id="wrapper">
			<div class="row">
				<a href="<c:url value="/shop/create" />" role="button" class="btn offset10" data-toggle="modal">상점 생성</a>
				<a href="<c:url value="/item/create" />" role="button" class="btn offset10" data-toggle="modal">아이템 생성</a>	
			</div>
		</div>
		<!-- end: Wrapper  -->

	</body>
</html>
