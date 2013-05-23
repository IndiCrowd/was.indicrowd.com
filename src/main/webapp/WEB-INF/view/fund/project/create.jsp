<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

	<head>
		<title>프로젝트 생성</title>
		<style>
		#content {
			overflow: auto;
			padding-bottom: 50px;
		}
		</style>
	</head>

	<body>
	
		<div id="page-title">
		
			<h2>프로젝트 생성</h2>
		
		</div>
	
		<div id="wrapper">
			<div id="content">
				
				<div class="perfectum">
			
					<div>
						<div class="box span12">
							<div class="box-header" data-original-title>
								<h2><i class="icon-edit"></i><span class="break"></span>프로젝트 생성</h2>
							</div>
							<div class="box-content">
								<form:form enctype="multipart/form-data" cssClass="form-horizontal">
									<fieldset>
										
										<div class="control-group use-preview <spring:bind path="profilePhoto"><c:if test="${not empty status.errorMessage}">error</c:if></spring:bind>">
											<label class="control-label" for="profilePhoto">프로젝트 사진</label>
											<div class="controls">
												<form:input type="file" path="profilePhoto" cssClass="input-file uniform_on" />
												<form:errors path="profilePhoto" cssClass="help-inline" />
												<p style="margin-top:10px;">
													<c:if test="${command.id == null}">
													<img class="img-polaroid" style="width:180px; height:180px;" src="<c:url value="/img/fund/project/blank.png" />">
													</c:if>
													<c:if test="${command.id != null}">
													<img class="img-polaroid" style="width:180px; height:180px;" src="<spring:eval expression="@userfileConfig.baseUrl" />/projectthumb/${command.id}">
													</c:if>
												</p>
											</div>
										</div>
										
										<div class="control-group <spring:bind path="title"><c:if test="${not empty status.errorMessage}">error</c:if></spring:bind>">
											<label class="control-label" for="title">프로젝트명</label>
											<div class="controls">
												<form:input path="title" cssClass="input-xlarge" />
												<form:errors path="title" cssClass="help-inline" />
											</div>
										</div>
										
										<div class="control-group <spring:bind path="genresStr"><c:if test="${not empty status.errorMessage}">error</c:if></spring:bind>">
											<label class="control-label" for="genresStr">장르태그</label>
											<div class="controls">
												<div class="input-prepend">
													<span class="add-on"><i class="fa-icon-tags"></i></span>
													<form:input path="genresStr" cssClass="tagsStr input-xxlarge" autocomplete="off" />
												</div>
												<form:errors path="genresStr" cssClass="help-inline" />
												<div class="help-block">여러 태그 입력시 쉼표(,)로 구분합니다.</div>
											</div>
										</div>
										
										<div class="control-group <spring:bind path="summary"><c:if test="${not empty status.errorMessage}">error</c:if></spring:bind>">
											<label class="control-label" for="summary">프로젝트 요약</label>
											<div class="controls">
												<form:textarea path="summary" cssClass="input-xxlarge" rows="6" />
												<form:errors path="summary" cssClass="help-inline" />
											</div>
										</div>
										
										<div class="control-group <spring:bind path="startDate"><c:if test="${not empty status.errorMessage}">error</c:if></spring:bind>">
											<label class="control-label" for="startDate">후원 시작 시간</label>
											<div class="controls">
												<div class="input-prepend">
													<span class="add-on"><i class="icon-time"></i></span>
													<form:input path="startDate" cssClass="datetimepicker" />
												</div>
												<form:errors path="startDate" cssClass="help-inline" />
											</div>
										</div>
										
										<div class="control-group <spring:bind path="endDate"><c:if test="${not empty status.errorMessage}">error</c:if></spring:bind>">
											<label class="control-label" for="endDate">후원 종료 시간</label>
											<div class="controls">
												<div class="input-prepend">
													<span class="add-on"><i class="icon-time"></i></span>
													<form:input path="endDate" cssClass="datetimepicker" />
												</div>
												<form:errors path="endDate" cssClass="help-inline" />
											</div>
										</div>
										
										<div class="control-group <spring:bind path="targetFigure"><c:if test="${not empty status.errorMessage}">error</c:if></spring:bind>">
											<label class="control-label" for="targetFigure">목표 기금</label>
											<div class="controls">
												<div class="input-append">
													<input type="text" id="targetFigure" name="targetFigure" style="text-align: right;" value="${command.targetFigure == 0 ? '' : command.targetFigure}">
													<span class="add-on">원</span>
												</div>
												<form:errors path="targetFigure" cssClass="help-inline" />
											</div>
										</div>
										
										<div class="control-group <spring:bind path="contact"><c:if test="${not empty status.errorMessage}">error</c:if></spring:bind>">
											<label class="control-label" for="contact">밴드 연락처</label>
											<div class="controls">
												<div class="input-prepend">
													<span class="add-on"><i class="fa-icon-phone"></i></span>
													<form:input path="contact" />
												</div>
												<form:errors path="contact" cssClass="help-inline" />
											</div>
										</div>
										
<option>우리은행</option>
<option>경남은행</option>
<option>광주은행</option>
<option>국민(주택)은행</option>
<option>기업은행</option>
<option>농협</option>
<option>대구은행</option>
<option>도이치은행</option>
<option>부산은행</option>
<option>비엔피파리바은행</option>
<option>산림조합</option>
<option>산업은행</option>
<option>상호저축은행</option>
<option>새마을금고</option>
<option>수출입은행</option>
<option>수협중앙회</option>
<option>신용협동조합</option>
<option>신한(조흥)은행</option>
<option>외환은행</option>
<option>우체국</option>
<option>전북은행</option>
<option>제주은행</option>
<option>하나(서울)은행</option>
<option>한국씨티은행(한미)</option>
<option>BOA(뱅크오브아메리카)</option>
<option>HSBC은행</option>
<option>JP모간체이스은행</option>
<option>SC은행(SC제일)</option>
<option>우리투자증권</option>
<option>교보증권</option>
<option>대신증권</option>
<option>대우증권</option>
<option>동부증권</option>
<option>동양증권</option>
<option>메리츠증권</option>
<option>미래에셋증권</option>
<option>부국증권</option>
<option>삼성증권</option>
<option>신영증권</option>
<option>신한금융투자</option>
<option>아이엠투자증권</option>
<option>유진투자증권</option>
<option>이트레이드증권</option>
<option>키움증권</option>
<option>하나대투증권</option>
<option>하이투자증권</option>
<option>한국투자증권</option>
<option>한화증권</option>
<option>현대증권</option>
<option>HMC투자증권</option>
<option>LIG투자증권</option>
<option>NH농협증권</option>
<option>SK증권</option>
										
										<div class="control-group <spring:bind path="content"><c:if test="${not empty status.errorMessage}">error</c:if></spring:bind>">
											<label class="control-label" for="content">프로젝트 상세 내용</label>
											<div class="controls">
												<form:textarea path="content" cssClass="cleditor input-xxlarge" rows="6" />
												<form:errors path="content" cssClass="help-inline" />
											</div>
										</div>
										
										
										<div class="form-actions">
											<button type="submit" class="btn btn-primary">프로젝트 생성</button>
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
