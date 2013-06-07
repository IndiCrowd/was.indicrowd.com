<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<sec:authentication property="principal" var="principal" />
		<style>
			.video-li { float:left; margin: 5px 8px 8px 0}
			.video-size {width:150px; height:122px;}
			.play-video-modal { width: 700px;}
		</style>
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
					//console.log(object);
					alert('삭제되었습니다.');
					window.location.reload();
				},
				error : function(a) {
					// alert(a);
				}
			});
			
		}
		function parseYoutubeUrl(url){
			var regExp = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/;
			var match = url.match(regExp);
			if (match&&match[2].length==11){
			    return match[2];
			}else{
			    return null;
			}
		}
		function submitVideoUrl(url){
			var urlKey = parseYoutubeUrl(url);
			if(urlKey == null) alert('유효하지 않은 YouTube 주소 입니다. 주소를 확인해주세요.')
			else{
				POST('${pageContext.request.contextPath}/band/${bandInfo.id}/addYoutubeVideo.json',{
					urlKey : urlKey
				},function(object) {
					if(object!=null){
						window.location.reload();
					}
				});
			}
		}
		function playVideo(urlKey){
			
			$("#youtubePlayIframe").attr('src',"http://www.youtube.com/embed/"+urlKey+"?rel=0&amp;autoplay=1");
			$('#playVideoModal').modal('show');
		}
		function closeVideo(){
			$("#youtubePlayIframe").attr('src',"");
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
									<div class="span2"><img src="<spring:eval expression="@userfileConfig.baseUrl" />/concertthumb/${concert.id}" style="width:100px;height:100px;"/></div>
									<div class="span9">
										<p><a href="javascript:popup('<c:url value="/concert/${concert.id}" />', 'Concert', 1000, 700); void(0)"><b>${concert.title }, 저녁 ${concert.startHours }:<c:if test="${concert.startMinutes lt 10}">0</c:if>${concert.startMinutes }</b></a></p>
										<p><span class="label label-success">관객</span> ${concert.totalAudienceCount }명이 관람하였습니다.</p>
									</div>
								</div>
							</td>
						</tr>
						</c:forEach> 
					</table>
					
					<h3>${bandInfo.name }'s 비디오 <sec:accesscontrollist domainObject="${bandInfo.id}" hasPermission="isBand"><a href="#addVideoModal" role="button" data-toggle="modal" class="btn btn-success">+</a></sec:accesscontrollist></h3>
					<p style="text-align:right">총 <a href="#"><b>${fn:length(videoList) }</b></a>개의 비디오</p>
					<ul>
						<c:forEach items="${videoList }" var="video">
							<c:if test="${video.type eq 0}">
							<li class="video-li"><a href="javascript:playVideo('${video.urlKey }')"><div style="position:absolute" class="video-size"><div class="play_border"><div class="play_button"></div></div></div><img src="http://img.youtube.com/vi/${video.urlKey }/default.jpg" class="video-size"/></a></li>
							</c:if>
						</c:forEach>
					</ul>
				
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
		
<!-- add Video Modal -->
<div id="addVideoModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="addVideoLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="addVideoLabel">밴드 공연 Youtube주소를 입력해주세요!</h3>
  </div>
  <div class="modal-body">
    <p><input id="videoUrl" type="text" class="input-block-level" placeholder="비디오 URL"></p>
  </div>
  <div class="modal-footer">
    <button class="btn btn-primary" onClick="submitVideoUrl($('#videoUrl').val())">추가</button>
  </div>
</div>

<!-- Play Video Modal -->
<div id="playVideoModal" class="play-video-modal modal hide fade" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onClick="closeVideo()">×</button>
  </div>
  <div class="modal-body">
    <iframe id="youtubePlayIframe" width="640" height="360" src="" frameborder="0" allowfullscreen="true"></iframe>
  </div>
</div>