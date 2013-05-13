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
										  <th style="width: 60%;">제목</th>
										  <th>작성자</th>
										  <th>작성일</th>
										  <th>조회수</th>                                          
									  </tr>
								  </thead>   
								  <tbody>
									<c:forEach items="${articleListInfo.list}" var="article">
										<tr>
											<td class="center">${article.id}</td>
											<td>${article.title}</td>
											<td class="center">${article.writer.nickname}</td>
											<td class="center">${article.writeDate}</td>
											<td class="center">${article.viewCount}</td>                                       
										</tr>         
									</c:forEach>                   
								  </tbody>
							 </table>  
								
								<div class="pagination pagination-centered">
								  <ul>
									<li><a href="#">Prev</a></li>
									<li class="active">
									  <a href="#">1</a>
									</li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">Next</a></li>
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
