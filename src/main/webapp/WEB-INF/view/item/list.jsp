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
			<div id="filters">
				<ul class="option-set" data-option-key="filter">
					<li><a href="#filter" class="selected" data-option-value="*">All</a></li>
					<c:forEach items="${shops}" var="shop">
					<li>/</li>
					<li><a href="#filter" data-option-value=".shop-${shop.id}">${shop.name}</a></li>
					</c:forEach>
				</ul>
			</div>
		
			<!-- start: Portfolio -->
			<div id="wall" class="row-fluid">
				<c:forEach items="${command.list}" var="one">
				<div class="span2 item shop-${one.shop.id}">
					<div class="picture">
						<a class="image" href="${pageContext.request.contextPath}/item/${one.id}" title="Title"><img
							src="<spring:eval expression="@userfileConfig.getProperty('baseUrl')" />/itemthumb/${one.id}" alt="" /></a>
						<h3>${one.name}</h3>
						<div class="description">
							<p>${one.description}</p>
						</div>
					</div>
				</div>
				</c:forEach>
		
			</div>
			<!-- end: Portfolio -->
		</div>
		<!-- end: Wrapper  -->

	</body>
</html>
