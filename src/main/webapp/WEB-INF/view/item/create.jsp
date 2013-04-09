<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

	<head>
		<title>아이템 생성</title>
		<style>
		#content {
			overflow: auto;
			padding-bottom: 50px;
		}
		</style>
	</head>

	<body>
	
		<div id="page-title">
		
			<h2>아이템 생성</h2>
		
		</div>
	
		<div id="wrapper">
			<div id="content">
				
				<div class="perfectum">
			
					<div>
						<div class="box span12">
							<div class="box-header" data-original-title>
								<h2><i class="icon-edit"></i><span class="break"></span>아이템 생성</h2>
							</div>
							<div class="box-content">
								<form:form enctype="multipart/form-data" cssClass="form-horizontal">
									<fieldset>
									
										<div class="control-group <spring:bind path="shopId"><c:if test="${not empty status.errorMessage}">error</c:if></spring:bind>">
											<label class="control-label" for="shopId">상점 선택</label>
											<div class="controls">
												<form:select path="shopId" cssClass="input-xlarge">
													<form:option value="">상점을 선택하지 않았습니다.</form:option>
													<form:options items="${shops}" itemLabel="name" itemValue="id" />
												</form:select>
												<form:errors path="shopId" cssClass="help-inline" />
											</div>
										</div>
									
										<div class="control-group use-preview <spring:bind path="profilePhoto"><c:if test="${not empty status.errorMessage}">error</c:if></spring:bind>">
											<label class="control-label" for="profilePhoto">아이템 이미지</label>
											<div class="controls">
												<form:input type="file" path="profilePhoto" cssClass="input-file uniform_on" />
												<form:errors path="profilePhoto" cssClass="help-inline" />
												<p style="margin-top:10px;">
													<c:if test="${command.id == null}">
													<img class="img-polaroid" style="width:180px; height:180px;" src="<c:url value="/img/fund/project/blank.png" />">
													</c:if>
													<c:if test="${command.id != null}">
													<img class="img-polaroid" style="width:180px; height:180px;" src="<spring:eval expression="@userfileConfig.baseUrl" />/itemphoto/${command.id}">
													</c:if>
												</p>
											</div>
										</div>
										
										<p>
											한 프레임이 150 * 150인 이미지만 올려주세요.
										</p>
										
										<div class="control-group use-preview <spring:bind path="image"><c:if test="${not empty status.errorMessage}">error</c:if></spring:bind>">
											<label class="control-label" for="image">프레임 이미지</label>
											<div class="controls">
												<form:input type="file" path="image" cssClass="input-file uniform_on" />
												<form:errors path="image" cssClass="help-inline" />
												<p style="margin-top:10px;">
													<c:if test="${command.id == null}">
													<img class="img-polaroid" style="width:180px; height:180px;" src="<c:url value="/img/fund/project/blank.png" />">
													</c:if>
													<c:if test="${command.id != null}">
													<img class="img-polaroid" style="width:180px; height:180px;" src="<spring:eval expression="@userfileConfig.baseUrl" />/itemimage/${command.id}">
													</c:if>
												</p>
											</div>
										</div>
										
										<div class="control-group <spring:bind path="name"><c:if test="${not empty status.errorMessage}">error</c:if></spring:bind>">
											<label class="control-label" for="name">아이템 명</label>
											<div class="controls">
												<form:input path="name" cssClass="input-xlarge" />
												<form:errors path="name" cssClass="help-inline" />
											</div>
										</div>
										
										<div class="control-group <spring:bind path="frameCount"><c:if test="${not empty status.errorMessage}">error</c:if></spring:bind>">
											<label class="control-label" for="frameCount">프레임 수</label>
											<div class="controls">
												<form:input path="frameCount" cssClass="input-xlarge" />
												<form:errors path="frameCount" cssClass="help-inline" />
											</div>
										</div>
										
										<div class="form-actions">
											<button type="submit" class="btn btn-primary">아이템 생성</button>
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
