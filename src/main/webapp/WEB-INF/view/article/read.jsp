<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<sec:authentication property="principal" var="principal" />

<!DOCTYPE html>
<html>

	<head>
		<title>${command.title}</title>
		<script>
			$(function() {
				
				RTW.join('Comment', 'article-${command.id}');
				
				RTW.addHandler('Comment', 'article-${command.id}', 'new', function(comment) {
					var tr = $TR({
						id : 'comment-' + comment.id
					}, $TD({
						cls : 'center'
					}, $A({href: '${pageContext.request.contextPath}/user/' + comment.writer.id}, comment.writer.nickname)), $TD({
						cls : 'center'
					}, comment.content<t:signed> + ' ', comment.writer.id == ${principal.id} ? $A({href: 'javascript:deleteComment(' + comment.id + '); void(0)'}, '[삭제]') : ''</t:signed>), $TD({
						cls : 'center'
					}, comment.writeDate)).appendTo('#comment-list');
					
					tr.hide();
					tr.fadeIn();
				});
				
				RTW.addHandler('Comment', 'article-${command.id}', 'remove', function(comment) {
					$('#comment-' + comment.id).fadeOut(function() {
						$(this).remove();
					});
				});
				
				$('#commentForm').submit(function() {
					
					var data = form2js(this);
					var contentInput = $('#commentForm input[name="content"]');
					
					contentInput.attr('disabled', 'disabled');
					contentInput.val('댓글 등록 중입니다...');
					
					POST('${pageContext.request.contextPath}/comment/write', data, function() {
						contentInput.val('');
						contentInput.removeAttr('disabled');
						contentInput.focus();
						contentInput.select();
					});
					
					return false;
				});
			});
			
			function deleteComment(id) {
				if (confirm('정말 삭제 하시겠습니까?')) {
					DEL('${pageContext.request.contextPath}/comment/' + id);
				}
			}
		</script>
	</head>

	<body>
	
		<div id="page-title">
			<h2>${command.title}</h2>
		</div>
	
		<div id="wrapper">
			<div id="content">
				
				<div class="perfectum">
			
					<div>
						<div class="box span12">
							<div class="box-header" data-original-title>
								<h2><i class="icon-edit"></i><span class="break"></span>${command.title}</h2>
							</div>
							<div class="box-content">
								${command.content.replaceAll('\\n', '<br>')}
							</div>
							
						
							<c:if test="${command.hasFile}">
							<div style="padding: 10px 10px 0 10px;">
							<a href="<spring:eval expression="@userfileConfig.baseUrl" />/articlefile/${command.id}" target="_blank">첨부파일: ${command.filename}</a>
							</div>
							</c:if>
						
						</div><!--/span-->
		
					</div><!--/row-->
					
					<div class="form-actions">
						<a href="javascript:history.back(); void(0)" class="btn">뒤로</a>
						<t:signed>
						<c:if test="${command.writer.id == principal.id}">
						<a href="${pageContext.request.contextPath}/article/${command.id}/update" class="btn btn-primary">수정</a>
						<a href="${pageContext.request.contextPath}/article/${command.id}/delete" class="btn btn-danger">삭제</a>
						</c:if>
						</t:signed>
					</div>
					
					<div style="margin-top: 20px;">
						<div class="box span12">
							<div class="box-content">
								<table class="table table-striped">
								  <thead>
									  <tr>
									      <th>작성자</th>
										  <th style="width: 70%;">댓글</th>
										  <th>작성일</th>
									  </tr>
								  </thead>   
								  <tbody id="comment-list">
									<c:forEach items="${commentListInfo.list}" var="comment">
										<tr id="comment-${comment.id}">
											<td class="center"><a href="${pageContext.request.contextPath}/user/${comment.writer.id}">${comment.writer.nickname}</a></td>
											<td class="center">${comment.content}<t:signed><c:if test="${comment.writer.id == principal.id}"> <a href="javascript:deleteComment(${comment.id}); void(0)">[삭제]</a></c:if></t:signed></td>
											<td class="center">${comment.writeDate}</td>                 
										</tr>
									</c:forEach>                   
								  </tbody>
							 </table>  
							</div>
						</div><!--/span-->
					</div>
					
					<div class="form-actions">
					<sec:authorize access="isAuthenticated()">
						<form id="commentForm" class="form-horizontal">
							<input type="hidden" name="articleId" value="${command.id}" />
							<input type="text" name="content" class="input-xxlarge" style="margin-top: 10px;" />
							<button type="submit" class="btn btn-primary" style="margin-top: 10px;">등록</button>
						</form>
					</sec:authorize>
					</div>
				
				</div>
			
			</div>
		</div>

	</body>
</html>
