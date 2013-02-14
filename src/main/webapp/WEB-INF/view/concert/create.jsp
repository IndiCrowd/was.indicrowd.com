<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

	<head>
		<title>콘서트 생성</title>
	</head>

	<body>
	
		<div id="content">
	
			<h1>콘서트 생성</h1> 
			
			<form:form>
				<fieldset>
					<p>
						<label>
							<h5>Title</h5>
							<form:input path="title" />
							<spring:bind path="title"><span class="error">${status.errorMessage}</span></spring:bind>
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
