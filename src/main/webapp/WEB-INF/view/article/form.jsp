<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>

	<head>
		<title>글 작성</title>
	</head>

	<body>
	
		<div id="page-title">
			<h2>글 작성</h2>
		</div>
	
		<div id="wrapper">
			<div id="content">
				
				<div class="perfectum">
			
					<div>
						<div class="box span12">
							<div class="box-header" data-original-title>
								<h2><i class="icon-edit"></i><span class="break"></span>글 작성</h2>
							</div>
							<div class="box-content">
								<form:form enctype="multipart/form-data" cssClass="form-horizontal">
									<fieldset>
									
										<div class="control-group <spring:bind path="boardId"><c:if test="${not empty status.errorMessage}">error</c:if></spring:bind>">
											<label class="control-label" for="boardId">게시판 선택</label>
											<div class="controls">
												<form:select path="boardId" cssClass="input-xlarge">
													<form:option value="">게시판을 선택하지 않았습니다.</form:option>
													<sec:authorize access="!hasRole('ROLE_ADMIN')">
													${boards.remove(0)}
													</sec:authorize>
													<form:options items="${boards}" itemLabel="name" itemValue="id" />
												</form:select>
												<form:errors path="boardId" cssClass="help-inline" />
											</div>
										</div>
										
										<div class="control-group <spring:bind path="title"><c:if test="${not empty status.errorMessage}">error</c:if></spring:bind>">
											<label class="control-label" for="title">제목</label>
											<div class="controls">
												<form:input path="title" cssClass="input-xlarge" />
												<form:errors path="title" cssClass="help-inline" />
											</div>
										</div>
										
										<div class="control-group <spring:bind path="content"><c:if test="${not empty status.errorMessage}">error</c:if></spring:bind>">
											<label class="control-label" for="content">내용</label>
											<div class="controls">
												<form:textarea path="content" cssClass="cleditor input-xxlarge" rows="12" />
												<form:errors path="content" cssClass="help-inline" />
											</div>
										</div>
										
										<div class="control-group <spring:bind path="file"><c:if test="${not empty status.errorMessage}">error</c:if></spring:bind>">
											<label class="control-label" for="file">파일 업로드</label>
											<div class="controls">
												<form:input type="file" path="file" cssClass="input-file uniform_on" />
												<form:errors path="file" cssClass="help-inline" />
											</div>
										</div>
										
										<div class="form-actions">
											<button type="submit" class="btn btn-primary">작성 완료</button>
											<button type="reset" class="btn">취소</button>
										</div>
										
									</fieldset>
								</form:form>
		
							</div>
						</div><!--/span-->
		
					</div><!--/row-->
				
				</div>
			
			</div>
		</div>

	</body>
</html>
