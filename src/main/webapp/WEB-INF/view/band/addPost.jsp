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
	<div class="row-fluid">
		<div class="posts span8">
			<form:form>
			<fieldset>
				<p>
					<label> Title <form:input path="title" /> 
					<spring:bind path="title">
						<span class="error">${status.errorMessage}</span>
					</spring:bind>
					</label>
				</p>
				<p>
					<label> Content <form:textarea path="content" /> 
					<spring:bind path="content">
						<span class="error">${status.errorMessage}</span>
					</spring:bind>
					</label>
				</p>
				<p>
					<label> src <form:input path="src" /> 
					<spring:bind path="src">
						<span class="error">${status.errorMessage}</span>
					</spring:bind>
					</label>
				</p>
				<p>
					<label> Type <form:select path="type" >
					<form:option value="img">이미지</form:option>
					<form:option value="avi">동영상</form:option>
					<form:option value="gal">갤러리</form:option>
					</form:select> 
					<spring:bind path="type">
						<span class="error">${status.errorMessage}</span>
					</spring:bind>
					</label>
				</p>
				<p>
					<button type="submit">생성</button>
				</p>
			</fieldset>
			</form:form>
		</div>
	

		<jsp:include page="./menu.jsp"></jsp:include>
	</div>
	<!--end: Row -->

</div>
<!-- end: Wrapper  -->