<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- start: Page Title -->
<div id="page-title">

	<h2>밴드 생성</h2>

</div>
<!-- end: Page Title -->

<!--start: Wrapper-->
<div id="wrapper">
	<div id="content">

		<div class="perfectum">

			<div>
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2>
							<i class="icon-edit"></i><span class="break"></span>프로젝트 생성
						</h2>
					</div>
					<div class="box-content">
						<form:form enctype="multipart/form-data" cssClass="form-horizontal">
							<fieldset>
								<div class="control-group use-preview <spring:bind path="profilePhoto"><c:if test="${not empty status.errorMessage}">error</c:if></spring:bind>">
									<label class="control-label" for="profilePhoto">밴드 프로필 사진</label>
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
								
								<div class="control-group <spring:bind path="name"><c:if test="${not empty status.errorMessage}">error</c:if></spring:bind>">
									<label class="control-label" for="name">밴드명</label>
									<div class="controls">
										<form:input path="name" cssClass="input-xlarge" />
										<form:errors path="name" cssClass="help-inline" />
									</div>
								</div>
								<div class="control-group <spring:bind path="bandMember"><c:if test="${not empty status.errorMessage}">error</c:if></spring:bind>">
									<label class="control-label" for="name">밴드 멤버</label>
									<div class="controls">
										<form:input path="bandMember" cssClass="input-xlarge" />
										<form:errors path="bandMember" cssClass="help-inline" />
										<div class="help-block">밴드 구성원을 적어보세요! 예)김철수(기타), 김영희(보컬)</div>
									</div>
								</div>
								<div class="control-group <spring:bind path="description"><c:if test="${not empty status.errorMessage}">error</c:if></spring:bind>">
									<label class="control-label" for="description">밴드 소개</label>
									<div class="controls">
										<form:textarea path="description" cssClass="input-xxlarge" rows="6" />
										<form:errors path="description" cssClass="help-inline" />
									</div>
								</div>
								<div class="control-group <spring:bind path="category"><c:if test="${not empty status.errorMessage}">error</c:if></spring:bind>">
									<label class="control-label" for="category">장르 태그</label>
									<div class="controls">
										<div class="input-prepend">
											<span class="add-on"><i class="fa-icon-tags"></i></span>
											<form:input path="category" cssClass="input-xlarge" />
										</div>
										<form:errors path="category" cssClass="help-inline" />
										<div class="help-block">ex)"락 발라드 펑키" 처럼 입력해보세요! 태그는 띄어쓰기로 구분합니다.</div>
									</div>
								</div>
								<div class="form-actions">
											<button type="submit" class="btn btn-primary">밴드 만들기!</button>
											<button type="reset" class="btn">취소</button>
										</div>
							</fieldset>
						</form:form>
					</div>
				</div>
				<!--/span-->

			</div>
			<!--/row-->

		</div>
	</div>
</div>