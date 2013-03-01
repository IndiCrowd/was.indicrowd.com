<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<sec:authentication property="principal" var="principal" />


				
		<!--start: Wrapper-->
		<div id="wrapper">
					
			<!--start: Row -->
			<div class="row-fluid">
			
				<div class="posts span8">

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
									${post.content }
								</p>
							</div>
						</div>
					</div>
					<!-- end: Post -->
					
					<!-- start: Comments -->
					<h3 >댓글 <span class="comments-amount">(${post.commentCount })</span></h3>
										
					<div class="comments-sec">

						<ol class="commentlist">
							<c:forEach items="${post.commentList }" var="comment">
								<li class="span12">
									<div class="comments">
									
									 
										<div class="avatar"><img src="http://www.gravatar.com/avatar/00000000000000000000000000000000?d=mm&s=50" alt="" width="50" height="50" border="0" /> </div>
										<div class="comment-des">
										<div class="comment-by"><strong>${comment.userInfo.nickname }</strong><span class="reply"><span style="color:#aaa">/ </span><a href="#">답글</a></span> <span class="date"></span></div>
											<p>${comment.content }</p>
										</div>
									</div>	
								</li>
							</c:forEach>
							
						 </ol>

					</div>
					<!-- end: Comments -->
					
					<div class="clearfix"></div>
					
					<hr>

					<!-- start: Comment Add -->
					<h3>댓글을 남겨주세요!</h3>
										
					<!-- Form -->
					<div id="contact-form" class="span12">
						<form:form id="add-comment-form">
							<div class="field span1">
								<img src=""/>
							</div>
							<div class="field span8">
									<form:textarea path="content"  class="span12"/>
							</div>
	
							<div class="field span3">
								<input type="button" id="send" value="댓글 달기!"/>
							</div>
						</form:form>
						
						
					</div>		

					<!-- end: Comment Add -->
				
				</div>	

				<jsp:include page="./menu.jsp"></jsp:include>
			
			<!--end: Row -->
			</div>
	
		</div>
		<!-- end: Wrapper  -->