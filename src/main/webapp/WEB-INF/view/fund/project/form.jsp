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
		
			<h2>후원 받을 프로젝트 등록하기</h2>
		
		</div>
	
		<div id="wrapper">
			<div id="content">
				
				<div class="perfectum">
			
					<div>
						<div class="box span12">
							<div class="box-header" data-original-title>
								<h2><i class="icon-edit"></i><span class="break"></span>후원 받을 프로젝트 등록하기</h2>
							</div>
							<div class="box-content">
								<form:form enctype="multipart/form-data" cssClass="form-horizontal">
									<fieldset>
										
										<div class="control-group use-preview <spring:bind path="profilePhoto"><c:if test="${not empty status.errorMessage}">error</c:if></spring:bind>">
											<label class="control-label" for="profilePhoto">대표사진</label>
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
										
										<div class="control-group <spring:bind path="bankName"><c:if test="${not empty status.errorMessage}">error</c:if></spring:bind>">
											<label class="control-label" for="bankName">은행 선택</label>
											<div class="controls">
												<div class="input-prepend">
													<form:select path="bankName">
														<form:option value="">은행을 선택해주세요.</form:option>
														<form:option value="경남은행">경남은행</form:option>
														<form:option value="광주은행">광주은행</form:option>
														<form:option value="국민(주택)은행">국민(주택)은행</form:option>
														<form:option value="기업은행">기업은행</form:option>
														<form:option value="농협">농협</form:option>
														<form:option value="대구은행">대구은행</form:option>
														<form:option value="도이치은행">도이치은행</form:option>
														<form:option value="부산은행">부산은행</form:option>
														<form:option value="비엔피파리바은행">비엔피파리바은행</form:option>
														<form:option value="산림조합">산림조합</form:option>
														<form:option value="산업은행">산업은행</form:option>
														<form:option value="상호저축은행">상호저축은행</form:option>
														<form:option value="새마을금고">새마을금고</form:option>
														<form:option value="수출입은행">수출입은행</form:option>
														<form:option value="수협중앙회">수협중앙회</form:option>
														<form:option value="신용협동조합">신용협동조합</form:option>
														<form:option value="신한(조흥)은행">신한(조흥)은행</form:option>
														<form:option value="외환은행">외환은행</form:option>
														<form:option value="우리은행">우리은행</form:option>
														<form:option value="우체국">우체국</form:option>
														<form:option value="전북은행">전북은행</form:option>
														<form:option value="제주은행">제주은행</form:option>
														<form:option value="하나(서울)은행">하나(서울)은행</form:option>
														<form:option value="한국씨티은행(한미)">한국씨티은행(한미)</form:option>
														<form:option value="BOA(뱅크오브아메리카)">BOA(뱅크오브아메리카)</form:option>
														<form:option value="HSBC은행">HSBC은행</form:option>
														<form:option value="JP모간체이스은행">JP모간체이스은행</form:option>
														<form:option value="SC은행(SC제일)">SC은행(SC제일)</form:option>
														<form:option value="우리투자증권">우리투자증권</form:option>
														<form:option value="교보증권">교보증권</form:option>
														<form:option value="대신증권">대신증권</form:option>
														<form:option value="대우증권">대우증권</form:option>
														<form:option value="동부증권">동부증권</form:option>
														<form:option value="동양증권">동양증권</form:option>
														<form:option value="메리츠증권">메리츠증권</form:option>
														<form:option value="미래에셋증권">미래에셋증권</form:option>
														<form:option value="부국증권">부국증권</form:option>
														<form:option value="삼성증권">삼성증권</form:option>
														<form:option value="신영증권">신영증권</form:option>
														<form:option value="신한금융투자">신한금융투자</form:option>
														<form:option value="아이엠투자증권">아이엠투자증권</form:option>
														<form:option value="유진투자증권">유진투자증권</form:option>
														<form:option value="이트레이드증권">이트레이드증권</form:option>
														<form:option value="키움증권">키움증권</form:option>
														<form:option value="하나대투증권">하나대투증권</form:option>
														<form:option value="하이투자증권">하이투자증권</form:option>
														<form:option value="한국투자증권">한국투자증권</form:option>
														<form:option value="한화증권">한화증권</form:option>
														<form:option value="현대증권">현대증권</form:option>
														<form:option value="HMC투자증권">HMC투자증권</form:option>
														<form:option value="LIG투자증권">LIG투자증권</form:option>
														<form:option value="NH농협증권">NH농협증권</form:option>
														<form:option value="SK증권">SK증권</form:option>
													</form:select>
												</div>
												<form:errors path="bankName" cssClass="help-inline" />
											</div>
										</div>
										
										<div class="control-group <spring:bind path="accountNumber"><c:if test="${not empty status.errorMessage}">error</c:if></spring:bind>">
											<label class="control-label" for="accountNumber">계좌번호</label>
											<div class="controls">
												<div class="input-prepend">
													<form:input path="accountNumber" />
												</div>
												<form:errors path="accountNumber" cssClass="help-inline" />
											</div>
										</div>
										
										<div class="control-group <spring:bind path="accountName"><c:if test="${not empty status.errorMessage}">error</c:if></spring:bind>">
											<label class="control-label" for="accountName">계좌주 이름</label>
											<div class="controls">
												<div class="input-prepend">
													<form:input path="accountName" />
												</div>
												<form:errors path="accountName" cssClass="help-inline" />
											</div>
										</div>
										
										<div class="control-group <spring:bind path="content"><c:if test="${not empty status.errorMessage}">error</c:if></spring:bind>">
											<label class="control-label" for="content">프로젝트 상세 내용<br><span style="font-size: 10px;">어떤 프로젝트를 진행하시나요?</span></label>
											<div class="controls">
												<form:textarea path="content" cssClass="cleditor input-xxlarge" rows="6" />
												<form:errors path="content" cssClass="help-inline" />
											</div>
										</div>
										
										
										<div class="form-actions">
											<button type="submit" class="btn btn-primary">등록 완료</button>
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
