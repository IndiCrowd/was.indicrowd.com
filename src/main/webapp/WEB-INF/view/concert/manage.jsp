<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<sec:authentication property="principal" var="principal" />
<link href="<c:url value="/css/timeline-style.css"/>" rel="stylesheet" type="text/css">

<div id="wrapper" class="full">
	
<div id="timeline" >
		<ul id="dates">
			<li><a href="#4.13" class="selected">4/13</a></li>
			<li><a href="#1930">1930</a></li>
			<li><a href="#1944">1944</a></li>
			<li><a href="#1950">1950</a></li>
			<li><a href="#1971">1971</a></li>
			<li><a href="#1977">1977</a></li>
			<li><a href="#1989">1989</a></li>
			<li><a href="#1999">1999</a></li>
			<li><a href="#2001">2001</a></li>
			<li><a href="#2011">2011</a></li>
		</ul>
		<ul id="issues">
			<li id="4.13" class="selected">
				
				<h1>4.13</h1>
				<p>Donec semper quam scelerisque tortor dictum gravida. In hac habitasse platea dictumst. Nam pulvinar, odio sed rhoncus suscipit, sem diam ultrices mauris, eu consequat purus metus eu velit. Proin metus odio, aliquam eget molestie nec, gravida ut sapien. Phasellus quis est sed turpis sollicitudin venenatis sed eu odio. Praesent eget neque eu eros interdum malesuada non vel leo. Sed fringilla porta ligula.</p>
				
				
			</li>
			<li id="1930">
				<img src="${pageContext.request.contextPath}/img/timeline/2.png" width="256" height="256" />
				<h1>1930</h1>
				<p>Donec semper quam scelerisque tortor dictum gravida. In hac habitasse platea dictumst. Nam pulvinar, odio sed rhoncus suscipit, sem diam ultrices mauris, eu consequat purus metus eu velit. Proin metus odio, aliquam eget molestie nec, gravida ut sapien. Phasellus quis est sed turpis sollicitudin venenatis sed eu odio. Praesent eget neque eu eros interdum malesuada non vel leo. Sed fringilla porta ligula.</p>
			</li>
			<li id="1944">
				<img src="${pageContext.request.contextPath}/img/timeline/3.png" width="256" height="256" />
				<h1>1944</h1>
				<p>Donec semper quam scelerisque tortor dictum gravida. In hac habitasse platea dictumst. Nam pulvinar, odio sed rhoncus suscipit, sem diam ultrices mauris, eu consequat purus metus eu velit. Proin metus odio, aliquam eget molestie nec, gravida ut sapien. Phasellus quis est sed turpis sollicitudin venenatis sed eu odio. Praesent eget neque eu eros interdum malesuada non vel leo. Sed fringilla porta ligula.</p>
			</li>
			<li id="1950">
				<img src="${pageContext.request.contextPath}/img/timeline/4.png" width="256" height="256" />
				<h1>1950</h1>
				<p>Donec semper quam scelerisque tortor dictum gravida. In hac habitasse platea dictumst. Nam pulvinar, odio sed rhoncus suscipit, sem diam ultrices mauris, eu consequat purus metus eu velit. Proin metus odio, aliquam eget molestie nec, gravida ut sapien. Phasellus quis est sed turpis sollicitudin venenatis sed eu odio. Praesent eget neque eu eros interdum malesuada non vel leo. Sed fringilla porta ligula.</p>
			</li>
			<li id="1971">
				<img src="${pageContext.request.contextPath}/img/timeline/5.png" width="256" height="256" />
				<h1>1971</h1>
				<p>Donec semper quam scelerisque tortor dictum gravida. In hac habitasse platea dictumst. Nam pulvinar, odio sed rhoncus suscipit, sem diam ultrices mauris, eu consequat purus metus eu velit. Proin metus odio, aliquam eget molestie nec, gravida ut sapien. Phasellus quis est sed turpis sollicitudin venenatis sed eu odio. Praesent eget neque eu eros interdum malesuada non vel leo. Sed fringilla porta ligula.</p>
			</li>
			<li id="1977">
				<img src="${pageContext.request.contextPath}/img/timeline/6.png" width="256" height="256" />
				<h1>1977</h1>
				<p>Donec semper quam scelerisque tortor dictum gravida. In hac habitasse platea dictumst. Nam pulvinar, odio sed rhoncus suscipit, sem diam ultrices mauris, eu consequat purus metus eu velit. Proin metus odio, aliquam eget molestie nec, gravida ut sapien. Phasellus quis est sed turpis sollicitudin venenatis sed eu odio. Praesent eget neque eu eros interdum malesuada non vel leo. Sed fringilla porta ligula.</p>
			</li>
			<li id="1989">
				<img src="${pageContext.request.contextPath}/img/timeline/7.png" width="256" height="256" />
				<h1>1989</h1>
				<p>Donec semper quam scelerisque tortor dictum gravida. In hac habitasse platea dictumst. Nam pulvinar, odio sed rhoncus suscipit, sem diam ultrices mauris, eu consequat purus metus eu velit. Proin metus odio, aliquam eget molestie nec, gravida ut sapien. Phasellus quis est sed turpis sollicitudin venenatis sed eu odio. Praesent eget neque eu eros interdum malesuada non vel leo. Sed fringilla porta ligula.</p>
			</li>
			<li id="1999">
				<img src="${pageContext.request.contextPath}/img/timeline/8.png" width="256" height="256" />
				<h1>1999</h1>
				<p>Donec semper quam scelerisque tortor dictum gravida. In hac habitasse platea dictumst. Nam pulvinar, odio sed rhoncus suscipit, sem diam ultrices mauris, eu consequat purus metus eu velit. Proin metus odio, aliquam eget molestie nec, gravida ut sapien. Phasellus quis est sed turpis sollicitudin venenatis sed eu odio. Praesent eget neque eu eros interdum malesuada non vel leo. Sed fringilla porta ligula.</p>
			</li>
			<li id="2001">
				<img src="${pageContext.request.contextPath}/img/timeline/9.png" width="256" height="256" />
				<h1>2001</h1>
				<p>Donec semper quam scelerisque tortor dictum gravida. In hac habitasse platea dictumst. Nam pulvinar, odio sed rhoncus suscipit, sem diam ultrices mauris, eu consequat purus metus eu velit. Proin metus odio, aliquam eget molestie nec, gravida ut sapien. Phasellus quis est sed turpis sollicitudin venenatis sed eu odio. Praesent eget neque eu eros interdum malesuada non vel leo. Sed fringilla porta ligula.</p>
			</li>
			<li id="2011">
				<img src="${pageContext.request.contextPath}/img/timeline/10.png" width="256" height="256" />
				<h1>2011</h1>
				<p>Donec semper quam scelerisque tortor dictum gravida. In hac habitasse platea dictumst. Nam pulvinar, odio sed rhoncus suscipit, sem diam ultrices mauris, eu consequat purus metus eu velit. Proin metus odio, aliquam eget molestie nec, gravida ut sapien. Phasellus quis est sed turpis sollicitudin venenatis sed eu odio. Praesent eget neque eu eros interdum malesuada non vel leo. Sed fringilla porta ligula.</p>
			</li>
		</ul>
		<div id="grad_top"></div>
		<div id="grad_bottom"></div>
		<a href="#" id="next">+</a>
		<a href="#" id="prev">-</a>
	</div>
	</div>
	
<script src="<c:url value="/js/jquery.timelinr-0.9.53.js" />"></script>
<script>
$(function(){
	$().timelinr({
		orientation: 	'vertical',
		issuesSpeed: 	300,
		datesSpeed: 	0,
		arrowKeys: 		'true',
		startAt:		3
	})
});
</script>