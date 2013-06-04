<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<sec:authentication property="principal" var="principal" />


<!--start: Wrapper-->
<div id="wrapper">
	<!--start: Row -->
	<div class="row-fluid perfectum">
		<div class="posts span8">
			<form:form cssClass="form-horizontal">
			<fieldset>
				<div class="control-group <spring:bind path="title"><c:if test="${not empty status.errorMessage}">error</c:if></spring:bind>">
					<label class="control-label" for="title">글제목</label>
					<div class="controls">
						<form:input path="title" cssClass="input-xlarge" />
						<form:errors path="title" cssClass="help-inline" />
					</div>
				</div>
				<div class="control-group <spring:bind path="content"><c:if test="${not empty status.errorMessage}">error</c:if></spring:bind>">
					<label class="control-label" for="content">글내용</label>
					<div class="controls">
						<form:textarea path="content" cssClass="cleditor input-xxlarge" rows="6"/>
						<form:errors path="content" cssClass="help-inline" />
					</div>
				</div>
				<div style="display:none">
				<div class="control-group <spring:bind path="src"><c:if test="${not empty status.errorMessage}">error</c:if></spring:bind>">
					<label class="control-label" for="src">외부 이미지 url</label>
					<div class="controls">
						<form:textarea path="src" cssClass="input-xlarge" />
						<form:errors path="src" cssClass="help-inline" />
					</div>
				</div>
				<div class="control-group <spring:bind path="type"><c:if test="${not empty status.errorMessage}">error</c:if></spring:bind>">
					<label class="control-label" for="type">Type</label>
					<div class="controls">
						<form:select path="type" >
					<form:option value="img">이미지</form:option>
					<form:option value="avi">동영상</form:option>
					<form:option value="gal">갤러리</form:option>
					</form:select> 
					<spring:bind path="type">
						<span class="error">${status.errorMessage}</span>
					</spring:bind>
					</div>
				</div>
				</div>
				<div class="form-actions">
					<button type="submit" class="btn btn-primary">글쓰기!</button>
					<button type="reset" class="btn">취소</button>
				</div>
			</fieldset>
			</form:form>
		</div>
	

		<jsp:include page="./menu.jsp"></jsp:include>
	</div>
	<!--end: Row -->

</div>
<!-- end: Wrapper  -->