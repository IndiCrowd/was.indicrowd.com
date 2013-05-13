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
					
					<t:signed>
					<c:if test="${command.writer.id == principal.id}">
					<div class="form-actions">
						<a href="${pageContext.request.contextPath}/article/${command.id}/update" class="btn btn-primary">수정</a>
						<a href="${pageContext.request.contextPath}/article/${command.id}/delete" class="btn btn-danger">삭제</a>
					</div>
					</c:if>
					</t:signed>
				
				</div>
			
			</div>
		</div>

	</body>
</html>
