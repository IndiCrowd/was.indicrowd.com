<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

	<head>
		<title>프로젝트 생성</title>
	</head>

	<body>
	
		<div id="content">
	
			<h1>프로젝트 생성</h1> 
			
			<form:form>
				<div class="use-preview">
					<c:if test="${command.id == null}">
					<img src="<c:url value="/img/fund/project/blank.png" />">
					</c:if>
					<c:if test="${command.id != null}">
					<img src="<spring:eval expression="@userfileConfig.baseUrl" />/projectthumb/${command.id}">
					</c:if>
					<h5>프로젝트 사진</h5>
					<form:input type="file" path="profilePhoto" />
					<spring:bind path="profilePhoto"><p class="error">${status.errorMessage}</p></spring:bind>
				</div>
				<fieldset>
					<p>
						<label>
							<h5>프로젝트명</h5>
							<form:input path="title" />
							<spring:bind path="title"><span class="error">${status.errorMessage}</span></spring:bind>
						</label>
					</p>
					<p>
						<label>
							<h5>프로젝트 요약</h5>
							<form:textarea path="summary" />
							<spring:bind path="summary"><span class="error">${status.errorMessage}</span></spring:bind>
						</label>
					</p>
					<p>
						<label>
							<h5>프로젝트 내용</h5>
							<form:textarea path="content" />
							<spring:bind path="content"><span class="error">${status.errorMessage}</span></spring:bind>
						</label>
					</p>
					<p>
						<button type="submit">생성</button>
					</p>
				</fieldset>
			</form:form>
		
		</div>

	</body>
</html>
