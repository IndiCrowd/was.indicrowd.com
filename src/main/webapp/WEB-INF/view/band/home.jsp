<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>개성있는 밴드들을 만나보세요!</title>

<!-- start: Page Title -->
<div id="page-title">
	<h2>개성있는 밴드들을 만나보세요!</h2>
</div>
<!-- end: Page Title -->

<!--start: Wrapper-->
<div id="wrapper" class="row">
	<div class="row">
		<a href="${pageContext.request.contextPath}/band/create" role="button" class="btn btn-large btn-success offset9" style="margin-bottom: 15px;" data-toggle="modal"><i class="icon-music icon-white"></i> 밴드를 만들어보세요!</a>	
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

		
		<c:forEach items="${bandInfoList }" var="band">
		<div class="span3 item ${band.category }">
			<div class="picture">
				<a class="image" href="${pageContext.request.contextPath}/band/${band.id}" title="Title"><img
					src="<spring:eval expression="@userfileConfig.baseUrl" />/bandthumb/${band.id}" alt="" /></a>
				<h3>${band.name }</h3>
				<div class="description">
					<p>${band.description }</p>
				</div>
			</div>
		</div>
		</c:forEach>

	</div>
	<!-- end: Portfolio -->

</div>

<!-- end: Wrapper  -->
<!-- Modal -->
