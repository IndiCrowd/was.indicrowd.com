<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<sec:authentication property="principal" var="principal" />

		<script>
		function delPost(postId) {
			var answer = confirm("정말 삭제하시겠습니까?")
		    if (!answer){
		        return ;  
		    }

			$.ajax({
				url : '${pageContext.request.contextPath}/band/${bandInfo.id}/post/${post.id}.json',
				type : 'DELETE',
				success : function(object) {
					console.log(object);
					alert('삭제되었습니다.');
					window.location.reload();
				},
				error : function(a) {
					// alert(a);
				}
			});
			
		}
		</script>
				
		<!--start: Wrapper-->
		<div id="wrapper">
						
			<!--start: Row -->
			<div class="row-fluid">
			
				<div class="posts span8">
				
					<h3>${bandInfo.name }'s 공연 일정</h3>
					<p style="text-align:right">총 <a href="#"><b>${fn:length(concertList) }</b></a>회 공연, <a href="#">전체보기</a></p>
					<table class="table table-bordered perfectum" >
					<sec:accesscontrollist domainObject="${bandInfo.id}" hasPermission="isBand">
						<tr>
							<td style="text-align: center">
								<a href="#">새로운 공연을 예약해보세요!<br/></a>
								<a href="<c:if test="${principal != 'anonymousUser' && principal.userBand != null && principal.userBand.size() > 0}"><c:url value="/concert/reserve" /></c:if><c:if test="${!(principal != 'anonymousUser' && principal.userBand != null && principal.userBand.size() > 0)}">javascript:alert('현재 속해 있는 밴드가 없습니다.\n밴드 생성 페이지로 이동합니다.');location.href='<c:url value="/band/create" />';</c:if>" class="btn btn-primary btn-large"><i class="icon-download-alt icon-white"></i> 공연을 예약하세요!</a>
							</td>
						</tr>
					</sec:accesscontrollist>
						<c:forEach items="${concertList }" var="concert" begin="0" end="4" >
						<tr>
							<td>
								<div class="row-fluid">
									<div class="span1">${concert.dateString }<br/>${concert.dayName }</div>
									<div class="span2"><img src="/IndiCrowd-userfiles/concertthumb/${concert.id}" style="width:100px;height:100px;"/></div>
									<div class="span9">
										<p><a href="javascript:popup('<c:url value="/concert/${concert.id}" />', 'Concert', 1000, 700); void(0)"><b>${concert.title }, 저녁 ${concert.startHours }:<c:if test="${concert.startMinutes lt 10}">0</c:if>${concert.startMinutes }</b></a></p>
										<p><span class="label label-success">관객</span> ${concert.totalAudienceCount }명이 관람하였습니다.</p>
									</div>
								</div>
							</td>
						</tr>
						</c:forEach> 
					</table>
					
				
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
								<sec:accesscontrollist domainObject="${post.id}" hasPermission="isBandPost">
									<span><a href="${pageContext.request.contextPath }/band/${bandInfo.id}/post/${post.id}/form">수정</a></span>
									<span><a href="javascript:delPost(${post.id}); void(0)">삭제</a></span>
								</sec:accesscontrollist>
								
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
					
					
					<!-- 
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
					 -->

				</div>

				<jsp:include page="./menu.jsp"></jsp:include>
			
			<!--end: Row -->
			</div>
	
		</div>
		<!-- end: Wrapper  -->