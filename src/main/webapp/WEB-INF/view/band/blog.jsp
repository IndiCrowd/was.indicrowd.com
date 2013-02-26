<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<sec:authentication property="principal" var="principal" />


				
		<!--start: Wrapper-->
		<div id="wrapper">
					
			<!--start: Row -->
			<div class="row-fluid">
			
				<div class="posts span8">
					<c:forEach items="${recentPostList }" var="post">
					<!-- start: Post -->
					<div class="post first">
						<c:choose>
							<c:when test="${post.type eq 'img' }">								
								<div class="picture">
									<a href="post.html"><img src="${post.src }" alt="" /></a>
								</div>
							</c:when>
						</c:choose>
						<div class="info">
							<span class="post-date">
								<span class="day">${post.day }</span>
								<span class="month-year">${post.monthString }, ${post.year }</span>
							</span>
							<span class="post-icon standard"><i class="fa-icon-pencil"></i></span>
						</div>	
						<div class="post-content">
							<div class="post-title">
								<h2><a href="post.html">${post.title }</a></h2>
							</div>
							<div class="post-meta">
								<span><i class="fa-icon-user"></i>By <a href="#">${post.author }</a></span> 
								<span><i class="fa-icon-comments-alt"></i>With <a href="#">${post.commentCount }개의 댓글</a></span>
							</div>
							<div class="post-description">
								<p>
									${post.summary }
								</p>
							</div>
							<a class="post-entry" href="post.html">Read More...</a>
						</div>
					</div>
					<!-- end: Post -->
					</c:forEach>
					

					<ul class="pagination">
						<a href="#"><li></li></a>
						<a href="#"><li></li></a>
						<a href="#"><li></li></a>
						<a href="#"><li></li></a>
						<a href="#"><li class="current"></li></a>
						<a href="#"><li></li></a>
						<a href="#"><li></li></a>
						<a href="#"><li></li></a>
						<a href="#"><li></li></a>
						<a href="#"><li></li></a>
						<a href="#"><li></li></a>
						<a href="#"><li></li></a>
						<a href="#"><li></li></a>
					</ul>

				</div>

				<!-- start: Sidebar -->

				<div class="sidebar span4 hidden-phone">
					
					<!-- start: Text Widget -->
					<div class="widget first">
						<img src="${pageContext.request.contextPath }/img/band/${bandInfo.imageFilePath}"/>
						<h2>${bandInfo.name }</h2>
						<p>
							${bandInfo.description }
						</p>
					</div>
					<!-- end: Text Widget -->
					
					

					<!-- start: Sidebar Menu -->
					<div class="widget">
						<div class="title"><h3>Menu</h3></div>
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
						<div class="title"><h3>Tags</h3></div>
						<div class="tags">
							<c:forEach items="${tags }" var="tag"><a href="#">${tag }</a></c:forEach>
							
						</div>
					</div>
					<!-- end: Tags -->

				</div>
				<!-- end: Sidebar -->
			
			<!--end: Row -->
			</div>
	
		</div>
		<!-- end: Wrapper  -->