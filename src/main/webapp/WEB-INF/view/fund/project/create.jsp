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
	
		<div id="page-title">
		
			<h2>프로젝트 생성</h2>
		
		</div>
	
		<div id="wrapper">
			<div id="content">
		
				<form:form enctype="multipart/form-data">
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
								<h5>장르태그</h5>
								<form:input path="genresStr" cssClass="tagsStr" autocomplete="off" />
								<spring:bind path="genresStr"><span class="error">${status.errorMessage}</span></spring:bind>
							</label>
							<div>여러 태그 입력시 쉼표(,)로 구분합니다.</div>
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
							<label>
								<h5>펀딩 시작 시간</h5>
								<form:input path="startDate" cssClass="datepicker" />
								<spring:bind path="startDate"><span class="error">${status.errorMessage}</span></spring:bind>
							</label>
						</p>
						<p>
							<label>
								<h5>펀딩 종료 시간</h5>
								<form:input path="endDate" cssClass="datepicker" />
								<spring:bind path="endDate"><span class="error">${status.errorMessage}</span></spring:bind>
							</label>
						</p>
						<p>
							<label>
								<h5>목표 기금</h5>
								<form:input path="targetFigure" />
								<spring:bind path="targetFigure"><span class="error">${status.errorMessage}</span></spring:bind>
							</label>
						</p>
						<p>
							<label>
								<h5>밴드 연락처</h5>
								<form:input path="contact" />
								<spring:bind path="contact"><span class="error">${status.errorMessage}</span></spring:bind>
							</label>
						</p>
						<p>
							<button type="submit">생성</button>
						</p>
					</fieldset>
				</form:form>
			
			</div>
		</div>

	</body>
</html>
