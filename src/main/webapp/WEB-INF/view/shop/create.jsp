<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

	<head>
		<title>상점 생성</title>
		<style>
		#content {
			overflow: auto;
			padding-bottom: 50px;
		}
		</style>
	</head>

	<body>
	
		<div id="page-title">
		
			<h2>상점 생성</h2>
		
		</div>
	
		<div id="wrapper">
			<div id="content">
				
				<div class="perfectum">
			
					<div>
						<div class="box span12">
							<div class="box-header" data-original-title>
								<h2><i class="icon-edit"></i><span class="break"></span>상점 생성</h2>
							</div>
							<div class="box-content">
								<form:form cssClass="form-horizontal">
									<fieldset>
										
										<div class="control-group <spring:bind path="name"><c:if test="${not empty status.errorMessage}">error</c:if></spring:bind>">
											<label class="control-label" for="name">상점 명</label>
											<div class="controls">
												<form:input path="name" cssClass="input-xlarge" />
												<form:errors path="name" cssClass="help-inline" />
											</div>
										</div>
										
										<div class="form-actions">
											<button type="submit" class="btn btn-primary">상점 생성</button>
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
