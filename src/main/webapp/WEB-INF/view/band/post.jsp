<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<sec:authentication property="principal" var="principal" />

<script>
	function addReply(content) {
		$.ajax({
					url : '${pageContext.request.contextPath}/band/${bandInfo.id}/post/${post.id}/reply.json',
					type : 'POST',
					data : {
						content : content
					},
					success : function(object) {
						console.log(object);
						var comment = object.command;
						if(comment == null){
							alert('로그인이 필요합니다.');
						}else{
							commentAdded(comment);
						}
						
					},
					error : function(a) {
						//alert(a);
					}
				});
	}
	function commentAdded(comment){
		$("#commentlist").append('<div class="comments">'+
				'<div class="avatar">'+
				'<img src="'+comment.userInfo.socialImageUrl+'" alt="" border="0" />'+
			'</div>'+
			'<div class="comment-des">'+
				'<div class="comment-by">'+
					'<strong>'+comment.userInfo.nickname +'</strong><span '+
						'class="reply"><span style="color: #aaa">/ </span>'+
						'</span> <span class="date">'+comment.monthString +'</span>'+
				'</div>'+
				'<p>'+comment.content +'</p>'+
			'</div>'+
		'</div>');
		$(".commentCount").each(function(i,commentCount){
			commentCount = $(commentCount);
			commentCount.html(commentCount.html()*1+1);	
		});
		
		
	}
</script>

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
							<img src="${post.src }" alt="" />
						</div>
					</c:when>
				</c:choose>
				<div class="info">
					<span class="post-date"> <span class="day">${post.day
							}</span> <span class="month-year">${post.monthString },
							${post.year }</span>
					</span> <span class="post-icon standard"><i class="fa-icon-pencil"></i></span>
				</div>
				<div class="post-content">
					<div class="post-title">
						<h2>
							<a href="#">${post.title }</a>
						</h2>
					</div>
					<div class="post-meta">
						<span><i class="fa-icon-user"></i>By <a href="#">${post.author
								}</a></span> <span><i class="fa-icon-comments-alt"></i>With <a
							href="#"><span class="commentCount">${post.commentCount }</span>개의 댓글</a></span>
					</div>
					<div class="post-description">
						<p>${post.content }</p>
					</div>
				</div>
			</div>
			<!-- end: Post -->

			<!-- start: Comments -->
			<h3>
				댓글 (<span class="comments-amount commentCount">${post.commentCount }</span>)
			</h3>

			<div id="commentlist" class="comments-sec commentlist">


				<c:forEach items="${post.commentList }" var="comment">
					<div class="comments">
						<div class="avatar" style="min-height: 70px;">
							<img width="50px" height="50px" src="${comment.authorImageUrl }" alt="" border="0" />
						</div>
						<div class="comment-des">
							<div class="comment-by">
								<strong>${comment.author }</strong><span
									class="reply"><span style="color: #aaa">/ </span></span> <span class="date">${comment.monthString }</span>
							</div>
							<p>${comment.content }</p>
						</div>
					</div>
				</c:forEach>



			</div>
			<!-- end: Comments -->

			<div class="clearfix"></div>

			<hr>

			<sec:authorize access="isAuthenticated()">
			<!-- start: Comment Add -->
			<h3>댓글을 남겨주세요!</h3>
			
			<!-- Form -->
			<div id="contact-form" class="span12">
				<form:form id="add-comment-form">
					<div class="field span1">
						<img src="" />
					</div>
					<div class="field span8">
						<form:textarea id="content" path="content" class="span12" />
					</div>

					<div class="field span3">
						<input type="button" id="send" value="댓글 달기!"
							onclick="addReply($('#add-comment-form #content').val())" />
					</div>
				</form:form>
			</div>
			<!-- end: Comment Add -->
			</sec:authorize>
			<sec:authorize access="isAnonymous()">
			<h3>댓글을 남기시려면 로그인이 필요합니다.</h3>
			</sec:authorize>

		</div>

		<jsp:include page="./menu.jsp"></jsp:include>

		<!--end: Row -->
	</div>

</div>
<!-- end: Wrapper  -->