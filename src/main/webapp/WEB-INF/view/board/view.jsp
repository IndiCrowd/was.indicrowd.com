<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

	<head>
		<title>${command.name}</title>
		
		<style>
		.pagination li {
			margin: 0;
		}
		</style>
	</head>

	<body>
	
		<div id="page-title">
		
			<h2>${command.name}</h2>
		
		</div>
	
		<div id="wrapper">
		
			<div class="row">
				<a href="${pageContext.request.contextPath}/article/write?boardId=${command.id}" role="button" class="btn btn-large btn-primary offset10" style="margin-bottom: 15px;" data-toggle="modal"><i class="icon-pencil icon-white"></i> 글 작성</a>
			</div>
			
			<div id="content" class="row-fluid">
			
				<div class="sidebar span3">
					<div class="title"><h3>Menu</h3></div>
					<ul class="links-list-alt">
						<c:forEach items="${boards}" var="board">
							<li><a href="${pageContext.request.contextPath}/board/${board.id}">${board.name}</a></li>
						</c:forEach>
					</ul>
				</div>
				
				<div class="perfectum span9 posts">
			
					<div class="post-description"><p>${command.content}</p></div>
					<div>
						
						<div class="box">
							<div class="box-content">
							
								<table class="table table-striped">
								  <thead>
									  <tr>
										  <th>글번호</th>
										  <th style="width: 50%;">제목</th>
										  <th>작성자</th>
										  <th>작성일</th>
										  <th>조회수</th>                                          
									  </tr>
								  </thead>   
								  <tbody>
									<c:forEach items="${articleListInfo.list}" var="article">
										<tr>
											<td class="center">${article.id}</td>
											<td><a href="${pageContext.request.contextPath}/article/${article.id}">${article.title}</a></td>
											<td class="center"><a href="${pageContext.request.contextPath}/user/${article.writer.id}">${article.writer.nickname}</a></td>
											<td class="center">${article.writeDate}</td>
											<td class="center">${article.viewCount}</td>                                       
										</tr>         
									</c:forEach>                   
								  </tbody>
							 </table>  
								
								<div class="pagination pagination-centered">
								  <ul>
									<li class="${articleListInfo.page <= 1 ? 'disabled' : ''}"><a href="${pageContext.request.contextPath}/board/${command.id}/${articleListInfo.page - (articleListInfo.page <= 1 ? 0 : 1)}">Prev</a></li>
									<c:forEach begin="${articleListInfo.page < 3 ? 1 : articleListInfo.page - 2}" end="${(articleListInfo.page < 3 ? 5 : articleListInfo.page + 2) > articleListInfo.lastPage ? articleListInfo.lastPage : (articleListInfo.page < 3 ? 5 : articleListInfo.page + 2)}" var="i">
										<li class="${articleListInfo.page == i ? 'active' : ''}"><a href="${pageContext.request.contextPath}/board/${command.id}/${i}">${i}</a></li>
									</c:forEach>
									<li class="${articleListInfo.page >= articleListInfo.lastPage ? 'disabled' : ''}"><a href="${pageContext.request.contextPath}/board/${command.id}/${articleListInfo.page + (articleListInfo.page >= articleListInfo.lastPage ? 0 : 1)}">Next</a></li>
								  </ul>
								</div>
		
							</div>
						</div><!--/span-->
		
					</div><!--/row-->
				
				</div>
			
			</div>
		</div>

	</body>
</html>
