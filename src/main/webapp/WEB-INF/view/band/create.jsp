<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- start: Page Title -->
<div id="page-title">

	<h2>밴드</h2>

</div>
<!-- end: Page Title -->

<!--start: Wrapper-->
<div id="wrapper">
	<div id="content">

		<h1>콘서트 생성</h1>

		<form:form>
			<fieldset>
				<p>
					<label> Name <form:input path="name" /> 
					<spring:bind path="name">
						<span class="error">${status.errorMessage}</span>
					</spring:bind>
					</label>
				</p>
				<p>
					<label> Description <form:textarea path="description" /> 
					<spring:bind path="description">
						<span class="error">${status.errorMessage}</span>
					</spring:bind>
					</label>
				</p>
				<p>
					<label> Category <form:input path="category" /> 
					<spring:bind path="category">
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
</div>