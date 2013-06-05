<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>

	<head>
		<title>프로젝트 보기</title>
	</head>

	<body>
	
		<div id="page-title">
		
			<h2>${command.title}</h2>
		
		</div>
	
		<!--start: Wrapper-->
		<div id="wrapper">
		
						
			<!--start: Row -->
			<div class="row-fluid">
			
				<div class="posts span8">
					<!-- start: Post -->
					<div class="post first">
						<div class="picture" style="margin-bottom: 20px;">
							<img src="<spring:eval expression="@userfileConfig.getProperty('baseUrl')" />/projectphoto/${command.id}" alt="" />
						</div>
						<div class="post-content">
							<div class="post-description">
								<p>
									${command.content}
								</p>
							</div>
						</div>
					</div>
					<!-- end: Post -->

				</div>

				<!-- start: Sidebar -->
				
				<div class="sidebar span4">
				
					<!-- start: Text Widget -->
					<div class="widget first">
						<img src="<spring:eval expression="@userfileConfig.getProperty('baseUrl')" />/projectthumb/${command.id}" alt="" />
						<h2>${command.title}</h2>
						<p>${command.summary}</p>
					</div>
					<!-- end: Text Widget -->
					
					<div class="widget">
						<p>
							펀딩 시작 시간 : ${command.startDate}
						</p>
						<p>
							펀딩 종료 시간 : ${command.endDate}
						</p>
						<p>
							<img src="<c:url value="/img/energy.png" />">
							목표 기금액 : ${command.targetFigure}
						</p>
					</div>
				
					<!-- start: Sidebar Menu -->
					<c:forEach items="${rewards}" var="reward">
					<div class="widget">
						<ul class="links-list-alt">
							<li>${reward.description}</li>
						</ul>
					</div>
					</c:forEach>
					<!-- end: Sidebar Menu -->
					<!-- start: Tags -->
					<div class="widget last">
						<div class="title">
							<h3>Tags</h3>
						</div>
						<div class="tags">
							<c:forEach items="${command.genres}" var="genre">
								<a href="#">${genre.tag.repTagInput.tagInputStr}</a>
							</c:forEach>
				
						</div>
					</div>
					<!-- end: Tags -->
				
				</div>
				<!-- end: Sidebar -->
			
			<!--end: Row -->
			</div>
	
		</div>
		<!-- end: Wrapper  -->
	
		<div id="wrapper">
			
		</div>
		
		<sec:authorize access="hasRole('ROLE_ADMIN')">
		<a href="<c:url value="/fund/project/${command.id}/update" />">펀드 수정</a>
		</sec:authorize>

	</body>
</html>
