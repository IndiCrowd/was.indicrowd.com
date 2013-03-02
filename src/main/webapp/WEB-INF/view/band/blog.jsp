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
					<c:set value="${pageContext.request.contextPath }/band/${bandInfo.id}/post/${post.id}" var="postUrl"/>
					<!-- start: Post -->
					<div class="post first">
						<c:choose>
							<c:when test="${post.type eq 'img' }">								
								<div class="picture">
									<a href="${postUrl }"><img src="${post.src }" alt="" /></a>
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
								<h2><a href="${postUrl }">${post.title }</a></h2>
							</div>
							<div class="post-meta">
								<span><i class="fa-icon-user"></i>By <a href="#">${post.author }</a></span> 
								<span><i class="fa-icon-comments-alt"></i>With <a href="${postUrl }">${post.commentCount }개의 댓글</a></span>
							</div>
							<div class="post-description">
								<p>
									${post.summary }
								</p>
							</div>
							<a class="post-entry" href="${postUrl }">더보기...</a>
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

				<jsp:include page="./menu.jsp"></jsp:include>
			
			<!--end: Row -->
			</div>
	
		</div>
		<!-- end: Wrapper  -->