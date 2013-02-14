<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

	<head>
		<title>태그 생성</title>
	</head>

	<body>
	
		<div id="content">
	
			<h1>태그 생성</h1> 
			
			<form:form>
				<fieldset>
					<p>
						<label>
							<h5>태그</h5>
							<input name="tagInputStr">
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
