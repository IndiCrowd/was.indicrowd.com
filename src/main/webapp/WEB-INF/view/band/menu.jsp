<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- start: Sidebar -->

<div class="sidebar span4 hidden-phone">

	<!-- start: Text Widget -->
	<div class="widget first">
		<img
			src="${pageContext.request.contextPath }/img/band/${bandInfo.imageFilePath}" />
		<h2>${bandInfo.name }</h2>
		<p>${bandInfo.description }</p>
	</div>
	<!-- end: Text Widget -->



	<!-- start: Sidebar Menu -->
	<div class="widget">
		<div class="title">
			<h3>Menu</h3>
		</div>
		<ul class="links-list-alt">
			<li><a href="index.html">Home</a></li>
			<li><a href="contact.html">Contact</a></li>
			<li><a href="post.html">Single Post</a></li>
			<li><a href="about.html">About Us</a></li>
			<li><a href="pricing.html">Pricing Tables</a></li>
		</ul>
	</div>
	<!-- end: Sidebar Menu -->
	<!-- start: Tags -->
	<div class="widget last">
		<div class="title">
			<h3>Tags</h3>
		</div>
		<div class="tags">
			<c:forEach items="${tags }" var="tag">
				<a href="#">${tag }</a>
			</c:forEach>

		</div>
	</div>
	<!-- end: Tags -->

</div>
<!-- end: Sidebar -->