<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- start: Page Title -->
<div id="page-title">
	<h2>펀딩을 기다리는 다양한 프로젝트를 만나보세요!</h2>
</div>
<!-- end: Page Title -->

<!--start: Wrapper-->
<div id="wrapper">
	<div class="row">
		<a href="<c:url value="/fund/project/create" />" role="button" class="btn offset10" data-toggle="modal">프로젝트 생성</a>	
	</div>
	<div id="filters">
		<ul class="option-set" data-option-key="filter">
			<li><a href="#filter" class="selected" data-option-value="*">All</a></li>
			<c:forEach items="${tagList }" var="tag">
			<li>/</li>
			<li><a href="#filter" data-option-value=".${tag.tagStr }">${tag.repTagInput.tagInputStr }</a></li>
			</c:forEach>
		</ul>
	</div>

	<!-- start: Portfolio -->
	<div id="wall" class="row-fluid">
		<c:forEach items="${command.list}" var="one">
		<div class="span3 item<c:forEach items="${one.genres}" var="genre"> ${genre.tag.tagStr}</c:forEach>">
			<div class="picture">
				<a class="image" href="${pageContext.request.contextPath}/fund/project/${one.id}" title="Title"><img
					src="<spring:eval expression="@userfileConfig.getProperty('baseUrl')" />/projectthumb/${one.id}" alt="" /></a>
				<h3>${one.title}</h3>
				<div class="description">
					<p>${one.content}</p>
				</div>
			</div>
		</div>
		</c:forEach>

	</div>
	<!-- end: Portfolio -->

</div>
<!-- end: Wrapper  -->
