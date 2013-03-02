<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

	<head>
		<title>프로젝트 후원하기</title>
		<style>
		.reward input {
			margin-right: 5px;
		}
		.reward label {
			display: inline;
		}
		</style>
	</head>

	<body>
	
		<div id="page-title">
		
			<h2>프로젝트 후원하기</h2>
		
		</div>
	
		<div id="wrapper">
			<div id="content">
				<form:form>
					<fieldset>
						<p>
							<label>
								<h5>보상 선택</h5>
								<form:checkboxes items="${rewards}" itemLabel="description" itemValue="id" path="rewardId" element="div class=\"reward\"" />
								<spring:bind path="rewardId"><span class="error">${status.errorMessage}</span></spring:bind>
							</label>
						</p>
						<p>
							<label>
								<h5>액수</h5>
								<form:input path="amount" />
								<spring:bind path="amount"><span class="error">${status.errorMessage}</span></spring:bind>
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
